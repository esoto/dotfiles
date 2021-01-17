#! /bin/sh

echo "Checking for homebrew"
if [[ $(command -v brew) == "" ]]; then
    echo "installing homebrew"
    bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "homebrew installed"
fi

echo "Checking for postgres"
if [[ $(command -v postgres) == "" ]]; then
    echo "installing postgres"
    brew install postgresql
else
    echo "postgres installed"
fi

echo "Checking for nvm"
if [ -d ~/.nvm ]; then
    echo "nvm installed"
else
    echo "installing nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
    nvm install node
    npm install -g yarn
fi

echo "Checking for rbenv"
if [[ $(command -v rbenv) == "" ]]; then
    echo "installing rbenv"
    brew install rbenv
    rbenv install 2.7.0
    rbenv local 2.7.0
    ruby install.rb
else
    echo "rbenv installed"
fi
