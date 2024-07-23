#!/bin/bash
# HomeBrewByChickenNoodles

while true; do
    mkdir -p results/googleresults
    mkdir -p results/microsoftresults

    function domainchecker() {
        echo " "
        echo " "
        echo " "
        echo " ----------------------------------------------------------------"
        echo "                   Welcome to domain checker                     "
        echo "              Before we start choose the result you want.        "
        echo "                  Show only the Domains with                     "
        echo "                      [G]oogle [M]icrosoft                       " 
        echo " ----------------------------------------------------------------"
        echo " "
        read -p "Your choice (G | M): " user_choice

        if [[ $user_choice == "G" || $user_choice == "g" ]]; then
            echo "Checking if the Domain is using Google" 
            while read -r domain; do
                result=$(dig +short TXT "$domain" | grep -Ei "google.com")
                if [[ -n "$result" ]]; then
                    echo " "
                    echo "$domain is associated with Google." >> results/googleresults/googleusingdomain.txt
                    echo " "
                else
                    echo " "
                    echo "$domain is not associated with Google." >> results/googleresults/notgoogleusingdomain.txt 
                    echo " "
                fi
            done < domain_list.txt

            echo " "
            echo " "
            echo "printing domain using google"  
            sleep 3
            echo -n "Finishing please wait: " 
            for i in {1..50}; do
                echo -n "#"
                sleep 0.1
            done | pv -lep -s 50 > /dev/null
            cat results/googleresults/googleusingdomain.txt  
            echo " "
            echo " "
            echo "printing domain not using google"
            cat results/googleresults/notgoogleusingdomain.txt 

            rm -r results

        elif [[ $user_choice == "M" || $user_choice == "m" ]]; then
            echo "Checking if the Domain is using Microsoft" 
            while read -r domain; do
                result=$(dig +short TXT "$domain" | grep -Ei "outlook")
                if [[ -n "$result" ]]; then 
                    echo " "
                    echo "$domain is associated with Microsoft." >> results/microsoftresults/microsoftusingdomain.txt 
                    echo " "
                else
                    echo " "
                    echo "$domain is not associated with Microsoft." >> results/microsoftresults/notmicrosoftusingdomain.txt 
                    echo " "
                fi
            done < domain_list.txt

            echo "printing domain using Microsoft"
            sleep 3
            echo -n "Finishing please wait: "
            for i in {1..50}; do
                echo -n "#"
                sleep 0.1
            done | pv -lep -s 50 > /dev/null

            cat results/microsoftresults/microsoftusingdomain.txt 
            echo " "
            echo " "
            echo "printing domain not using Microsoft"
            cat results/microsoftresults/notmicrosoftusingdomain.txt  

            rm -r results

        else
            echo " "
            echo "Wrong input"
            exit 1
        fi
    }


domainchecker
    echo " "
    echo " "
    read -p "Do you want to check another set of domains? (Y/N): " continue_checking 

    if [[ $continue_checking != "Y" || $continue_checking != "y" ]]; then
        echo "Adios Amigo!"
        break
    fi
done




