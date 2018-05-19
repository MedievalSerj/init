#!/bin/bash

script_file=update_upgrade.sh
logs_file=/var/log/update_script.log

touch $script_file

tee $script_file <<FUCK
#!/bin/bash

function update_upgrade() {
  sudo apt-get update 2>&1 >> $logs_file
  sudo apt-get upgrade 2>&1 >> $logs_file
}

update_upgrade
FUCK

chmod 777 $script_file

script_path=$(readlink -f $script_file)

(crontab -l ; echo "0 4 * * * $script_path")| crontab -
