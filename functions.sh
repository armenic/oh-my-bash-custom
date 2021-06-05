#!/bin/bash

groupstr() {
  local user1="$1"
  [[ -z "$user1" ]] && user1="$USER"
  groups "$user1" | tr " " "\n" | grep "[^:]" | grep -v "$USER" | sort
}

cdfi() {
  cd /opt/BAA/FI/clinical_studies || exit
}

pathlocal() {
  export PATH=${PATH}:.
}