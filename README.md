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





