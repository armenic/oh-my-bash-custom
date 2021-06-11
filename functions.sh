#!/bin/bash

# modify the output of `groups` command into multiline and sort it
# designed to work with one user name or use current user if one not supplied
groupstr() {
  local user1="$1"
  [[ -z "$user1" ]] && user1="$USER"
  # replace space with new line, rid off line with :, rid of line with user name
  groups "$user1" | tr " " "\n" | grep "[^:]" | grep -v "$USER" | sort
}

cdfi() {
  cd /opt/BAA/FI/clinical_studies || exit
}

# make current dir searchable
pathlocal() {
  export PATH=${PATH}:.
}

# cmd calculator
calc() {
  awk "BEGIN { print \"The answer is \" $*}";
}
