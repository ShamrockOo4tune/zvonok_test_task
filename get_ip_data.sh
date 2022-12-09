#!/bin/bash

# используем утилиту jq если она установлена
if command -v jq &> /dev/null  
then
    ip=`curl -s https://api.ipify.org/?format=json | jq -r '.ip'`
    region=`curl -s http://ip-api.com/json/${ip} | jq '.region'`
    country_code=`curl -s http://ip-api.com/json/${ip} | jq '.countryCode'`
    echo -e "ip: ${ip}\nregion: ${region}\ncountry_code: ${country_code}"

# или используем возможности python
elif command -v python3 &> /dev/null
then
    ip=`curl -s https://api.ipify.org/?format=json | python3 -c "import sys, json; print(json.load(sys.stdin)['ip'])"`
    region=`curl -s http://ip-api.com/json/${ip} | python3 -c "import sys, json; print(json.load(sys.stdin)['region'])"` 
    country_code=`curl -s http://ip-api.com/json/${ip} | python3 -c "import sys, json; print(json.load(sys.stdin)['countryCode'])"`
    echo -e "ip: ${ip}\nregion: \"${region}\"\ncountry_code: \"${country_code}\""

# в крайнем случае обойдемся без json
else
    ip=`curl -s https://api.ipify.org`
    region=`curl -s http://ip-api.com/line/${ip}?fields=region`
    country_code=`curl -s http://ip-api.com/line/${ip}?fields=countryCode`
    echo -e "ip: ${ip}\nregion: \"${region}\"\ncountry_code: \"${country_code}\""
fi
 