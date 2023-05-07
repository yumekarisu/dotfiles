#! /bin/bash
#check if there's anything connected to the hdmi port
if [ "$(xrandr | grep "HDMI-1 connected")" ]
then
	#echo "projector connected" use for debug purposes
	#send a notification that the projector is connected
	#and scale the output from eDP-1 to HDMI-1
	notify-send "projector connected"
	xrandr --output HDMI-1 --auto --scale-from 1366x768 --output eDP-1

	while :
	do
		#continuously check if HDMI is still connected
		if [ "$(xrandr | grep "HDMI-1 disconnected")" ] 
		then
			#Send a notification that the projector has been disconnected
			#and reset the HDMI output transform and scaling to default
			#echo "projector disconnected" use for debug purposes
			notify-send "projector disconnected"
			xrandr --output HDMI-1 --auto --transform none
			xrandr --output eDP-1 --auto --transform none
			break
		fi
done
else
	#give error if there's no projector or 2nd screen connected
	#echo "No projector connected" use for debug purposes
	notify-send "No projector connected"
fi
