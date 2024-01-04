#!/bin/bash



__banner__(){

echo "   ___               _                       _____          __  
  / _ \__ _ _ __ ___(_)_ __   __ _    /\  /\/__   \/\/\    / /  
 / /_)/ _` | '__/ __| | '_ \ / _` |  / /_/ /  / /\/    \  / /   
/ ___/ (_| | |  \__ \ | | | | (_| | / __  /  / / / /\/\ \/ /___ 
\/    \__,_|_|  |___/_|_| |_|\__, | \/ /_/   \/  \/    \/\____/ 
                             |___/                              
${application.title} ${application.version}
Powered by Spring Boot ${spring-boot.version}
"
}



if ["$1" == ""]
then
	__banner__
else

wget $1
grep href index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" > urls
for dominio in $(cat urls);
do
host $dominio | grep "has address";
done
fi
