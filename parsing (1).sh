#!/bin/bash

var1="$1"

banner() {
    echo "                                                                              
 #####    ##   #####   ####  # #    #  ####     #    # ##### #    # #      
 #    #  #  #  #    # #      # ##   # #    #    #    #   #   ##  ## #      
 #    # #    # #    #  ####  # # #  # #         ######   #   # ## # #      
 #####  ###### #####       # # #  # # #  ###    #    #   #   #    # #      
 #      #    # #   #  #    # # #   ## #    #    #    #   #   #    # #      
 #      #    # #    #  ####  # #    #  ####     #    #   #   #    # ###### 
  
    #####################################################################
    #      [+] Modo de uso: URL                                         #
           [+] Exemplo:$0 www.teste.com                                                             
    #####################################################################
    "
}



banner2(){
echo "
                                                                              
 #####    ##   #####   ####  # #    #  ####     #    # ##### #    # #      
 #    #  #  #  #    # #      # ##   # #    #    #    #   #   ##  ## #      
 #    # #    # #    #  ####  # # #  # #         ######   #   # ## # #      
 #####  ###### #####       # # #  # # #  ###    #    #   #   #    # #      
 #      #    # #   #  #    # # #   ## #    #    #    #   #   #    # #      
 #      #    # #    #  ####  # #    #  ####     #    #   #   #    # ###### 
"


}                                                                           

limpar() {
    rm -rf /tmp/"${var1}" &>/dev/null
}


if [[ "$var1" == "" ]];
 then
    banner

else
    banner2        
    mkdir /tmp/"${var1}" && cd /tmp/"${var1}"
    wget "$var1"
     

    echo "----------------------------------------"
    echo "Link $1 sendo analisado"    
    echo "----------------------------------------"	
    echo " "


    grep href index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" > urls
    for dominio in $(cat urls); do
        host "$dominio" | grep "has address"
	 
    limpar
    done
fi

