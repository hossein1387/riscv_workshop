#!/bin/csh -f
set IRUN_EXIST=0
set IVERILOG_EXIST=0
set SIM=""

which irun >& /dev/null
if ($status != 1) then
    echo "found irun on this system!"
    set SIM="irun"
    set IRUN_EXIST=1    
endif

which iverilog >& /dev/null
if ($status != 1) then
    echo "found iverilog on this system!"
    set SIM="iverilog"
    set IVERILOG_EXIST=1
endif

if ( ( $IRUN_EXIST == 0 ) && ( $IVERILOG_EXIST == 0 ) ) then
    echo "Neither irun nor iverilog exist on this machine!"
    echo "I give up"
    exit(1)
endif


#Test case name
if ($#argv >= 1) then
	set args    = $#argv	
	set j = 1 
	set flags = ""
	while ( $j <= $args )
	    switch ($argv[$j])
	        case [gG][uU][iI]:
                set flags = "$flags -gui"
                breaksw
	        case [rR][aA][nN][dD]:
                set flags = "$flags -svseed random"
                breaksw
	        case [cC][oO][vV]:
                set flags = "$flags -coverage functional -covoverwrite -covfile ${SCRIPTS_DIR}/cov_config.ccf"
                breaksw
	        case [dD][bB][gG]:
                set flags = "$flags -linedebug"
                breaksw
	        default:
	            echo "Invalid argument $argv[$j]"
	            exit(1)
	       endsw
	  @ j++
	end
    if ( -f files.f) then 
        set flags = "$flags -f files.f"
    endif
    echo "flags = $flags"
    if( $IVERILOG_EXIST == 1 ) then
        echo "running test...   "
        iverilog '-Wall' '-g2012' -f files.f && unbuffer vvp a.out 
    else 
        irun +access+rwc $flags
    endif
else
    if( $IVERILOG_EXIST == 1 ) then
        echo "running test...   "
        iverilog '-Wall' '-g2012' -f files.f && unbuffer vvp a.out 
    else if ( $IRUN_EXIST == 1 ) 
        irun +access+rwc -f files.f
    else
        echo "No simulator was set to use!"
        exit(1)
    endif
endif
