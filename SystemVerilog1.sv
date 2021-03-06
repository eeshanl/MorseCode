module SystemVerilog1 (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, 
SW); 
 input CLOCK_50; // 50MHz clock. 
 output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; 
 output [9:0] LEDR; 
 input [3:0] KEY; // True when not pressed, False when pressed 
 input [9:0] SW; 
 
 // Generate clk off of CLOCK_50, whichClock picks rate. 
 wire [31:0] clk; 
 parameter whichClock = 25; 
 clock_divider cdiv (CLOCK_50, clk); 
 
 // Hook up FSM inputs and outputs. 
 wire reset, w, out; 
 assign reset = ~KEY[0]; // Reset when KEY[0] is pressed. 
 assign w = ~KEY[1]; 
 
 simple2 s (.clk(clk[whichClock]), .reset, .w, .out); 
 
 // Show signals on LEDRs so we can see what is happening. 
 assign LEDR = { clk[whichClock], 1'b0, reset, 2'b0, out}; 
 
endmodule 
 
// divided_clocks[0] = 25MHz, [1] = 12.5Mhz, ... [23] = 3Hz, [24] = 1.5Hz, 
//[25] = 0.75Hz, ... 
module clock_divider2 (clock, divided_clocks); 
 input clock; 
 output [31:0] divided_clocks; 
 reg [31:0] divided_clocks; 
 
 initial 
 divided_clocks = 0; 
 
 always @(posedge clock) 
 divided_clocks = divided_clocks + 1; 
endmodule

module simple2 (clk, reset, w, out); 
 input clk, reset, w; 
 output reg out; 
 reg [1:0] ps; // Present State 
 reg [1:0] ns; // Next State 
 
 // State encoding. 
 parameter [1:0] A = 2'b00, B = 2'b01, C = 2'b10; 
 
 // Next State logic 
 always @(*) 
 case (ps) 
 A: if (w) ns = B; 
 else ns = A; 
 B: if (w) ns = C; 
 else ns = A; 
 C: if (w) ns = C; 
 else ns = A; 
 default: ns = 2'bxx; 
 endcase 
 
 // Output logic - could also be another always, or part of above block. 
 assign out = (ps == C); 
 
 // DFFs 
 always @(posedge clk) 
 if (reset) 
 ps <= A; 
 else 
 ps <= ns; 
 
endmodule 

module simple_testbench(); 
 reg clk, reset, w; 
 wire out; 
 
 simple dut (clk, reset, w, out); 
 
 // Set up the clock. 
 parameter CLOCK_PERIOD=100; 
 initial clk=1; 
 always begin 
 #(CLOCK_PERIOD/2); 
 clk = ~clk; 
 end 
 
 // Set up the inputs to the design. Each line is a clock cycle. 
 initial begin 
 @(posedge clk); 
 reset <= 1; @(posedge clk); 
 reset <= 0; w <= 0; @(posedge clk); 
 @(posedge clk); 
 @(posedge clk); 
 @(posedge clk); 
 w <= 1; @(posedge clk); 
 w <= 0; @(posedge clk); 
 w <= 1; @(posedge clk); 
 @(posedge clk); 
 @(posedge clk); 
 @(posedge clk); 
 w <= 0; @(posedge clk); 
 @(posedge clk); 
 $stop; // End the simulation. 
 end 
endmodule

