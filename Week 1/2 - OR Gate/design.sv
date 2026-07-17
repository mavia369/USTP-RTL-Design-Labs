//Behavioral Model
module or_beh(
	input logic a,b,
  	output logic y
);
  
always @(*) begin
    y = a | b;
end

endmodule

//Data Flow Model
module or_data(
	input logic a,b,
  	output logic y
);
  
assign y = a | b;

endmodule

//Structural Model
module or_struct(
	input logic a,b,
  	output logic y
);
  
or G1(y, a, b);

endmodule