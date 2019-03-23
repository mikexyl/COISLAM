#!/bin/bash

open -a Terminal.app core.sh
sleep 5s
open -a Terminal.app repub1.sh
sleep 0.1
open -a Terminal.app repub2.sh
sleep 0.1
open -a Terminal.app repub3.sh
sleep 0.1
open -a Terminal.app repub4.sh
sleep 0.1

open -a Terminal.app server.sh
open -a Terminal.app client1.sh
open -a Terminal.app client2.sh

echo "start playing rosbags?"
read yes
open -a Terminal.app bag1.sh
open -a Terminal.app bag2.sh
