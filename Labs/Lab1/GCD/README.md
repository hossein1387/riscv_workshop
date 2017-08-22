## LAB1 for RISC-V workshop:

In this lab, we will be using the open source hw development tools to design a Greatest Common Divisor (GCD). The base project can be found in this repository. To be able to work on this lab, you need to have the following tools installed:

    git
    Icarus Verilog

If you are using the workshop docker [image](https://hub.docker.com/r/hossein1387/opensource_hw/), all the requirments are pre-installed. In this lab you have to implement a GCD circuit. To work on the lab, make sure the hossein1387/riscv_workshop is already cloned. If not use the following command:
 
    git clone https://github.com/hossein1387/riscv_workshop.git

After the repository is cloned, change directory to Lab1:

    cd riscv_workshop/Labs/Lab1/GCD

The lab comes with a self checking test. Since the GCD should output results on every pos edge of the clock, running the script will not pass (infinite wait). You are only asked to fill out the combinational part of the circuit. You don't need to add any more line of code. So try to just fill out the missing parts.

    

     

