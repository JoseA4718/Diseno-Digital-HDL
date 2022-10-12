## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
# Switches
set_property PACKAGE_PIN W2 [get_ports {Data_in[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Data_in[0]}]
set_property PACKAGE_PIN U1 [get_ports {Data_in[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Data_in[1]}]
set_property PACKAGE_PIN T1 [get_ports {Data_in[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Data_in[2]}]
set_property PACKAGE_PIN R2 [get_ports {Data_in[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Data_in[3]}]

 

    set_property PACKAGE_PIN P3 [get_ports {OUTbinario[0]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {OUTbinario[0]}]
    set_property PACKAGE_PIN N3 [get_ports {OUTbinario[1]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {OUTbinario[1]}]
    set_property PACKAGE_PIN P1 [get_ports {OUTbinario[2]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {OUTbinario[2]}]
    set_property PACKAGE_PIN L1 [get_ports {OUTbinario[3]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {OUTbinario[3]}]
	
#7 segment display
set_property PACKAGE_PIN W7 [get_ports {outDisplay[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {outDisplay[0]}]
set_property PACKAGE_PIN W6 [get_ports {outDisplay[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {outDisplay[1]}]
set_property PACKAGE_PIN U8 [get_ports {outDisplay[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {outDisplay[2]}]
set_property PACKAGE_PIN V8 [get_ports {outDisplay[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {outDisplay[3]}]
set_property PACKAGE_PIN U5 [get_ports {outDisplay[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {outDisplay[4]}]
set_property PACKAGE_PIN V5 [get_ports {outDisplay[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {outDisplay[5]}]
set_property PACKAGE_PIN U7 [get_ports {outDisplay[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {outDisplay[6]}]

set_property PACKAGE_PIN U2 [get_ports {Q1}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Q1}]
set_property PACKAGE_PIN U4 [get_ports {Q2}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Q2}]
set_property PACKAGE_PIN V4 [get_ports {an3}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an3}]
set_property PACKAGE_PIN W4 [get_ports {an4}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an4}]


##Boton de En medio
set_property PACKAGE_PIN U18 [get_ports rst]						
	set_property IOSTANDARD LVCMOS33 [get_ports rst]




#Sch name = XA1_P
set_property PACKAGE_PIN J3 [get_ports {vauxp6}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vauxp6}]
#Sch name = XA2_P
set_property PACKAGE_PIN L3 [get_ports {vauxp14}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vauxp14}]
#Sch name = XA3_P
set_property PACKAGE_PIN M2 [get_ports {vauxp7}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vauxp7}]
#Sch name = XA4_P
set_property PACKAGE_PIN N2 [get_ports {vauxp15}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vauxp15}]
#Sch name = XA1_N
set_property PACKAGE_PIN K3 [get_ports {vauxn6}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vauxn6}]
#Sch name = XA2_N
set_property PACKAGE_PIN M3 [get_ports {vauxn14}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vauxn14}]
#Sch name = XA3_N
set_property PACKAGE_PIN M1 [get_ports {vauxn7}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vauxn7}]
#Sch name = XA4_N
set_property PACKAGE_PIN N1 [get_ports {vauxn15}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vauxn15}]


