#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/zhome/06/1/78900/Xilinx/SDK/2018.2/bin:/zhome/06/1/78900/Xilinx/Vivado/2018.2/ids_lite/ISE/bin/lin64:/zhome/06/1/78900/Xilinx/Vivado/2018.2/bin
else
  PATH=/zhome/06/1/78900/Xilinx/SDK/2018.2/bin:/zhome/06/1/78900/Xilinx/Vivado/2018.2/ids_lite/ISE/bin/lin64:/zhome/06/1/78900/Xilinx/Vivado/2018.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/zhome/06/1/78900/Xilinx/Vivado/2018.2/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/zhome/06/1/78900/Xilinx/Vivado/2018.2/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/zhome/c5/3/156238/PWA/PWA/PWA.runs/impl_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

# pre-commands:
/bin/touch .init_design.begin.rst
EAStep vivado -log MUX16x1x8.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source MUX16x1x8.tcl -notrace


