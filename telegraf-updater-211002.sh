#!/bin/bash

# CONFIG UPDATER
# TELEGRAF
# Turn the influxdb url from http to https
#

TARGETDIR="/etc/telegraf/"
TARGET="/etc/telegraf/telegraf.conf"
cachePath=$TARGETDIR".cache/"
snowflakePath=$cachePath"snowflake/"

old_text1="http://"
new_text1="https://"
add_text1="insecure_skip_verify = true"

sed -i 's/$old_text1/$new_text1/g' $TARGET

echo $add_text1 >> $TARGET

mkdir -p $snowflakePath
chown -R telegraf.telegraf $cachePath

systemctl restart telegraf

echo "--------------------------------------------------------------------------"
systemctl status telegraf
echo "--------------------------------------------------------------------------"
cat $TARGET
echo "--------------------------------------------------------------------------"
echo "Finished Updating"


