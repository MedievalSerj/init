#!/bin/bash

function update_upgrade() {
  sudo apt-get update 2>&1 >> /var/log/update_script.log
  sudo apt-get upgrade 2>&1 >> /var/log/update_script.log
}

update_upgrade
