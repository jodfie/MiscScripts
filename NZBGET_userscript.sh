### Script to be used with LinuxServer.io DockerBase Image of NZBGet
### Will install MP4Automator (https://github.com/mdhiggins/sickbeard_mp4_automator) and Dependencies

add-apt-repository ppa:mc3man/trusty-media

apt-get -q update
apt-get -q update --fix-missing
apt-get -qy upgrade

easy_install pip

##Dependencies
apt-get install -qy git
apt-get install -qy ffmpeg

curl https://bootstrap.pypa.io/ez_setup.py -o - | python

pip install requests 
pip install requests[security]
pip install requests-cache
pip install babelfish
pip install 'guessit<2'
pip install 'subliminal<2'
pip install stevedore==1.19.1
pip install python-dateutil
pip install qtfaststart


##Get MP4Automator
[[ ! -d /config/sma/.git ]] && (git clone git://github.com/mdhiggins/sickbeard_mp4_automator.git /config/sma/ && chown -R 501:1000 /sma)

##Use .ini if present or copy sample
[[ ! -f /config/sma/autoProcess.ini ]] && (cp /config/sma/autoProcess.ini.sample /config/sma/autoProcess.ini)

###NZBGet Script
[[ ! -f /scripts/mp4/NZBGetPostProcess.py ]] && (cp /mp4automator/mp4/NZBGetPostProcess.py /scripts/mp4/)

# test if updates have been disabled
[ "$ADVANCED_DISABLEUPDATES" ] && exit 0

cd /config/sma/
git pull
chown -R 501:1000 /config
