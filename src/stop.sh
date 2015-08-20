#!/bin/bash
ps -ef | grep vlc | awk '{print $2}' | xargs kill