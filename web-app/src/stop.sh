#!/bin/bash

#To stop streaming
KILL=$(ps -ef | grep vlc | awk '{print $2}' | xargs kill)