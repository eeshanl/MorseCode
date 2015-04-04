module userInput(Clock, IN, dot, dash, dotORdash);
	input Clock, IN;
	
	output reg dot, dash;
	output reg [5:0] dotORdash;
		
	always@(posedge Clock)
		if(!IN)
			dotORdash = 0;
		else 
			dotORdash++;
			
	always@(IN or dotORdash)
		if (dotORdash > 6'b000000  & dotORdash <= 6'b000101 & !IN)
			begin 
				dot = 1; 
				dash = 0;
			end
		else if (dotORdash > 6'b000101 & !IN)
			begin 
				dot = 0; 
				dash = 1; 
			end
		else 
			begin 
				dot = 0; 
				dash = 0; 
			end
endmodule


module userInput_testbench(); 
 reg Clock, reset, A; 
 wire dot, dash;
 wire [5:0] dotORdash;

 userInput dutuserInput (.Clock, .IN(A), .dot, .dash, .dotORdash);
  
 parameter CLOCK_PERIOD=100; 
 initial Clock=1; 
 always begin 
 #(CLOCK_PERIOD/2); 
 Clock = ~Clock; 
 end 
 
 initial begin 
 @(posedge Clock); 
 reset <= 1; @(posedge Clock); 
 reset <= 0; A <= 0;@(posedge Clock);
 @(posedge Clock);
 @(posedge Clock);
 @(posedge Clock);
 @(posedge Clock);
 A <= 1;@(posedge Clock);
 @(posedge Clock); 
 @(posedge Clock);
 @(posedge Clock);
 @(posedge Clock);
 A <= 0;@(posedge Clock);
 @(posedge Clock); 
 @(posedge Clock);
 @(posedge Clock);
 @(posedge Clock);
 A <= 1;@(posedge Clock);
 @(posedge Clock); 
 @(posedge Clock);
 @(posedge Clock);
 @(posedge Clock);
 $stop; // End the simulation. 
 end 
endmodule