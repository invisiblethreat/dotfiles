#!/bin/bash

if [ ! -e /usr/local/bin/brew ]; then
 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew analytics off
brew analytics state
cd brew
brew bundle
