##############################################################
# install opensource hw dev tool
##############################################################
# install git
sudo apt-get install git
# install yosys
sudo apt-get install yosys
#install icestorm
sudo apt-get install build-essential clang bison flex libreadline-dev \
                     gawk tcl-dev libffi-dev mercurial graphviz \
                     xdot pkg-config python python3 libftdi-dev
# install pnr
sudo apt-get install arachne-pnr

# install gtkwave
sudo apt-get install gtkwave

##############################################################
#INSTALL JAVA and Scala
##############################################################
#install jdk
sudo apt-get install default-jdk
#install jre
sudo apt-get install default-jre
#install scala
sudo apt-get install scala
#install sbt
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install sbt


##############################################################
# Test chisel installation 
##############################################################
wget https://raw.githubusercontent.com/hossein1387/MkChiselProj/master/mkChiselProj.sh
chmod +x mkChiselProj.sh
cd chisel_proj
sbt test
