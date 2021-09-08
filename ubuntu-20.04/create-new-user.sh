# Create new user
#
# bash <(curl -H "Cache-Control: no-cache" -Ls https://raw.githubusercontent.com/ivanskodje/linux-install-scripts/master/ubuntu-20.04/create-new-user.sh)
#
# (MUST BE RUN AS ROOT)
############################ 
RESP=""
read -e -p "(Recommended) Do you wish to create a new account with sudo permissions? (Y/n) " RESP
if [ -z "$RESP" ]; then
  RESP="y"
fi

if [ "$RESP" == "n" ] || [ "$RESP" == "N" ]; then
  echo "Skipping user creation... "
  exit 1
elif [ "$RESP" == "y" ] || [ "$RESP" == "Y" ]; then
    read -e -p "Enter the username you wish to use: " USERNAME
    read -e -p "Enter group(s) you wish to add user in (comma separated, no space): " GROUPS
    echo "Creating a new sudo user by the name $USERNAME"
    adduser "$USERNAME"
    usermod -aG "$GROUPS" "$USERNAME"
fi
