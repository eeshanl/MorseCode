module LFSR (Clock, Reset, Q);
input Clock, Reset;
output [9:1]Q;
wire P;

assign P = Q[5] ^~ Q[9];
FF one (Q[1], P, Reset, Clock);
FF two (Q[2], Q[1], Reset, Clock);
FF three (Q[3], Q[2], Reset, Clock);
FF four (Q[4], Q[3], Reset, Clock);
FF five (Q[5], Q[4], Reset, Clock);
FF six (Q[6], Q[5], Reset, Clock);
FF seven (Q[7], Q[6], Reset, Clock);
FF eight (Q[8], Q[7], Reset, Clock);
FF nine (Q[9], Q[8], Reset, Clock);

endmodule

module FF (Q, D, Reset, clk);
output Q;
input D, Reset, clk;
reg Q;
always @(posedge clk or posedge Reset)
if (Reset)
Q = 0;
else
Q = D;
endmodule