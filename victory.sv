module victory (Clock, Reset, vict, out);
input Clock, Reset, vict;
output reg [6:0] out;
reg [2:0] PS;
reg [2:0] NS;

parameter [2:0] O=3'b000, ONE=3'b001, TWO=3'b010, THREE=3'b011, FOUR=3'b100, FIVE=3'b101, SIX=3'b110, SEVEN=3'b111;


always@(*) begin
if (vict) begin
case (PS)
O: NS = ONE;
ONE: NS = TWO;
TWO: NS = THREE;
THREE: NS = FOUR;
FOUR: NS = FIVE;
FIVE: NS = SIX;
SIX: NS = SEVEN;
SEVEN: NS= SEVEN;
default: NS = 3'bxxx;
endcase
end
else begin
NS = PS;
end
end

always @ (*)
case (PS)
O: out = ~7'b0111111;
ONE: out = ~7'b0000110;
TWO: out = ~7'b1011011;
THREE: out = ~7'b1001111;
FOUR: out = ~7'b1100110;
FIVE: out = ~7'b1101101;
SIX: out = ~7'b1111101;
SEVEN: out = ~7'b0000111;
default: out = 7'bxxxxxxx;
endcase

 // DFF
 always @(posedge Clock) 
	if (Reset) 
		PS <= 0; 
	else 
		PS <= NS;
endmodule

