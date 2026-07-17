//Behavioral Model
module and_beh(
	input logic a, b,
	output logic y      
);

always @(*) begin
    y = a & b;
end

endmodule

//Data Flow Model
module and_data(
	input logic a,
  	input logic b,
  	output logic y
);

assign y = a & b;

endmodule

//Structural Model
module and_struct(
	input logic a,b,
 	output logic y
);

  and G1(y, a, b);

endmodule