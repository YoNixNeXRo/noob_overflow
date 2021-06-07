#!/bin/bash

################################################################################
#                                                                              #
#                       simple program to detecte simple                       #
#                       buffer overflow in program input                       #
#                                                                              #
################################################################################
clear

# check existence of input argument
if [ $# -ne 1 ]; then 
	echo " Syntaxe error, no input argument" 
	echo " use : ./noob_overflow.sh <program>" 
	echo "make sure <program> is executable : chmod +x <program>"
	exit
fi


#i to count number of characters
i=0

#j to display number every 50 characters
j=50

#################################################
#Add a pretty banner
pretty="$(python3 -c "print ('-' *50)")"
dt=$(date '+%d/%m/%Y %H:%M:%S');

echo "$pretty"
echo "Scannig program : $1"
echo "$dt"
echo "$pretty"
#################################################


#loop to count characters
while true; do

    i=$(( $i + 1))
    
    out="$(python3 -c "print ('A' *$i)" | ./$1)" 
   [[ "$out" == "" ]] && break
   

   if [[ $i -eq $j ]]; then
        
        echo "$j characters"
        ((j=j+50))
    fi
    
done

k=$((i-1))


echo "Buffer Overflow detected at $k charcaters"
