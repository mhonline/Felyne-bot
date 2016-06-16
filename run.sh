while true
do
killall -9 ruby
cd /Felyne-bot
git pull
. /usr/local/rvm/scripts/rvm
rvm use 2.3.0
ruby -v
ruby run.rb
done
