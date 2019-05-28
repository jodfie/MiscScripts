### Script to be used with LinuxServer.io DockerBase Image of NZBGet
### Will install NZB-Notify (https://github.com/caronc/nzb-notify/) and Dependencies

apt-get update
apt-get update --fix-missing
apt-get upgrade

##Dependencies
pip install apprise
pip install pynzbget
pip install chardet

##Get NZBNotify
[[ ! -d /config/nzbnotify/.git ]] && (git clone git://github.com/caronc/nzb-notify.git /config/nzbnotify/ && chown -R 501:1000 /config/nzbnotify)

##Check for NZBNotify Folder
[[ ! -d /config/scripts/nzbnotify ]] && (mkdir /config/scripts/nzbnotify/)

###NZBNotify Script
[[ ! -f /config/scripts/nzbnotify/Notify.py ]] && (cp /config/nzbnotify/Notify.py /config/scripts/nzbnotify/)

###NZBNotify Folder
[[ ! -f /config/scripts/nzbnotify/Notify ]] && (cp /config/nzbnotify/Notify /config/scripts/nzbnotify/Notify)

# test if updates have been disabled
[ "$ADVANCED_DISABLEUPDATES" ] && exit 0

cd /config/nzbnotify/
git pull
chown -R 501:1000 /config
