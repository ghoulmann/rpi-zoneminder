#!/bin/bash -ex 
#use bash, be verbose

myip=$(hostname -I)

#Check for Root

LUID=$(id -u)
if [[ $LUID -ne 0 ]]; then
echo "$0 must be run as root"
exit 1
fi


#Set Hostname to zoneminder

HOSTNAME=zoneminder
echo "$HOSTNAME" > /etc/hostname
sed -i "s|127.0.1.1 \(.*\)|127.0.1.1 $HOSTNAME|" /etc/hosts

#Install function

install()
{
    apt-get update
    DEBIAN_FRONTEND=noninteractive apt-get -y \
        -o DPkg::Options::=--force-confdef \
        -o DPkg::Options::=--force-confold \
        install $@
}

#Preseed configuration dpkg UNUSED FOR NOW
#debconf-set-selections << END
#sun-java6-jdk shared/accepted-sun-dlj-v1-1 boolean true
#sun-java6-jre shared/accepted-sun-dlj-v1-1 boolean true
#sun-java6-bin shared/accepted-sun-dlj-v1-1 boolean true
#END

#update repos; install from repos
install zoneminder

#floppy link for apache conf for zoneminder
ln -s /etc/zm/apache.conf /etc/apache2/conf.d/zoneminder.conf

#Restart apache2
service apache2 restart

#Because Tuxradar says so
chmod 4755 /usr/bin/zmfix
zmfix -a
adduser www-data video

#function: clean up after apt
cleanup_apt()
    {
        rm -r /var/cache/apt/*
        mkdir /var/cache/apt/archives
        mkdir /var/cache/apt/archives/partial
    }

#Clean up after apt
cleanup_apt()

#echo "Zoneminder is now available at http://$myip/zm"


#PostInstall: dpkg-reconfigure nullmailer
#Set mysql root user password: mysqladmin -u root password NEWPASSWORD
#Set zoneminder mysql password: mysqladmin -u admin password NEWPASSWORD

