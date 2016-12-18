# import the necessary packages
import numpy as np
import argparse
import cv2
 
def detectcolor(image):
   # define the list of boundaries
        boundaries = [
          ([17, 15, 100], [50, 56, 200]),
          ([86, 31, 4], [220, 88, 50]),
          ([25, 146, 190], [62, 174, 250]),
          ([103, 86, 65], [145, 133, 128])
        ]
   # loop over the boundaries
        for (lower, upper) in boundaries:
          # create NumPy arrays from the boundaries
          lower = np.array(lower, dtype = "uint8")
          upper = np.array(upper, dtype = "uint8")
 
          # find the colors within the specified boundaries and apply
          # the mask
          mask = cv2.inRange(image, lower, upper)
          outputImage = cv2.bitwise_and(image, image, mask = mask)
        return outputImage;
 
class MyClass(GeneratedClass):
    def __init__(self):
        GeneratedClass.__init__(self)

    def onLoad(self):
        #put initialization code here
        pass

    def onUnload(self):
        #put clean-up code here
        self.onInput_onStop();#stop current loop execution
    def connectToCamera( self ):
        try:
            self.avd = ALProxy( "ALVideoDevice" )
            strMyClientName = self.getName()
            nCameraNum = 1
            nResolution = 1
            nColorspace = 0
            nFps = 5
            self.strMyClientName = self.avd.subscribeCamera( strMyClientName,
                                 nCameraNum, nResolution, nColorspace, nFps )
        except BaseException, err :
            self.log( "ERR: connectToCamera: catching error: %s!" % err )
            
    def disconnectFromCamera( self ):
        try:
            self.avd.unsubscribe( self.strMyClientName )
        except BaseException, err:
            self.log( "ERR: disconnectFromCamera: catching error: %s!" % err )
            
        def getImageFromCamera( self ):
            """
            return the image from camera or None on error
            """
        try:
                dataImage = self.avd.getImageRemote( self.strMyClientName )

                if( dataImage != None ):
                    Image = (
                        numpy.reshape(
                        numpy.frombuffer(dataImage[6], dtype='%iuint8' % dataImage[2]),
                           (dataImage[1], dataImage[0], dataImage[2])
                                )
                  ) 
                return image

        except BaseException, err:
              self.log( "ERR: getImageFromCamera: catching error: %s!" % err )
        return None;
    
    def onInput_onStart(self):
        #self.onColor_detected() #activate the output of the box
        #camera  connection
        self.connectToCamera();
        img = self.getImageFromCamera();
        if(img == None):
            self.log("ERR: eror while getting image from camera");
        else:
            img_output = detectcolor(img);
            if(img_output == None):
               self.log("ERR: eror while getting image from camera");
            else:
               self.log("colors detected");
    def onInput_onStop(self):
        self.onUnload() #it is recommended to reuse the clean-up as the box is stopped
        self.onColor_detected() #activate the output of the box
