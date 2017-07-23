# Workshop Tool Setup:

To be able to for the labs in the workshop, you need to install developmnet tools
on your computer. The following is the instructions on how to install these tools
in your computer.

## System Setup

To coordinate the workshop's lab easier, I created a Docker image that have all the required tools pre install. This makes for efficient, lightweight, self-contained systems and guarantees that software will always run the same, regardless of where it’s deployed.
![alttext](../Files/DockerLogo.png)




The script will install the following tools:

[yosys](https://github.com/cliffordwolf/yosys.git)
[icestorm](https://github.com/cliffordwolf/icestorm.git)
[arachne-pnr](https://github.com/cseed/arachne-pnr.git)
[gtkwave](http://gtkwave.sourceforge.net/)
[verilator](https://www.veripool.org/wiki/verilator)
[iverilog](http://iverilog.icarus.com/)
[scala and sbt for chisel](https://chisel.eecs.berkeley.edu/)

Based on scripts/tool_setup.sh, I have created a docker image which can be downloaded by the following command:

	docker pull hossein1387/opensource_hw
