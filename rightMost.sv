module rightMost(Clock, Reset,L, R, NL, lightOn, winner);
input Clock, Reset, L, R, NL;
output reg lightOn; 
output reg winner;
reg [1:0] PS;
reg [1:0] NS;

parameter [1:0] off= 2'b00, on= 2'b01, win= 2'b10;

	always @(*)
		case(PS)
			off: if(R & NL) NS = on;
				  else NS = off;
				 
			on: if (L) NS = off;
				 else if (R) NS = win;
				 else NS = on;
				 
			win: NS = off;
			default: NS =2'bxx;
		endcase
	
	always @(*)
		case(PS)
		off: begin
				lightOn = 0;
				winner = 0;
			  end
			  
		on: begin
				lightOn = 1;
				winner = 0;
			 end
			 
		win: begin
				lightOn = 0;
				winner = 1;
			  end
		default: lightOn =1'bx;
	endcase
	
 // DFF
 always @(posedge Clock) 
	if (Reset) 
		PS <= off; 
	else 
		PS <= NS;
		
endmodule