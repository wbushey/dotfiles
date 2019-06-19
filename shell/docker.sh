#! /bin/bash

docker-stop-all() {
  printf '%s' 'Are you sure you want to stop all currently running Docker containers? [y/N] '
  read -r response
  if echo "$response" | grep -Eq '^([yY][eE][sS]|[yY])+$';
  then
    docker ps -aq | while IFS='' read -r id
    do
      docker stop "$id"
    done
  else
    echo "Not stopping Docker containers"
  fi
}
