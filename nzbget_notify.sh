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

###NZBNotify Script
[[ ! -f /scripts/nzbnotify/notify.py ]] && (cp /config/nzbnotify/notify.py /scripts/nzbnotify/)

# test if updates have been disabled
[ "$ADVANCED_DISABLEUPDATES" ] && exit 0

cd /config/nzbnotify/
git pull
chown -R 501:1000 /config
