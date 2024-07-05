#!/bin/sh

cd ${0%/*}

echo $(tput setaf 6)"[INFO] Make sure to run like: '. $0' or 'source $0'"
echo $(tput setaf 6)"Have you run it correctly? use ctrl+C to cancel, or press enter/return to preceed!"
read Wandering_Son_by_Takako_Shimura #: I wannaa

export GITHUB_USERNAME=$(git config -l | rg 'user\.name' | cut -d'=' -f2)
export GITHUB_EMAIL=$(git config -l | rg 'user\.email' | cut -d'=' -f2)

ln -sf ../../tools/dev/pre-commit-hook.rb .git/hooks/pre-commit
ln -sf ../../tools/dev/pre-commit-hook.rb .git/hooks/post-merge

sudo dnf -y install libpcap-devel libpq-devel libsqlite3x-devel ruby-devel
gem install bundler
#: Bundle: Don't run as root; also Bundle: Need root permission
sudo setfacl -R -m u:$(whoami):rwx /usr/share/gems
sudo setfacl -R -m u:$(whoami):rwx /usr/lib64/gems/ruby
bundle install

exit 0
