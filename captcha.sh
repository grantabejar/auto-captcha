#!/bin/bash

cat << "EOF"
Created by securer of The Lucidire
EOF

printf "\033[1;34mWelcome to the Auto-captcha.\r\nVersion 1.0\033[0m"
printf "\r\n\r\n"

if [ -d "/home/cap/" ]; then
  printf "\033[1;31mDetected previous installation of cap.\r\n"
  sleep .5
  printf "Removing it...\r\n\033[0m"
  rm -rf /home/cap
fi

sleep .5

if [[ -e /etc/debian_version ]]; then

	printf "\033[1;32mUpdating and upgrading your system.\r\n\033[0m"
	sleep 1
	apt upgrade -y
	apt update -y
	sleep 1
	printf "\033c"
	printf "\033[1;32mInstalling depencies.\r\n\033[0m"
	sleep 1
	apt install cron curl bsdmainutils -y
	sleep 1
	printf "\033c"
	printf "\033[1;32mBuilding files.\r\n\033[0m"
	sleep 1
	mkdir /home/cap
	cd /home/cap
cat > activate.sh << EOF
#!/bin/bash
loadavg=load.avg
cat /proc/loadavg | colrm 6 > \$loadavg
grep -w "[0.00-80.00]" \$loadavg > /dev/null
if [ \$? -eq 0 ]
then
exit
else
bash yes.sh
fi
EOF
cat > deactivate.sh << EOF
#!/bin/bash
loadavg=load.avg
cat /proc/loadavg | colrm 6 > \$loadavg
grep -w "[0.00-20.00]" \$loadavg > /dev/null
if [ \$? -eq 0 ]
then
bash no.sh
else
exit
fi
EOF
cat > no.sh << EOF
(cd ~ &) && (vddos-switch allsite no &) && (vddos reload &)

EOF
cat > yes.sh << EOF
(cd ~ &) && (vddos-switch allsite captcha &) && (vddos reload &)

EOF

	touch /home/cap/load.avg
	chmod 500 /home/cap/
	chmod 500 /home/cap/activate.sh
	chmod 500 /home/cap/deactivate.sh
	chmod 500 /home/cap/no.sh
	chmod 500 /home/cap/yes.sh
	chmod 600 /home/cap/load.avg
	crontab -l > cron1
	echo "* * * * * cd /home/cap/ ; bash activate.sh" >> cron1
	crontab cron1
	rm cron1
	crontab -l > cron2
	echo "* * * * * cd /home/cap/ ; sleep 1 ; bash activate.sh" >> cron2
	crontab cron2
	rm cron2
	crontab -l > cron3
	echo "* * * * * cd /home/cap/ ; sleep 3 ; bash activate.sh" >> cron3
	crontab cron3
	rm cron3
	crontab -l > cron4
	echo "* * * * * cd /home/cap/ ; sleep 5 ; bash activate.sh" >> cron4
	crontab cron4
	rm cron4
	crontab -l > cron5
	echo "0 * * * * cd /root/cap/ && bash deactivate.sh" >> cron5
	crontab cron5
	rm cron5
	service cron restart

elif [[ -e /etc/centos-release ]]; then

	printf "\033[1;32mUpdating and upgrading your system.\r\n\033[0m"
	sleep 1
	yum upgrade -y
	yum update -y
	sleep 1
	printf "\033c"
	printf "\033[1;32mInstalling depencies.\r\n\033[0m"
	sleep 1
	yum install cronie curl util-linux-ng -y
	sleep 1
	printf "\033c"
	printf "\033[1;32mBuilding files.\r\n\033[0m"
	sleep 1
	mkdir /home/cap
	cd /home/cap
cat > activate.sh << EOF
#!/bin/bash
loadavg=load.avg
cat /proc/loadavg | colrm 6 > \$loadavg
grep -w "[0.00-80.00]" \$loadavg > /dev/null
if [ \$? -eq 0 ]
then
exit
else
bash yes.sh
fi
EOF
cat > deactivate.sh << EOF
#!/bin/bash
loadavg=load.avg
cat /proc/loadavg | colrm 6 > \$loadavg
grep -w "[0.00-20.00]" \$loadavg > /dev/null
if [ \$? -eq 0 ]
then
bash no.sh
else
exit
fi
EOF
cat > no.sh << EOF
(cd ~ &) && (vddos-switch allsite no &) && (vddos reload &)

EOF
cat > yes.sh << EOF
(cd ~ &) && (vddos-switch allsite captcha &) && (vddos reload &)

EOF

	touch /home/cap/load.avg
	chmod 500 /home/cap/
	chmod 500 /home/cap/activate.sh
	chmod 500 /home/cap/deactivate.sh
	chmod 500 /home/cap/no.sh
	chmod 500 /home/cap/yes.sh
	chmod 600 /home/cap/load.avg
	crontab -l > cron1
	echo "* * * * * cd /home/cap/ ; bash activate.sh" >> cron1
	crontab cron1
	rm cron1
	crontab -l > cron2
	echo "* * * * * cd /home/cap/ ; sleep 1 ; bash activate.sh" >> cron2
	crontab cron2
	rm cron2
	crontab -l > cron3
	echo "* * * * * cd /home/cap/ ; sleep 3 ; bash activate.sh" >> cron3
	crontab cron3
	rm cron3
	crontab -l > cron4
	echo "* * * * * cd /home/cap/ ; sleep 5 ; bash activate.sh" >> cron4
	crontab cron4
	rm cron4
	crontab -l > cron5
	echo "0 * * * * cd /root/cap/ && bash deactivate.sh" >> cron5
	crontab cron5
	rm cron5
	service crond restart

else
	printf "Looks like you aren't running this installer on Debian, Ubuntu or CentOS."
	exit 1
fi

printf "\033[1;32mInstallation finished successfully without any errors! Please visit us at lucidire.com\033[0m"
printf "\r\n\r\n"
exit
