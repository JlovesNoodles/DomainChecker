#!/bin/bash
# HomeBrewByChickenNoodles

mkdir -p results/googleresults
mkdir -p results/microsoftresults


function domainchecker() {
	echo " "
	echo " "
	echo " "
	echo "Welcome to domain checker"
	echo " "
	echo "Before we start choose the result you want."
	echo " "
	echo "Show only the Domains with"
	echo " "
	echo "[G]oogle [M]icrosoft "
	echo " "
 	read -p "Your choice (G | M): " user_choice

	if [[ $user_choice == "G" || $user_choice == "g" ]]; then
        	echo "Checking if the Domain is using Google"
        	while read -r domain; do
            	result=$(dig +short TXT "$domain" | grep -Ei "google")
            	if [[ -n "$result" ]]; then
                	echo "$domain is associated with Google." >> results/googleresults/googleusingdomain.txt
            	else
                	echo "$domain is not associated with Google." >> results/googleresults/notgoogleusingdomain.txt
            	fi
            
        	done < domain_list.txt
        
        echo "printing domain using google"
                    sleep 3
	echo -n "Finishing please wait: " | lolcat
	for i in {1..50}; do
	    echo -n "#"
	    sleep 0.1
	done | pv -lep -s 50 > /dev/null
	cat results/googleresults/googleusingdomain.txt 
	echo " "
	echo " "
	echo "printing domain not using google"
	cat results/googleresults/notgoogleusingdomain.txt
        
        
        
        
    elif [[ $user_choice == "M" || $user_choice == "m" ]]; then
        echo "Checking if the Domain is using Microsoft"
       while read -r domain; do
            	result=$(dig +short TXT "$domain" | grep -Ei "microsoft")
            	if [[ -n "$result" ]]; then
                	echo "$domain is associated with Microsoft." >> results/microsoftresults/microsoftusingdomain.txt
            	else
                	echo "$domain is not associated with Microsoft." >> results/microsoftresults/notmicrosoftusingdomain.txt
            	fi
            
        	done < domain_list.txt
        	
        	
        echo "printing domain using Microsoft"
        
        sleep 3
	echo -n "Finishing please wait: " | lolcat
	for i in {1..50}; do
	    echo -n "#"
	    sleep 0.1
	done | pv -lep -s 50 > /dev/null
	
	cat results/microsoftresults/microsoftusingdomain.txt 
	echo " "
	echo " "
	echo "printing domain not using Microsoft"
	cat results/microsoftresults/notmicrosoftusingdomain.txt  
 

   
   
    else
        echo "Wrong input"
        exit 1
    fi
}

domainchecker
