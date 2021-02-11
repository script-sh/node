#!/bin/bash
echo "Insert Node.js version :"
read version

if [ "$version" = "10" ]; then
    
    echo "you will install node.js v10.x"
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
    sudo apt-get install -y nodejs

    echo "install yarn"
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update && sudo apt-get install yarn
    
    echo "install PM2"
    sudo npm install -g pm2
    
    echo "change permission"
    sudo chown -R $USER:$(id -gn $USER) ~/.config

    echo "upgrade system"
    sudo apt upgrade -y

elif [ "$version" = "12" ]; then

    echo "you will install node.js v12.x"
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt-get install -y nodejs

    echo "install yarn"
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update && sudo apt-get install yarn

    echo "install PM2"
    sudo npm install -g pm2

    echo "change permission"
    sudo chown -R $USER:$(id -gn $USER) ~/.config

    echo "upgrade system"
    sudo apt upgrade -y

else

    echo "your $version is not supported"
    echo "only node.js v10.x or 12.x can be installed"
    exit 1

fi