module given_schematic(
	input logic a,b,c,
  	output logic q
);
  
always_comb begin
  q = (~(a&b))&(c)&(~(a|b));
end

endmodule