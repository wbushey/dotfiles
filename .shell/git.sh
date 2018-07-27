gut() {
  printf '%s' 'Are you sure you want to gut? [y/N] '
  read -r response
  if echo "$response" | grep -Eq '^([yY][eE][sS]|[yY])+$';
  then
    git reset --hard HEAD && git clean -df
  else
    echo "Not gutting"
  fi
}
