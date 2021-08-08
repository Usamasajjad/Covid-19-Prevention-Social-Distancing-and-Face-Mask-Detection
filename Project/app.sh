#!/bin/bash


#konsole --noclose -e ls

#----------------------------------------------------------------------------
# SHOW LIST DIALOG BOX WITH OPTIONS
#----------------------------------------------------------------------------
menu=`zenity --list \
  --title="Covid-19 Prevention: Social Distancing and Face Mask Detection" \
  --column="Detection Type" \
    "Face Mask Detector On Image." \
    "Face Mask Detector On Video." \
    "Face Mask Detector On Webcam." \
    "Social Distance Detector On Video." \
    "Social Distance Detector On Webcam." --width=800 --height=300`

#----------------------------------------------------------------------------
# FACE MASK DETECTOR ON IMAGE
#----------------------------------------------------------------------------
if [ "$menu" == "Face Mask Detector On Image." ]; then
    cd FaceMaskDetector
    > output.txt
    imagefile=$(zenity --file-selection --title "Select an Image to Run Face Mask Detection on")
    command=$(python3 detect_mask_image.py -i $imagefile &> output.txt) ; zenity --text-info --title="Program Output" --filename="output.txt" --width=800 --height=300
fi

#----------------------------------------------------------------------------
# FACE MASK DETECTOR ON VIDEO
#----------------------------------------------------------------------------
if [ "$menu" == "Face Mask Detector On Video." ]; then
    cd FaceMaskDetector
    > output.txt
    videofile=$(zenity --file-selection --title "Select a Video to Run Face Mask Detection on")
    command=$(python3 detect_mask_video.py -v $videofile &> output.txt) ; zenity --text-info --title="Program Output" --filename="output.txt" --width=800 --height=300
    cd ..
fi

#----------------------------------------------------------------------------
# FACE MASK DETECTOR ON WEBCAM
#----------------------------------------------------------------------------
if [ "$menu" == "Face Mask Detector On Webcam." ]; then
    cd FaceMaskDetector
    > output.txt
    command=$(python3 detect_mask_video_stream.py &> output.txt) ; zenity --text-info --title="Program Output" --filename="output.txt" --width=800 --height=300
    cd ..
fi

#----------------------------------------------------------------------------
# SOCIAL DISTANCE DETECTOR ON VIDEO
#----------------------------------------------------------------------------
if [ "$menu" == "Social Distance Detector On Video." ]; then
    cd SocialDistanceDetector
    > output.txt
    videofile=$(zenity --file-selection --title "Select a Video to Run Social Distance Detection on")
    command=$(python3 social_distance_detection.py --prototxt SSD_MobileNet_prototxt.txt --model SSD_MobileNet.caffemodel --labels class_labels.txt -v $videofile &> output.txt) ; zenity --text-info --title="Program Output" --filename="output.txt" --width=800 --height=300
    cd ..
fi

#----------------------------------------------------------------------------
# SOCIAL DISTANCE DETECTOR ON WEBCAM
#----------------------------------------------------------------------------
if [ "$menu" == "Social Distance Detector On Webcam." ]; then
    cd SocialDistanceDetector
    > output.txt
    command=$(python3 social_distance_detection.py --prototxt SSD_MobileNet_prototxt.txt --model SSD_MobileNet.caffemodel --labels class_labels.txt &> output.txt) ; zenity --text-info --title="Program Output" --filename="output.txt" --width=800 --height=300
    cd ..
fi

