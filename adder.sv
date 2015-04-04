module adder (A, B, C, D, E);
input A,B,C;
output E,D;

assign D = ( A & B ) |  ( C & ( A | B ) );
assign E = (A^B)^C;
endmodule

module addMod (A, B, E, clk, Reset);
input [8:0] A,B;
input clk, Reset;
output [9:0] E;
wire [9:0]D;

assign E[9] = D[8];
adder a(A[0],B[0],0,D[0],E[0]);
adder b(A[1],B[1],D[0],D[1],E[1]);
adder c(A[2],B[2],D[1],D[2],E[2]);
adder d(A[3],B[3],D[2],D[3],E[3]);
adder e(A[4],B[4],D[3],D[4],E[4]);
adder f(A[5],B[5],D[4],D[5],E[5]);
adder g(A[6],B[6],D[5],D[6],E[6]);
adder h(A[7],B[7],D[6],D[7],E[7]);
adder i(A[8],B[8],D[7],D[8],E[8]);

endmodule