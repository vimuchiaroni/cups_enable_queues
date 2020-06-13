################################ Enable cups printer ###############################
#
#  Author : Victor Muchiaroni
#  Version: 1.0
#  Date   : 20190131
#
# This script automates cups printer enabling

###################################################################################


#################################### VARIABLES ######################################
PRINTER=$1
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
LOG=/var/log/"$PRINTER"_enable.log
DATE=`date "+%Y-%m-%d %H:%M"`
COUNT="$(lpstat -p $PRINTER|grep -i disabled |wc -l)"
EXCLUDE=("ssb5001nf")
####################################################################################
for check_exclude in "${EXCLUDE[@]}"; do
        if [ "$COUNT" -ge 1 ] && [ "$PRINTER" != "$check_exclude" ]
        then
                cupsenable $PRINTER
                        echo "Printer queue $PRINTER enabling required at $DATE" >> $LOG

        else
                echo "printer is already enabled enabled" >> /dev/null
                break
        fi
done
