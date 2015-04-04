module seg7_display (bcd, led0, led1, led2, led3, led4);
	input [2:0] bcd;
	output reg [6:0] led0, led1, led2, led3, led4;
	
	always @(*)
	case (bcd)
	// Light:		    6543210
	3'b000:			begin
				led0 = 7'b1001000;
				led1 = 7'b1001000;
				led2 = 7'b0001000;
				led3 = 7'b1000110;
				led4 = 7'b1111111; // Macbook, expensive
				end
				
	3'b001:			begin
				led0 = 7'b1001110;
				led1 = 7'b1111110;
				led2 = 7'b1111111;
				led3 = 7'b1111110;
				led4 = 7'b1111111; // gun
				end
	3'b011:			begin
				led0 = 7'b1110111;
				led1 = 7'b1001110;
				led2 = 7'b1111000;
				led3 = 7'b1110111;
				led4 = 7'b1111111; // hat
				end
	3'b100:			begin
				led0 = 7'b0001111;
				led1 = 7'b0111111;
				led2 = 7'b0111111;
				led3 = 7'b0111111;
				led4 = 7'b0111011; // bed, expensive
				end
	3'b101:			begin
				led0 = 7'b0000000;
				led1 = 7'b1000001;
				led2 = 7'b0010010;
				led3 = 7'b1111111;
				led4 = 7'b1111111; // bus, expensive
				end
	3'b110:			begin
				led0 = 7'b0000110;
				led1 = 7'b0111111;
				led2 = 7'b0111111;
				led3 = 7'b0111111;
				led4 = 7'b0111101; // umbrella
				end

	default:			begin
				led0 = 7'bX;
				led1 = 7'bX;
				led2 = 7'bX;
				led3 = 7'bX;
				led4 = 7'bX;
				end
	endcase			
endmodule