module centerLight (Clock, Reset, L, R, NL, NR, lightOn, win1, win2); 
 input Clock, Reset, win1, win2, L, R, NL, NR;
 output lightOn;
 reg PS;
 reg NS;

 parameter on = 1'b0, off = 1'b1;
 
 always @(*)
	case(PS)
		on: if (L ^ R) NS = off;
			 else NS = on;
			 
		off: if ((L & ~R & NR) | (~L & R & NL) | win1 | win2) NS = on;
			  else NS = off;
		default: NS = 1'bx;
	endcase
	
 always @(*)
	case(PS)
		on: lightOn = 1;
		off: lightOn = 0;
		default: lightOn = 1'bx;
	endcase
	
 // DFF
 always @(posedge Clock) 
	if (Reset) 
		PS <= on; 
	else 
		PS <= NS;
		
endmodule