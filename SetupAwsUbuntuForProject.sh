#!/bin/bash

echo "==================="
echo "==================="
echo "==================="
echo "This script sets up the AWS Ubuntu image from scratch to deploy the Post Something website with Apache"
echo "==================="
echo "==================="
echo "==================="

# update Ubuntu
sudo apt-get update
# install pip3
sudo apt-get install python3-pip -y
# install python virtual env
sudo apt-get install python3-venv -y
# install apache2
sudo apt-get install apache2 -y
# install libapache2-mod-wsgi-py3
sudo apt-get install libapache2-mod-wsgi-py3 -y

if [ ! -f /home/ubuntu/django_project ]; then
	# make a 'django_project' directory
	mkdir /home/ubuntu/django_project
fi

# git clone Django Animal Chat


if [ ! -f /home/ubuntu/django_project/venv ]; then
	# create a virtual env in the 'django_project' directory
	python3 -m venv /home/ubuntu/django_project/venv
fi

# enable the virtual env
source /home/ubuntu/django_project/venv/bin/activate

if [ -f /home/ubuntu/django_project/requirements.txt ]; then
	# install packages --> requirements.txt
	pip3 install -r requirements.txt
else
	# install package --> django==2.1.1
	pip3 install django==2.1.1
fi

# create a django project
# the . puts the manage.py in the current directory
django-admin  startproject alpha /home/ubuntu/django_project
# deactivate the virtual env
deactivate

echo "==================="
echo "==================="
echo "==================="
echo "Go into 'alpha/settings.py' and add this line at the bottom"
echo "    STATIC_ROOT = os.path.join(BASE_DIR, \"static/\")"
echo "==================="
echo "==================="
echo "==================="

