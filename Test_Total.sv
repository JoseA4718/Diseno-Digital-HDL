module Test_Total;

	// Inputs
	reg clk;
	reg rst;
	reg load;
	reg [3:0] Data_in;

	// Outputs
	wire [6:0] outDisplay;
	wire [3:0] OUTbinario;
	wire Q1;
	wire Q2;
	wire an3;
	wire an4;

	// Instantiate the Unit Under Test (UUT)
	Top uut (
		.clk(clk), 
		.rst(rst),  
		.Data_in(Data_in), 
		.outDisplay(outDisplay), 
		.OUTbinario(OUTbinario), 
		.Q1(Q1), 
		.Q2(Q2),
		.an3(an3), 
		.an4(an4)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		Data_in = 0;

		#20 rst=1;
		#20 rst=0;
		#20 Data_in = 4'b1011;
		
	end	
	initial
	
		forever
			#10 clk = ~clk;
    
endmodule
