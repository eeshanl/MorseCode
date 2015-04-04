module morse (Clock, reset, dot, dash, D_0, D_1);
	input Clock, reset, dot, dash;
	output reg [0:6] D_0, D_1;

	wire [5:0]ps;
	reg [5:0]ns;
	
	parameter nothing = 6'b000000, A = 6'b000001, B = 6'b000010, C = 6'b000011, D = 6'b000100, E = 6'b000101, F = 6'b000110, 
				 G = 6'b000111, H = 6'b001000, I = 6'b001001, J = 6'b001010, K = 6'b001011, L = 6'b001100, M = 6'b001101, 
				 N = 6'b001110, O = 6'b001111, P = 6'b010000, Q = 6'b010001, R = 6'b010010, S = 6'b010011, T = 6'b010100, 
				 U = 6'b010101, V = 6'b010110, W = 6'b010111, X = 6'b011000, Y = 6'b011001, Z = 6'b011010, ZERO = 6'b011011, 
				 ONE = 6'b011100, TWO = 6'b011101, THREE = 6'b011110, FOUR = 6'b011111, FIVE = 6'b100000, SIX = 6'b100001,
				 SEVEN = 6'b100010, EIGHT = 6'b100011, NINE = 6'b100100, RANDOM_1 = 6'b100101, RANDOM_2 = 6'b100110, 
				 RANDOM_3 = 6'b100111;
	
	always @(*)
		case (ps)
			nothing: if (dot == 1 & dash == 0) 
						ns = E;
					 else if (dot == 0 & dash == 1) 
						ns = T;
					 else 
						ns = nothing;
			RANDOM_1: if (dot == 0 & dash == 1) 
							 ns = TWO;
						 else if (dot ==0 & dash == 0) 
						    ns = RANDOM_1;
						 else 
							 ns = nothing;
			RANDOM_2: if (dot == 0 & dash == 0) 
						    ns = RANDOM_2;
						 else if (dot == 1 & dash == 0) 
						    ns = EIGHT;
						 else 
							 ns = nothing;
			RANDOM_3: if (dot ==0 & dash == 1) 
					 ns = ZERO;
				 else if (dot == 1 & dash == 0) 
					 ns = NINE;
				 else if (dot ==0 & dash == 0) 
					 ns = RANDOM_3;
				 else
					 ns = nothing;				
			A: if (dot == 1 & dash == 0) 
					ns = R;
				else if (dot == 0 & dash == 1) 
					ns = W;
				else 
					ns = A;
			B: if (dot == 0 & dash == 0) 
					ns = B;
				else if (dot == 1 & dash == 0) 
					ns = SIX;
				else 
					ns = nothing;
			C: if (dot ==0 & dash == 0) 
					ns = C;
				else 
					ns = nothing; 
			D: if (dot == 0 & dash == 1) 
					ns = X;
				else if (dot == 1 & dash == 0) 
					ns = B;
				else 
					ns = D;
			E: if (dot == 0 & dash == 1) 
					ns = A;
				else if (dot == 1 & dash == 0) 
					ns = I;
				else 
					ns = E;
			F: if (dot ==0 & dash == 0) 
					ns = F;
				else 
					ns = nothing;
			G: if (dot == 0 & dash == 1) 
					ns = Q;
				else if (dot == 1 & dash == 0) 
					ns = Z;
				else 
					ns = G;
			H: if (dot == 0 & dash == 1) 
					ns = FOUR;
				else if (dot ==1 & dash == 0) 
					ns = FIVE;
				else 
					ns = H;
			I: if (dot == 1 & dash == 0) 
					ns = S;
				else if (dot == 0 & dash == 1) 
					ns = U;
				else 
					ns = I;
			J: if (dot == 0 & dash == 1) 
					ns = ONE;
				else if (dot == 0 & dash == 0) 
					ns = J;
				else 
					ns = nothing;
			K: if (dot == 1 & dash == 0) 
					ns = C;
				else if (dot == 0 & dash == 1) 
					ns = Y;
				else 
					ns = K;	
			L: if (dot ==0 & dash == 0) 
					ns = L;
				else 
					ns = nothing;
			M: if (dot == 1 & dash == 0) 
					ns = G;
				else if (dot == 0 & dash == 1) 
					ns = O;
				else 
					ns = M;
			N: if (dot == 1 & dash == 0) 
					ns = D;
				else if (dot == 0 & dash == 1) 
					ns = K;
				else 
					ns = N;
			O: if(dot == 0 & dash == 0) 
					ns = O;
				else if (dot ==1 & dash == 0) 
					ns = RANDOM_2;
				else if (dot == 0 & dash == 1)
					ns = RANDOM_3;
				else
					ns = nothing;
			P: if (dot ==0 & dash == 0) 
					ns = P;
				else 
					ns = nothing;
			Q: if (dot ==0 & dash == 0) 
					ns = Q;
				else 
					ns = nothing;	
			R: if (dot == 1 & dash == 0) 
					ns = L;
				else if (dot == 0 & dash == 0) 
					ns = R;
				else 
					ns = nothing;
			S: if (dot == 1 & dash == 0) 
					ns = H;
				else if (dot == 0 & dash == 1) 
					ns = V;
				else 
					ns = S;
			T: if (dot == 1 & dash == 0) 
					ns = N;
				else if (dot == 0 & dash == 1) 
					ns = M;
				else 
					ns = T;
			U: if (dot == 1 & dash == 0) 
					ns = F;
				else if (dot == 0 & dash == 1) 
					ns = RANDOM_1;
				else if (dot == 0 & dash == 0) 
					ns = U;
				else 
					ns = nothing;
			V: if (dot ==0 & dash == 1) 
					ns = THREE;
				else if (dot ==0 & dash == 0) 
					ns = V;
				else 
					ns = nothing;
			W: if (dot == 1 & dash == 0) 
					ns = P;
				else if (dot == 0 & dash == 1) 
					ns = J;
				else 
					ns = W;
			X: if (dot == 0 & dash == 0) 
					ns = X;
				else 
					ns = nothing;
			Y: if (dot == 0 & dash == 0) 
					ns = Y;
				else 
				   ns = nothing;	
			Z: if (dot == 0 & dash == 0) 
					ns = Z;
				else if (dot == 1 & dash == 0) 
					ns = SEVEN;
				else 
					ns = nothing;
			ZERO: if (dot ==0 & dash == 0) 
						ns = ZERO;
					else 
						ns = nothing;
			ONE: if (dot ==0 & dash == 0) 
					  ns = ONE;
				  else 
					  ns = nothing;
			TWO: if (dot ==0 & dash == 0) 
					  ns = TWO;
				  else 
					  ns = nothing;
			THREE: if (dot ==0 & dash == 0) 
						 ns = THREE;
					 else 
						 ns = nothing;
			FOUR: if (dot == 0 & dash == 0) 
						ns = FOUR;
					else 
						ns = nothing;
			FIVE: if (dot == 0 & dash == 0) 
						ns = FIVE;
					else 
						ns = nothing;
			SIX: if (dot == 0 & dash == 0) 
						ns = SIX;
				  else 
						ns = nothing;
			SEVEN: if (dot == 0 & dash == 0) 
						 ns = SEVEN;
					 else 
						 ns = nothing;
			EIGHT: if (dot ==0 & dash == 0)
						 ns = EIGHT;
					 else 
						 ns = nothing;
			NINE:  if (dot ==0 & dash == 0) 
						 ns = NINE;
					 else 
						 ns = nothing;				 
			default ns = 6'bxxxxxx;
		endcase
	
	always @(*)
		case (ps)
			nothing: 
				begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b0000000); 
				end
			A: begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b1110111); 
				end
			B: begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b0011111); 
				end
			C: begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b1001110); 
				end
			D: begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b0111101); 
				end
			E: begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b1001111); 
				end
			F: begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b1000111); 
				end
			G: begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b1011110); 
				end
			H: begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b0110111); 
				end
			I: begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b0110000); 
				end
			J: begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b0111100); 
				end
			K: begin 
					D_0 = ~(7'b0110001); 
					D_1 = ~(7'b0110000); 
				end 
			L: begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b0001110); 
				end 
			M: begin 
					D_0 = ~(7'b0010101); 
					D_1 = ~(7'b0010101); 
				end 
			N: begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b0010101); 
				end 
			O: begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b1111110); 
				end 
			P: begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b1100111); 
				end 
			Q: begin 
					D_0 = ~(7'b0001000); 
					D_1 = ~(7'b1110011); 
				end 
			R: begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b0000101); 
				end 
			S: begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b1011011); 
				end 
			T: begin 
					D_0 = ~(7'b1000000); 
					D_1 = ~(7'b1110000); 
				end 
			U: begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b0111110); 
				end 
			V: begin 
					D_0 = ~(7'b1000110); 
					D_1 = ~(7'b1110000); 
				end 
			W: begin 
					D_0 = ~(7'b0011100); 
					D_1 = ~(7'b0011100); 
				end 
			X: begin 
					D_0 = ~(7'b1001110); 
					D_1 = ~(7'b1111000); 
				end 
			Y: begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b0111011); 
				end 
			Z: begin 
					D_0 = ~(7'b0000000); 
					D_1 = ~(7'b1101101); 
				end
			ZERO: begin 
						D_1 = ~(7'b1111110); 
						D_0 = ~(7'b1111110); 
					end
			ONE: begin 
				     D_1 = ~(7'b1111110); 
					  D_0 = ~(7'b0110000); 
				  end
			TWO: begin 
					  D_1 = ~(7'b1111110); 
					  D_0 = ~(7'b1101101); 
				  end
			THREE: begin 
						 D_1 = ~(7'b1111110); 
						 D_0 = ~(7'b1111001); 
					 end
			FOUR: begin 
						D_1 = ~(7'b1111110); 
						D_0 = ~(7'b0110011); 
					end
			FIVE: begin 
						D_1 = ~(7'b1111110); 
						D_0 = ~(7'b1011011); 
					end
			SIX: begin 
					  D_1 = ~(7'b1111110); 
					  D_0 = ~(7'b1011111); 
				  end
			SEVEN: begin 
					   D_1 = ~(7'b1111110); 
						D_0 = ~(7'b1110010); 
					 end
			EIGHT: begin 
						 D_1 = ~(7'b1111110); 
						 D_0 = ~(7'b1111111); 
					 end
			NINE: begin 
					   D_1 = ~(7'b1111110); 
						D_0 = ~(7'b1110011); 
					end
			default: begin
							D_1 = 7'b1111111; 
							D_0 = 7'b1111111; 
						end
		endcase
		
 // DFF
 always @(posedge Clock) 
	if (reset) 
		ps <= 0;
	else 
		ps <= ns;
endmodule

module morse_testbench(); 
	reg Clock, reset, dot, dash;
	wire [0:6] D_0, D_1;


 morse dutMorse (.Clock, .reset, .dot, .dash, .D_0, .D_1);
  
 parameter CLOCK_PERIOD=100; 
 initial Clock=1; 
 always begin 
 #(CLOCK_PERIOD/2); 
 Clock = ~Clock; 
 end 
 
 initial begin 
 @(posedge Clock); 
 reset <= 1; @(posedge Clock); 
 reset <= 0; dot <= 0; dash <= 0;@(posedge Clock);
 @(posedge Clock);
 @(posedge Clock);
 @(posedge Clock);
 @(posedge Clock);
 dot <= 0; dash <= 1;@(posedge Clock);
 @(posedge Clock); 
 @(posedge Clock);
 @(posedge Clock);
 @(posedge Clock);
 dot <= 1; dash <= 0;@(posedge Clock);
 @(posedge Clock); 
 @(posedge Clock);
 @(posedge Clock);
 @(posedge Clock);
 dot <= 1; dash <= 1;@(posedge Clock);
 @(posedge Clock); 
 @(posedge Clock);
 @(posedge Clock);
 @(posedge Clock);
 $stop; // End the simulation. 
 end 
endmodule