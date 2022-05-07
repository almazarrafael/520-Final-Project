# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/rgalmazar/Documents/ECE520/FinalProject/520-Final-Project/software/Final_Project_App_system/_ide/scripts/debugger_final_project_app-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/rgalmazar/Documents/ECE520/FinalProject/520-Final-Project/software/Final_Project_App_system/_ide/scripts/debugger_final_project_app-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351AB72D0A" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351AB72D0A-13722093-0"}
fpga -file /home/rgalmazar/Documents/ECE520/FinalProject/520-Final-Project/software/Final_Project_App/_ide/bitstream/Final_Project_BD_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/rgalmazar/Documents/ECE520/FinalProject/520-Final-Project/software/Final_Project_Platform/export/Final_Project_Platform/hw/Final_Project_BD_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/rgalmazar/Documents/ECE520/FinalProject/520-Final-Project/software/Final_Project_App/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/rgalmazar/Documents/ECE520/FinalProject/520-Final-Project/software/Final_Project_App/Debug/Final_Project_App.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
