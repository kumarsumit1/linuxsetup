# linuxsetup

sudo apt update
sudo apt upgrade

sudo apt dist-upgrade
sudo apt full-upgrade

# Setup and check Deep Sleep:

example of deep sleep disabled:

```
[jeremy@fwfedora ~]$ cat /sys/power/mem_sleep
[s2idle] deep
[jeremy@fwfedora ~]$
```
example of deep sleep enabled:

```
[root@fwfedora ~]# cat /sys/power/mem_sleep 
s2idle [deep]
[root@fwfedora ~]# ```
```

To enable deep sleep on Ubuntu 21.04 (kernel 5.11)

    Find the following line in the /etc/default/grub file:
    GRUB_CMDLINE_LINUX_DEFAULT=“quiet splash"

    Change it to:
    GRUB_CMDLINE_LINUX_DEFAULT=“quiet splash mem_sleep_default=deep”

    Run sudo update-grub

    Reboot
    a. To verify, run the following from the terminal:
    cat /sys/power/mem_sleep
    b. If the output is s2idle [deep] then deep sleep is enabled (note the brackets are on “deep”)

# Working with Flatpak

flatpak remotes

flatpak list

flatpak update


flatpak repair --user && sudo flatpak reapir --system


sudo flatpak repair

flatpak uninstall [Application ID]


flatpak uninstall --unused

# Check Wifi Drivers

Download the script from : https://github.com/UbuntuForums/wireless-info

wget -N -t 5 -T 10 https://github.com/UbuntuForums/wireless-info/raw/master/wireless-info && \
chmod +x wireless-info && \
./wireless-info

This will generate a text file with all the details of drivers.

OR follow following steps 

1. Check the wifi hardware 

    sudo lspci -nn | grep -i network
    sudo lspci -v
OR
    sudo lshw -C network

output would be something like :

description: Network controller
       product: BCM43142 802.11b/g/n
       vendor: Broadcom Inc. and subsidiaries

2. List all the wifi networks (Very nice tool) : network manager command line interface device wifi
    nmcli device wifi




Note: 
1. All the network connection files are stored at /etc/NetworkManager/system-connections
2. Scan wifi networks
    sudo iwlist scan
3. List of all dirvers being used
    sudo inxi -Fxz
4. Check Blocking
    sudo rfkill list       


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


 
# Install Skype
Skype is available from the official Microsoft Apt repositories. To install it, follow the steps below:

    Open your terminal and download the latest Skype .deb package using the following wget command:

    wget https://go.skype.com/skypeforlinux-64.deb

    Once the download is complete, install Skype by running the following command as a user with sudo privileges :

    sudo apt install ./skypeforlinux-64.deb

    You will be prompted to enter your password.

During the installation process, the official Skype repository will be added to your system. When a new version is released, you can update the Skype package through your desktop standard Software Update tool or by running the following commands in your terminal:

sudo apt update
sudo apt upgrade

# Framework related optimization
1. Update BIOS : https://knowledgebase.frame.work/en_us/framework-laptop-bios-releases-S1dMQt6F 
2. Improving battery usage : https://luisartola.com/solving-the-framework-laptop-battery-drain/
3. Framework Guides  : https://guides.frame.work/ , Go to last section of how to that has installation guides.
        Installation Guide Pop OS : https://guides.frame.work/Guide/Pop!_OS+21.10+Installation+on+the+Framework+Laptop/115?lang=en
        
Known Issues:
1. Touch pad freeze
2. Earphone mic
3. Fractional scaling of display
4. 
