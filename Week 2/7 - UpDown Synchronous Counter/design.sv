module up_down_counter_synchronous (
	input clock,
  	input reset,
  	input up_down,
  	output reg [3:0] count 
);

  always @(posedge clock or posedge reset) begin
  if(reset)
    count <= 4'b0000;
  else if (up_down)
    count <= count + 1;
  else
    count <= count -1;
end

endmodule