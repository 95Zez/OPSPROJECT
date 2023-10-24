#!/bin/bash

echo "=============================="

echo "  NGINX CONFIG  SCRIPT"

echo "=============================="
sleep 1
rm -rvf  /var/www/html/labs
rm -rvf /home/azureuser/html
if (systemctl is-active nginx)
then echo "Service is running, continuing with configurations"
sleep 1

echo "creating a directory labs"
sudo mkdir /var/www/html/labs
if [ -d "/var/www/html/labs" ]
then
echo " changing ownership of labs to azureuser"
else
echo " did not find directory /var/www/html/labs"
echo " script exiting….."
exit 1
fi 
sleep 1

sudo chown azureuser:root /var/www/html/labs
sleep 1

echo "Creating a symbolic link html"
sleep 1

ln -s /var/www/html/labs /home/azureuser/html
sleep 1
if [ -L /home/azureuser/html ]
then
cd /home/azureuser/html
echo "creating test page index.html"

touch index.html
echo "adding student information to the page"

sleep 1

echo "<html>" > index.html
echo "<body>" > index.html
echo "<h1>STUDENT INFORMATION PAGE MM Monagane & R Mphelane</h1>" > index.html
echo "<h6> Initials: R </h6>" > index.html
echo "<h6> Name: Rethabile </h6>" >index.html
echo "<h6> Student Number: 221295461 </h6> "> index.html
echo "<h6> Course:Computer Systems </h6>" > index.html

echo "<h2> MM monagane R Mphelane</h2>" > index.html
echo "</body> " > index.html
echo "</html> "> index.html 

echo "Script has finished executing on `date`"

else
echo " symbolic link html not found " 
echo " script exiting….."
exit 1
fi
else
 echo "NGINX IS NOT RUNNING, TRY TO RE-INSTALL"
apt-get update
apt-get install nginx
systemctl start nginx
 exit 1
fi
