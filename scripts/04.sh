#!/bin/bash

file_to_monitor=/etc/crontab
hash_store=/etc/my_hash.md5

this_script_paht=`readlink -f $0`
crontab_line="0 0 * * * ${this_script_paht} >/dev/null 2>&1"
line_in_crontab_file=`crontab -l | grep -F "$crontab_line"`

function check_md5() {
  if [ -f $hash_store ]; then
    status=`md5sum -c $hash_store | cut -d' ' -f2`
    if [ $status != "OK" ]; then
      echo "/etc/crontab has been changed" | mail -s "admin mail" root
    fi
  fi

  md5sum $file_to_monitor > $hash_store
}

if [ -z "$line_in_crontab_file" ] ; then
  md5sum $file_to_monitor > $hash_store
  echo "$crontab_line" | crontab -
  echo 'Crontab job added'
fi

check_md5
