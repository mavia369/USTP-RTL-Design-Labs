module d_flipflop(
    input logic clock, reset,
    input logic d,
    output logic q
);

always_ff @(posedge clock or posedge reset) begin
  if (reset) 
    q <= 0;
  else 
    q <= d;
end
  
endmodule