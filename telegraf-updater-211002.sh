#!/bin/bash

# CONFIG UPDATER
# TELEGRAF
# Turn the influxdb url from http to https
#

PATH="/etc/telegraf/telegraf.conf"

old_text1="http://"
new_text1="https://"
add_text="insecure_skip_verify = true"

sed -i 's/$old_text1/$new_text1/g' $PATH
echo $add_text >> $PATH

echo "--------------------------------------------------------------------------"
cat $PATH
echo "--------------------------------------------------------------------------"
echo "Finished Updating"


