# cups_enable_queues
Scripts to automatically enable all printer queues in a cups printer server

## How to use
Use a for loop to go through all printers and run the enable_printer.sh

'''
shell> for i in $(lpstat -v|awk '{print $3}'|cut -d: -f1); do /opt/scania/enable_printer.sh $i; done > /dev/null 2>&1
'''
