#!/usr/bin/env sh

# Init the container
if [[ -z $(getent passwd $UID) ]]; then
  # Create user/group and assign /workspace permission
  groupadd -g $GID $GID
  useradd -u $UID -g $GID -s /bin/bash $UID

  USER_PASSWORD="thule"
  echo $UID:$USER_PASSWORD | chpasswd
fi

# Chmod /workspace and change user
chown $UID:$GID /workspace

# Run bash to keep container alive
tail -f /dev/null