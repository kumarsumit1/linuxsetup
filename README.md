# linuxsetup

# Install JDK oracle

Download JDK from :

  https://www.oracle.com/java/technologies/javase-downloads.html

Install JDK :
  sudo apt install ./jdk-14.0.1_linux-x64_bin.deb 


Use the update-alternatives command to set the path to the Oracle Java executable: 

  $ sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-14.0.1/bin/java 1
  $ sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-14.0.1/bin/javac 1
  $ sudo update-alternatives --install /usr/bin/jps jps /usr/lib/jvm/jdk-14.0.1/bin/jps 1

Confirm the Oracle Java installation: 
  $ java --version

  $ javac --version

Set JAVA_HOME path

create a file java_env.sh 
export JAVA_HOME="usr/lib/jvm/jdk-14.0.1"

export PATH=$JAVA_HOME/bin:$PATH

add above two lines and source /etc/profile or reboot the system for changes to take effect

# Change python3 to python
check if there are any alternatives for python 

$ sudo update-alternatives --config python

If you get the error "no alternatives for python" then set up an alternative with the following command:

$ sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10

# Install Pip

sudo apt update
sudo apt install python3-pip
pip3 --version

sudo update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1



# Remove a software

$sudo apt-get purge pip3

$sudo apt-get autoremove


# Install Eclipse

Download Eclipse


$tar -zxvf eclipse-jee-photon-R-linux-gtk-x86_64.tar.gz -C /opt

Simply create an eclipse binary symbolic link to make it accessible system-wide.

ln -s /opt/eclipse/eclipse /usr/local/bin/eclipse

Configure Eclipse Launcher

vim /usr/share/applications/eclipse.desktop

Add the entry to file and save it.

[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=Eclipse
GenericName=Eclipse IDE
Comment=Integrated Development Environment
Exec=/usr/local/bin/eclipse
Icon=/opt/eclipse/icon.xpm
Terminal=false
Type=Application
StartupNotify=false
NoDisplay=false
Categories=Development;IDE;




# Install VS Code

Download debian package from :
https://code.visualstudio.com/download


# Install Dbeaver 

Download debain package from :

https://dbeaver.io/download/


# Install Docker by addding repositry

Uninstall old versions
$ sudo apt-get remove docker docker-engine docker.io containerd runc

It’s OK if apt-get reports that none of these packages are installed.

Note :
  While set up the repository

$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
The above command uses lsb_release -cs which in elementry doesnt correspond to its respective Ubuntu codename
Hence using below command figure out the codename of ubuntu and replace it with the code $(lsb_release -cs) 

$lsb_release -au
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 18.04.4 LTS
Release:	18.04
Codename:	bionic

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   bionic \
   stable"




If you want to run docker as non-root user then you need to add it to the docker group.

    Create the docker group if it does not exist

$ sudo groupadd docker

    Add your user to the docker group.

$ sudo usermod -aG docker $USER

    Run the following command or Logout and login again and run (that doesn't work you may need to reboot your machine first)

$ newgrp docker

    Check if docker can be run without root

$ docker run hello-world

  Note : To check user has been added in the group

$ groups $USER


#Install Meld

sudo apt-get install meld

#Install Only office

https://www.onlyoffice.com/en/download-desktop.aspx

