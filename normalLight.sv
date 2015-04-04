module normalLight (Clock, Reset, L, R, NL, NR, lightOn); 
 input Clock, Reset;
 input L, R, NL, NR;
 output reg lightOn;
 reg PS;
 reg NS;
 parameter off = 1'b0, on = 1'b1;
   
 always @(*)
case (PS)
	off:
	if ((R & NL & ~L) |(L & NR & ~R)) NS = on;
	else NS = off;
	
	on:
	if (L ^ R) NS = off;
	else NS = on;
	
	default NS = 1'bx;
	endcase
	
always @(*)
case (PS)
	off: lightOn = 0;
	on: lightOn = 1;
	default lightOn = 1'bx;
	endcase
	

 // DFF
 always @(posedge Clock) 
	if (Reset) 
		PS <= off; 
	else 
		PS <= NS;
  
endmodule