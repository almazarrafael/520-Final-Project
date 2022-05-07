# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/rgalmazar/Documents/ECE520/FinalProject/520-Final-Project/software/Final_Project_Platform/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/rgalmazar/Documents/ECE520/FinalProject/520-Final-Project/software/Final_Project_Platform/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {Final_Project_Platform}\
-hw {/home/rgalmazar/Documents/ECE520/FinalProject/520-Final-Project/hardware/Final_Project/Final_Project_BD_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {/home/rgalmazar/Documents/ECE520/FinalProject/520-Final-Project/software}

platform write
platform generate -domains 
platform active {Final_Project_Platform}
platform generate
platform clean
platform generate
