#!/bin/bash -ex

cd $DASHING_HOME

echo "Installing Widgets"
ruby -v widget-install.rb

echo "Installing Gems"
bundle install

echo "Sourcing Config File"
source $DASHING_HOME/config/dashing.conf

echo "Starting Dashing"
exec dashing start -p $PORT
