#!/bin/bash


banner(){

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


if ["$1" == ""]
then
        banner
else

wget $1
grep href index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" > urls
for dominio in $(cat urls);
do
host $dominio | grep "has address";
done
fi
