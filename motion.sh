#!/bin/sh

# STEPS TO MAKE THIS WORK...
# 1. Install https://code.google.com/p/youtube-upload/
# 2. Install Motion
# 3. Make directory /motion
# 4. Copy motion.conf to /etc/motion/motion.conf
# 5. Enable motion on startup
# 6. Put this file in /etc/cron.daily

# restart motion (new file)
service motion stop
service motion start

# upload it to youtube
dateString=`date --date='1 days ago' +'%Y-%m-%d'`
filename="/motion/motionCapture_$dateString.avi"
youtube-upload --email=oxfordfeedercam@gmail.com --password=PASSWORD --title="Feedercam Capture ($dateString)" --description="Feedercam Footage from Oxford, MI." --category=Animals --keywords="feedercam" $filename

# remove the file
rm -rf $filename