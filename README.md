<h2>Summary</h2>
Powerful web-based surveillance system for USB or IP cameras and the Rasperry Pi (Raspbian).
<h2>Zoneminder Resources and Reference</h2>
<ul><li><a href="http://www.howtoforge.com/video_surveillance_zoneminder_ubuntu">Howtoforge</a>
<li><a href="http://www.linuxplanet.com/linuxplanet/tutorials/7267/1">Linux Planet</a></li>
<li><a href="http://www.tuxradar.com/content/build-your-own-surveillance-zoneminder">TuxRadar</a></li>
</ul>
<h2>How To</h2>
<ul><li>If you're using USB cams connected to the Raspberry Pi, use https://github.com/ghoulmann/pi-face.
<li>Have unfettered internet access
<li>Execute the script as root
<li>On a remote computer, access at http://ipaddr/zm to configure cams
<li>Intended for a fresh install of Raspbian (mysql-server not configured yet)
</ul>
<h2>Post Install</h2>
Since install was noninteractive, you'll have some significant security risks. I didn't want to script this or preseed answers because I either can't answer for others or don't want passwords dangling in plain text.
<ul>
<li>Set MySQL server root password: sudo mysqladmin -u root password NEWPASSWORD
<li>Configure nullmailer: sudo dpkg-reconfigure nullmailer (have google ready)
<li>Set MySQL zoneminder db password: sudo mysqladmin -u admin password NEWPASSWORD. Next, you'll have to set the password in zoneminder config. Haven't tested this.
</ol>
