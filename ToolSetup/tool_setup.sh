#!/bin/bash

# Exit if error exist
set -eu

#Defining color variables:
CSTART='\e[0;32m'
Green='\033[0;32m'
Red='\033[0;31m'      
CEND='\033[0m'

##############################################################
# Utility functions are here:
##############################################################
function show_info()
{
	echo -e "${Green}##############################################################${CEND}"
	echo -e "      ${Green} $1 ${CEND}"
	echo -e "${Green}##############################################################${CEND}"
}

##############################################################
# Cleanup from previous instllation
##############################################################
show_info "cleanup from previous installation"
if [ -d iverilog ]; then
	rm -rf iverilog
fi

##############################################################
# install utilities
##############################################################
show_info "installing utilities"
apt-get update
apt-get install autoconf
apt-get install csh
apt-get install vim
apt-get install expect-dev
apt-get install gperf
##############################################################
# install opensource hw dev tool
##############################################################
show_info "install opensource hw dev tool"
# install git
apt-get -y install git
# install yosys
add-apt-repository ppa:saltmakrell/ppa -y
apt-get -y install yosys
#install icestorm
apt-get -y install build-essential clang bison flex libreadline-dev \
                     gawk tcl-dev libffi-dev mercurial graphviz \
                     xdot pkg-config python python3
# install pnr
apt-get -y install arachne-pnr

# install gtkwave
apt-get -y install gtkwave

# install verilator
apt-get install verilator

# install iverilog
# the ubuntu packege does not point to the latest and greatest for iverilog
# it misses g2012 flag which is needed by systemverilog.
git clone https://github.com/steveicarus/iverilog.git
cd iverilog 
autoconf
./configure
make 
make install
cd ..
rm -rf iverilog
##############################################################
#INSTALL JAVA and Scala
##############################################################
show_info "INSTALL JAVA and Scala"
#install jdk
apt-get -y install default-jdk
#install jre
apt-get -y install default-jre
#install scala
apt-get -y install scala
#install sbt
wget https://repo1.maven.org/maven2/org/scala-sbt/sbt-launch/1.0.0-M4/sbt-launch.jar
if [[ ! -d /usr/bin/ ]]; then
	mkdir /usr/bin
fi
mv sbt-launch.jar /usr/bin
echo -e "#!/bin/bash\nSBT_OPTS=\"-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M\"\njava \$SBT_OPTS -jar \`dirname \$0\`/sbt-launch.jar \"\$@\" " >> /usr/bin/sbt
chmod +x /usr/bin/sbt

##############################################################
# Test chisel installation 
##############################################################
show_info "Test chisel installation "
wget https://raw.githubusercontent.com/hossein1387/MkChiselProj/master/mkChiselProj.sh
chmod +x mkChiselProj.sh
./mkChiselProj.sh
cd chisel_proj
sbt test
