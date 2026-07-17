//Behavioral Model
module xor_beh(
	input logic a,b,
  	output logic y
);
  
always @(*) begin
    y = a ^ b;
end

endmodule

//Data Flow Model
module xor_data(A, B, Y);
input A, B;
output Y;

assign Y = A ^ B;

endmodule

//Structural Model
module xor_struct(
	input logic a,b,
  	output logic y
);
  
xor G1(y, a, b);

endmodule
