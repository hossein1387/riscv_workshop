##############################################################
# install opensource hw dev tool
##############################################################
# install git
apt-get install git
# install yosys
apt-get install yosys
#install icestorm
 apt-get install build-essential clang bison flex libreadline-dev \
                     gawk tcl-dev libffi-dev mercurial graphviz \
                     xdot pkg-config python python3
# install pnr
apt-get install arachne-pnr

# install gtkwave
apt-get install gtkwave

##############################################################
#INSTALL JAVA and Scala
##############################################################
#install jdk
apt-get install default-jdk
#install jre
apt-get install default-jre
#install scala
apt-get install scala
#install sbt
wget http://apt.typesafe.com/repo-deb-build-0002.deb
dpkg -i repo-deb-build-0002.deb
apt-get update
apt-get install sbt
rm -f repo-deb-build-0002.deb

##############################################################
# Test chisel installation 
##############################################################
wget https://raw.githubusercontent.com/hossein1387/MkChiselProj/master/mkChiselProj.sh
chmod +x mkChiselProj.sh
./mkChiselProj.sh
cd chisel_proj
sbt test
