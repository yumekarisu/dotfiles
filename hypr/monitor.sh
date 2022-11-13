#!/bin/sh

function handle {
  if [[ ${1:0:12} == "monitoradded" ]]; then
	hyprctl 
elif [[ ${1:0:14} == "monitorremoved" ]];then

fi
}
