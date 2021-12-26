#!/bin/bash

if [[ $(playerctl status --format "{{ uc(status) }}") == "PLAYING" ]]
then
    echo $(playerctl metadata --format "{{ artist }} {{ album }} - {{ title }}")
fi