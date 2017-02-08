 
    # -*- encoding: UTF-8 -*-
""" the robot show the emotion on a person infront of him using his face 
characteristics
"""

import sys
import time
import os


from naoqi import ALProxy
from naoqi import ALBroker
from naoqi import ALModule

from optparse import OptionParser


IP = "195.168.0.1"


# Global variable to store the HumanGreeter module instance
GetEmotion = None


class GetEmotionModule(ALModule):
    """ A simple module able to show people emotions
    
    """
    def __init__(self, name):
        ALModule.__init__(self, name)
        
        #Declaration of module to be use
        try:
        # Create a proxy to ALTextToSpeech to say texts
            self.tts = ALProxy("ALTextToSpeech")
        
        except Exception as e:
           print "An error occur when creating ALTextToSpeech module." 
           print str(e)
           exit(1)
        try:
        #Get the ALFaceCharacteristics module in order to analye faces 
        #and get emotions
            self.faceC = ALProxy("ALFaceCharacteristics")
        #you have to be connect to a reel robot ifnot, an exception will occur
        except Exception as e:
           print "Make sure you're not connected to a virtual robot." 
           print str(e)
           exit(1)
        
        #get frame module to display images.If an error occur, we display it in the console
        self.frameManager = None
        try:
            self.frameManager = ALProxy("ALFrameManager")
        except Exception as e:
           print(e)
           exit(1)
           
        #declaration of emotion to be found by the robot and their parameters
        #emotions table
        self.emotions = ["neutral", "happy", "surprised", "angry", "sad","scared"]
        #in the variable name confidence, we store the confidence Thereshold 
        #of the robot.
        self.confidence = 0.5
        #we use the preceding confidence variable to define confidence threshold for each emotion to be detected.
        #Note that, because some emotions are more difficults to detect that order, the confidence threshold couldn't have the same value.Emotions more difficult to detect will have smaller confidence
        self.threshNeutralEmotion = self.confidence + 0.15
        self.threshHappyEmotion = self.confidence
        self.threshSurprisedEmotion = self.confidence + 0.05
        self.threshAngryEmotion = self.confidence + 0.2
        self.threshSadEmotion = self.confidence + 0.15
        #self.threshScaredEmotion = self.confidence + 0.15
        
        #defintion of others use variables
        #this variable counter is use to capture and analyse several times faces in order to avoid mistakes
        self.counter = 0
        #this variable is used for states: running and not
        self.bIsRunning = False
        self.newGame = True
        self.delayed = []
        self.errorMes = ""
        
    #this method is used to get the service ALTabletService which allow
    #the use of the robot tablet.If an error occur, we display it on the console
    #the tablet service is return.
    def getTabletService(self):
        """ This will create a session on tablet service
        
        """
        tabletService = None
        try:
            tabletService = self.session().service("ALTabletService")
        except Exception as e:
            print str(e)
        return tabletService

    #this method is use to get absolute url of the image to be display on 
    #the robot screen.It take in parameter the current objet and the relative url.
    def getAbsoluteUrl(self, partial_url):
        """ This will create an absolute url to get images
        """
        subPath = os.path.join(self.packageUid(), os.path.normpath(partial_url).lstrip("\\/"))
        # We create TabletService here in order to avoid
        # problems with connections and disconnections of the tablet during the life of the application
        return "http://%s/apps/%s" %(self.getTabletService().robotIp(), subPath.replace(os.path.sep, "/"))
    
    def main(self):
        """ Main entry point
        
        """
        #self.ttx.say("look at me and will try to get your emotions")
        #time.sleep(2.0)
        # We create TabletService here in order to avoid
        # problems with connections and disconnections of the tablet during the life of the application
        #while(1):
        tabletService = self.getTabletService()
        tabletService.hideWebview()
        url = "images/"
        try:
            #start timer
            import qi
            import functools
            delay_future = qi.async(self.onTimeout, delay=int(self.getParameter("Timeout (s)") * 1000 * 1000))
            self.delayed.append(delay_future)
            bound_clean = functools.partial(self.cleanDelay, delay_future)
            delay_future.addCallback(bound_clean)
            #table with the value of each emotion detected by the robot.Initialy,they are all null
            self.tProperties = [0,0,0,0,0]
            self.bIsRunning = True
            while self.bIsRunning:
                #we will captured and analyse four times each face in order to determine an emotion
                if self.counter < 4:
                    try:
                        #identify user
                        ids = ALMemory.getData("PeoplePerception/PeopleList")
                        if len(ids) == 0:
                            self.errorMes = "No face detected"
                            self.onUnload()
                        elif len(ids) > 1:
                            self.errorMes = "Multiple faces detected"
                            self.onUnload()
                        else:
                            #analyze age properties
                            self.faceC.analyzeFaceCharacteristics(ids[0])
                            time.sleep(0.2)
                            properties = ALMemory.getData("PeoplePerception/Person/"+str(ids[0])+"/ExpressionProperties")
                            self.tProperties[0] += properties[0]
                            self.tProperties[1] += properties[1]
                            self.tProperties[2] += properties[2]
                            self.tProperties[3] += properties[3]
                            self.tProperties[4] += properties[4]
                           # self.tProperties[5] += properties[5]
                            self.counter += 1
                    except:
                        ids = []
                else:
                    self.counter = 0
                    recognized = [0,0,0,0,0]
                    #calculate mean value for neutral, happy, surprised,scared, angry or sad
                    self.tProperties[0] /= 4
                    self.tProperties[1] /= 4
                    self.tProperties[2] /= 4
                    self.tProperties[3] /= 4
                    self.tProperties[4] /= 4
                    #self.tProperties[5] /= 5

                    if self.getParameter("neutral") and self.tProperties[0] > self.threshNeutralEmotion:
                        recognized[0] = self.tProperties[0]
                    if self.getParameter("happy") and self.tProperties[1] >self.threshHappyEmotion:
                        recognized[1] = self.tProperties[1]
                    if self.getParameter("surprised") and self.tProperties[2] > self.threshSurprisedEmotion:
                        recognized[2] = self.tProperties[2]
                    if self.getParameter("angry") and self.tProperties[3] > self.threshAngryEmotion:
                        recognized[3] = self.tProperties[3]
                    if self.getParameter("sad") and self.tProperties[4] > self.threshSadEmotion:
                        recognized[4] = self.tProperties[4]
                   # if self.getParameter("scared") and self.tProperties[5] > self.threshScaredEmotion:
                       # recognized[5] = self.tProperties[5]

                    self.tProperties = [0,0,0,0,0]
                    try:
                        if recognized != [0,0,0,0,0]:
                            emotion = self.emotions[recognized.index(max(recognized))]
                            if(emotion == "surprised"):
                                url += "surprise"
                            #elif(emotion == "scared"):
                                #url = "scare"
                            else:
                                url += emotion
                            if tabletService:
                                try:
                                    url += ".png"
                                    self.logger.info(url)
                                    if url == '':
                                        self.logger.error("URL of the image is empty")
                                    if not url.startswith('http'):
                                        url = self._getAbsoluteUrl(url)
                                    tabletService.showImage(url)
                                    #tabletService.pauseGif()
                                except Exception as err:
                                    self.logger.error("Error during ShowImage : %s " % err)
                                #self.onStopped()
                            else:
                                self.logger.warning("No ALTabletService, can't display the image.")
                                self.onStopped()
                        else:
                            emotion = None
                    except:
                        emotion = None
                    try:
                        ALMemory.removeData("PeoplePerception/Person/"+str(ids[0])+"/ExpressionProperties")
                    except:
                        pass
                    if emotion != None:
                        self.onStopped(emotion)
                        self.onUnload()
                        #return
            raise RuntimeError(self.errorMes)
        except Exception as e:
            raise RuntimeError(str(e))
            self.onUnload()
    
if __name__ == "__main__":
    pip   = IP
    pport = PORT

    # We need this broker to be able to construct
    # NAOqi modules and subscribe to other modules
    # The broker must stay alive until the program exists
    myBroker = ALBroker("myBroker",
       "0.0.0.0",   # listen to anyone
       0,           # find a free port and use it
       pip,         # parent broker IP
       pport)       # parent broker port


    # Warning: GetEmotion must be a global variable
    # The name given to the constructor must be the name of the
    # variable
    GetEmotion = GetEmotionModule("GetEmotion")
    GetEmotion.main()
