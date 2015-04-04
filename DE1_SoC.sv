module DE1_SoC (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, SW); 
 input CLOCK_50;
 input  [3:3] KEY;
 input [9:9] SW;
 
 clock_divider cdiv (CLOCK_50, Clock); 
 wire [31:0] Clock; 
 parameter whichClock = 20; 
 
 output reg [0:6] HEX2, HEX3, HEX4, HEX5;
 output [0:6] HEX0, HEX1;
 
 assign HEX2 = 7'b1111111;
 assign HEX3 = 7'b1111111; 
 assign HEX4 = 7'b1111111;
	
 wire [5:0] dotORdash;
 wire IN, dot, dash;
	
	
	userInput length(.Clock(Clock[whichClock]), .IN(~KEY[3]), .dot, .dash, .dotORdash);
	morse code(.Clock(Clock[whichClock]), .reset(SW[9]), .dot, .dash, .D_1(HEX1), .D_0(HEX0));
	
	// indicates on HEX5 if user inputed a dot or dash
	always @(dot or dash or dotORdash)
		// dash
		if (dotORdash >= 6'b000110)
			HEX5 = ~(7'b1000000);
		// dot
		else if(dotORdash >= 6'b000001 & dotORdash <= 6'b000101)
			HEX5 = ~(7'b1111111);
		// neither
		else 
		   HEX5 = ~(7'b0000000);
 endmodule 
 
 //Clock divider to slow things down
 module clock_divider (clock, divided_clocks); 
 input clock; 
 output [31:0] divided_clocks; 
 reg [31:0] divided_clocks; 
 
 initial 
 divided_clocks = 0; 
 
 always @(posedge clock) 
 divided_clocks = divided_clocks + 1; 
endmodule