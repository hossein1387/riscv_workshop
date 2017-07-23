# Workshop Tool Setup:

To be able to do the labs in the workshop, you need to install developmnet tools
on your computer. The following is the instructions on how to install these tools
in your computer. 

There are two ways to install all the required tools on your machine. The easier way is to install docker on your machine and use the ubuntu image that I created which has all the required tools pre-installed. The other way is to use [this](https://raw.githubusercontent.com/hossein1387/riscv_workshop/master/ToolSetup/tool_setup.sh) script on your Ubuntu machine (you must have installed Ubuntu on you machine to use this script). In the following sections, I walk you through both ways.

## Using Docker

To coordinate the workshop's lab easier, I created a docker image that have all the required tools pre-installed. This makes for efficient, lightweight, self-contained system and guarantees that software will always run the same, regardless of where it’s deployed.

![alttext](../Files/DockerLogo.png)

What docker allows us to do is to use a common development environment regardless of the host (user's) operating system. You can install docker on [Windows](https://www.docker.com/docker-windows), [MascOSX](https://www.docker.com/docker-mac) and [Ubuntu](https://www.docker.com/docker-ubuntu). The installation process is pretty easy to do, so just follow the links above on docker website. I will assume you have been able to install docker on your computer.

After successful installation, make sure docker is running and then use the following command to pull the image that I created:

    docker pull hossein1387/opensource_hw

The image file is around 600MB so it takes some time to download the it. After
that, you should be able to run it using the following command:

    docker run -it hossein1387/opensource_hw

And just like that, you have booted an Ubuntu on your machine! To check if everything is working, run the following commands:

    cd /home/chisel_proj
    sbt test

The output should look like this:

    ======================================
    Test Pass!
    ======================================
    test chisel_proj Success: 101 tests passed in 106 cycles taking 0.094898 seconds
    [info] [0.071] RAN 101 CYCLES PASSED
    [info] chisel_projTester:
    [info] FullAdder
    [info] - should Implement simple 32bit register (with firrtl)
    [info] ScalaTest
    [info] Run completed in 2 seconds, 950 milliseconds.
    [info] Total number of tests run: 1
    [info] Suites: completed 1, aborted 0
    [info] Tests: succeeded 1, failed 0, canceled 0, ignored 0, pending 0
    [info] All tests passed.
    [info] Passed: Total 1, Failed 0, Errors 0, Passed 1
    [success] Total time: 6 s, completed Jul 23, 2017 4:44:28 AM

Congratulations! you just ran your first Chisel code!
## Using Script

As mentioned earlier, to use the script, you first need to install Ubuntu on your computer. After that you can run the script using these commands:

    git clone https://github.com/hossein1387/riscv_workshop.git
    cd riscv_workshop/ToolSetup
    chmod +x tool_setup
    sudo ./tool_setup.sh

The installation will take some time. The script will install the following tools on you machine:

[yosys](https://github.com/cliffordwolf/yosys.git)
[icestorm](https://github.com/cliffordwolf/icestorm.git)
[arachne-pnr](https://github.com/cseed/arachne-pnr.git)
[gtkwave](http://gtkwave.sourceforge.net/)
[verilator](https://www.veripool.org/wiki/verilator)
[iverilog](http://iverilog.icarus.com/)
[scala and sbt for chisel](https://chisel.eecs.berkeley.edu/)

To make sure everything is installed properly, you can run a basic chisel project. For that, you can use the following commands:

    wget https://raw.githubusercontent.com/hossein1387/MkChiselProj/master/mkChiselProj.sh
    chmod +x mkChiselProj.sh
    ./mkChiselProj.sh
    cd chisel_proj
    sbt test

The output should look like this:

    ======================================
    Test Pass!
    ======================================
    test chisel_proj Success: 101 tests passed in 106 cycles taking 0.094898 seconds
    [info] [0.071] RAN 101 CYCLES PASSED
    [info] chisel_projTester:
    [info] FullAdder
    [info] - should Implement simple 32bit register (with firrtl)
    [info] ScalaTest
    [info] Run completed in 2 seconds, 950 milliseconds.
    [info] Total number of tests run: 1
    [info] Suites: completed 1, aborted 0
    [info] Tests: succeeded 1, failed 0, canceled 0, ignored 0, pending 0
    [info] All tests passed.
    [info] Passed: Total 1, Failed 0, Errors 0, Passed 1
    [success] Total time: 6 s, completed Jul 23, 2017 4:44:28 AM

Congratulations! you just ran your first Chisel code!
