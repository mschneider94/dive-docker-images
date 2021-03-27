#!/bin/bash
while true; do
  index=0
  array=()

  while read -r line; do
    if [ $index -eq 0 ]; then
      echo -e "ID\t$line"
    else
      echo -e "$index\t$line"
    fi
    array+=($(echo $line | awk {'print $3'}))
    index=$( expr $index + 1)
  done <<<$(docker image ls)

  echo -n "Select ID [or exit]: "
  read input

  if [[ $input =~ ^[0-9]+$ ]]; then
    if [ $input -gt 0 ] && [ $input -lt $index ]; then
      /usr/local/bin/dive "${array[$input]}"
    else
      >&2 echo "ERROR: ID $input is invalid"
    fi
  elif [ $input == "exit" ]; then
    break
  else
    >&2 echo "ERROR: Please enter an integer only"
  fi
done

exit
