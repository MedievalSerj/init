#!/bin/bash

logs_file=/var/log/update_script.log
this_script_paht=`readlink -f $0`
crontab_line="0 4 * * 0 ${this_script_paht}"
line_in_crontab_file=`crontab -l | grep -F "$crontab_line"`

function update_upgrade() {
  apt-get update 2>&1 >> $logs_file
  apt-get upgrade 2>&1 >> $logs_file
}

if [ -z "$line_in_crontab_file" ] ; then
  echo "$crontab_line" | crontab -
  echo 'Crontab job added'
fi

update_upgrade
