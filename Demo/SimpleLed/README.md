## Simple LED demo:

For MacOSX users, make sure Apple FTDI and FTDI drivers are not loaded:

    sudo kextunload -b com.FTDI.driver.FTDIUSBSerialDriver
    sudo kextunload -b com.apple.driver.AppleUSBFTDI

Then you can run the following command to generate FPGA binary file:

    make

The result should be a binary file. Then, you should be able to program the FPGA by running the following command:

    iceprog SimpleLed.bin 

This should be the output:

    init..
    cdone: low
    reset..
    cdone: low
    flash ID: 0x20 0xBA 0x16 0x10 0x00 0x00 0x23 0x12 0x42 0x18 0x03 0x00 0x56 0x00 0x18 0x03 0x11 0x11 0x8E 0xE3
    file size: 135100
    erase 64kB sector at 0x000000..
    erase 64kB sector at 0x010000..
    erase 64kB sector at 0x020000..
    programming..
    reading..
    VERIFY OK
    cdone: high
    Bye.