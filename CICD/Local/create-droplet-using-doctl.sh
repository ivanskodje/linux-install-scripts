#!/bin/bash
#
# TO RUN THIS SCRIPT:
# bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CICD/Local/create-droplet-using-doctl.sh)
#
# Make sure doctl is available before continuing
if ! type "doctl" &> /dev/null; then
  echo "You need to install doctl before running this! "
  read -e -p "Do you wish to install doctl (y/n) [n]? " RESP
  if [ "$RESP" == "y" ] || [ "$RESP" == "Y" ]; then
    bash <(curl -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/CentOS%207.5.1804/install-doctl.sh)
  else
    echo "Aborting... "
    exit 1
  fi
fi

# ------------------------------------------
# DEFAULT DROPLET VARIABLES
export DROPLET_REGION="ams3"
export DROPLET_IMAGE="centos-7-x64"
export DROPLET_SIZE="s-1vcpu-1gb"
export DROPLET_NAME="CentOS7"
export ENABLE_DROPLET_BACKUP="n"
export ENABLE_PRIVATE_NETWORKING="y"
export ENABLE_IPV6="y"
export USE_SSH_KEY="n"
export ADDITIONAL_ARGS=""

# MISC
export SKIP_INTERACTION="n"

# ------------------------------------------
# FUNCTIONS
function handle_skip_interaction {
  read -e -p "Do you wish to create a droplet with default configurations (y/n) [$SKIP_INTERACTION]? " RESP
  if [ "$RESP" == "y" ] || [ "$RESP" == "Y" ]; then
    SKIP_INTERACTION="y"
  elif [ "$RESP" == "n" ] || [ "$RESP" == "N" ]; then
    SKIP_INTERACTION="n"
  fi
}


function print_region_list {
  doctl compute region list
}

function set_region_from_user {
  read -e -p "Which REGION do you wish to create the droplet in [$DROPLET_REGION]? " RESP
  if [ -n "$RESP" ]; then
    DROPLET_REGION="$RESP"
  fi
  echo "" #newline
}


function print_image_list {
  doctl compute image list-distribution
  doctl compute image list-application
}


function set_image_from_user {
  read -e -p "Which IMAGE do you wish to use for the droplet [$DROPLET_IMAGE]? " RESP
  if [ -n "$RESP" ]; then
    DROPLET_IMAGE="$RESP"
  fi
  echo "" #newline
}


function print_droplet_size {
  doctl compute size list
}


function set_droplet_size {
  read -e -p "Which SIZE do you wish to set for the droplet [$DROPLET_SIZE]? " RESP
  if [ -n "$RESP" ]; then
    DROPLET_SIZE="$RESP"
  fi
  echo "" #newline
}


function ask_for_ssh_key {
  read -e -p "Enter your SSH Key: " RESP
  if [ -n "$RESP" ]; then
    ADDITIONAL_ARGS="$ADDITIONAL_ARGS --ssh-keys $RESP"
  fi
  echo "" #newline
}


function ask_use_for_droplet_ssh {
  if [ "$SKIP_INTERACTION" == "n" ]; then
    read -e -p "Do you wish to save an SSH key for this droplet (y/n) [$USE_SSH_KEY]? " RESP
    # If the response is not empty, we override the default value
    if [ -n "$RESP" ]; then
      USE_SSH_KEY="$RESP"
    fi
  fi

  if [ "$USE_SSH_KEY" == "y" ] || [ "$USE_SSH_KEY" == "Y" ]; then
    ask_for_ssh_key
  elif [ "$USE_SSH_KEY" == "n" ] || [ "$USE_SSH_KEY" == "N" ]; then
    echo "Skipping use of SSH Key... "
  fi
}


function ask_use_for_droplet_backups {
  if [ "$SKIP_INTERACTION" == "n" ]; then
    echo "|-------------------------------|"
    echo "| NB: This will cost you extra! |"
    echo "|-------------------------------|"
    read -e -p "Do you wish to enable backups (y/n) [$ENABLE_DROPLET_BACKUP]? " RESP

    if [ -n "$RESP" ]; then
      ENABLE_DROPLET_BACKUP="$RESP"
    fi
  fi

  if [ "$ENABLE_DROPLET_BACKUP" == "y" ] || [ "$ENABLE_DROPLET_BACKUP" == "Y" ]; then
    ADDITIONAL_ARGS="$ADDITIONAL_ARGS --enable-backups"
    echo "Enabling backups"
  elif [ "$ENABLE_DROPLET_BACKUP" == "n" ] || [ "$ENABLE_DROPLET_BACKUP" == "N" ]; then
    echo "Will not enable backup... "
  fi
}


function ask_for_private_networking {
  if [ "$SKIP_INTERACTION" == "n" ]; then
    read -e -p "Do you wish to enable private networking between droplets (y/n) [$ENABLE_DROPLET_BACKUP]? " RESP

    if [ -n "$RESP" ]; then
      ENABLE_PRIVATE_NETWORKING="$RESP"
    fi
  fi

  if [ "$ENABLE_PRIVATE_NETWORKING" == "y" ] || [ "$ENABLE_PRIVATE_NETWORKING" == "Y" ]; then
    ADDITIONAL_ARGS="$ADDITIONAL_ARGS --enable-private-networking"
    echo "Enabling private networking"
  elif [ "$ENABLE_PRIVATE_NETWORKING" == "n" ] || [ "$ENABLE_PRIVATE_NETWORKING" == "N" ]; then
    echo "Will not enable private networking... "
  fi
}


function ask_for_ipv6 {
  if [ "$SKIP_INTERACTION" == "n" ]; then
    read -e -p "Do you wish to enable IPv6 (y/n) [$ENABLE_IPV6]? " RESP
    if [ -n "$RESP" ]; then
      ENABLE_IPV6="$RESP"
    fi
  fi

  if [ "$ENABLE_IPV6" == "y" ] || [ "$ENABLE_IPV6" == "Y" ]; then
    ADDITIONAL_ARGS="$ADDITIONAL_ARGS --enable-ipv6"
    echo "Enabling IPv6"
  elif [ "$ENABLE_IPV6" == "n" ] || [ "$ENABLE_IPV6" == "N" ]; then
    echo "Will not enable IPv6... "
  fi
}


function ask_for_droplet_name {
  echo "What do you wish to name the droplet? [$DROPLET_NAME]"
  read -e -p "(Only numbers, letters and dashes) " DROPLET_NAME
  echo "" #newline
}


function setup_domain {

}


# Authenticate user, using a given token (which is asked by doctl)
# doctl auth init

# Check if we wanted to skip SKIP_INTERACTION
handle_skip_interaction

if [ "$SKIP_INTERACTION" = "n" ]; then
  # Get REGION from user
  print_region_list
  set_region_from_user

  # Get IMAGE from user
  print_image_list
  set_image_from_user

  # Get SIZE from user
  print_droplet_size
  set_droplet_size
fi

# Ask user whether or not to use ssh
ask_use_for_droplet_ssh

# Wnat to enable backups? (cost extra)
ask_use_for_droplet_backups

# Want private networking between droplets?
ask_for_private_networking

# Whether or not we want to enable IPv6
ask_for_ipv6

# Get droplet name
ask_for_droplet_name

# Create droplet!
echo "Creating droplet with the following command: "
echo "doctl compute droplet create $DROPLET_NAME --region $DROPLET_REGION --image $DROPLET_IMAGE --size $DROPLET_SIZE $ADDITIONAL_ARGS"
doctl compute droplet create $DROPLET_NAME --region $DROPLET_REGION --image $DROPLET_IMAGE --size $DROPLET_SIZE $ADDITIONAL_ARGS

# Setup domain (if any)
setup_domain
