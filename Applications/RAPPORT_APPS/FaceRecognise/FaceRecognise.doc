class MyClass(GeneratedClass):
    def __init__(self):
        GeneratedClass.__init__(self, False)
        self.session = qi.Session()
        self.session.connect("192.168.1.101:9559")#replace the ip adress and port by your robot ones

        self.memory = self.session.service("ALMemory")
        self.facedetected = self.session.service("ALFaceDetection")
        self.tts = self.session.service("ALTextToSpeech")
        self.peopePerception = self.session.service("ALPeoplePerception")
        self.tabletService = self.session.service('ALTabletService')

    def onLoad(self):
        #self.tts.say("Im loading")
        self.timeFilteredResult = []
        self.signalID = 0
        self.counter = 0
        self.userNames = []


    def onUnload(self):
        #puts code for box cleanup here
        self.peopePerception.resetPopulation()


    def callback(self,int, value):

        if(value in self.userNames):
            self.tts.say("Thank you! hummmmmmmm! I have seen some one name" + value + " before!")

        # in case the button OK is press
        if int:

            done = self.facedetected.learnFace(value)
            if(done != true):
                self.facedetected.reLearnFace(value)
            self.logger.info("callback call" + value)
            self.memory.insertData("UserName",value)

        # in case the button CANCEL is press
        else :
            self.tts.say("Ok!buy buy")
            #self.onInput_onStop()
        #disconnect from the signal to avoid repetition
        self.tabletService.onInputText.disconnect(self.signalID)

    def onInput_onStart(self, p):
        if (self.counter > 0):

            self.onStopped()
        else:
            self.counter += 1
            #self.tts.say("A moment please!")
            if(len(p) > 0):
                if(len(p[1]) > 0): # just in case of the ALValue is in the wrong format


                    # get the ALValue returned by the time filtered recognition:
                    #    - [] when nothing new.
                    #    - [4] when a face has been detected but not recognized during the first 8s.
                    #    - [2, [faceName]] when one face has been recognized.
                    #    - [3, [faceName1, faceName2, ...]] when several faces have been recognized.

                    self.timeFilteredResult = p[1][len(p[1]) -1]
                    self.logger.info("I'm here")

                    if( len(self.timeFilteredResult) == 1 ):
                        self.logger.info("inside detectWithoutReco")
                        self.userNames = self.facedetected.getLearnedFacesList()
                        if(len(self.userNames) != 0):
                            self.tts.say("Sorry if i dont remenber you! Please Give me your name by fealing the space on my tablet")
                        else:
                            self.tts.say("Hello you! I a pepper!. i would like to know your name!please field the space shown on my tablet")
                        # If a face has been detected for more than 8s but not recognized
                        if(self.timeFilteredResult[0] == 4):
                            self.logger.info("Also here")
                            self.tabletService.showInputTextDialog("Enter your name please","OK","CANCEL","",10)
                            self.signalID = self.tabletService.onInputText.connect(self.callback)


                    elif ( len(self.timeFilteredResult) == 2 ):
                        if (self.timeFilteredResult[0] == 2):
                            self.logger.info("Finally here")
                            self.tts.say("well come back" + self.timeFilteredResult[1][0] + "i can see you have appreciate the game! let play one more" )
                            self.onRecognizedFace(self.timeFilteredResult[1][0])

