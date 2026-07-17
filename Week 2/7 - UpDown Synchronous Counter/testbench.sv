`timescale 1ns/1ps

module tb_up_down_counter_synchronous;

reg clock;
reg reset;
reg up_down;
wire [3:0] count;
  
up_down_counter_synchronous uut (
  .clock(clock),
  .reset(reset),
  .up_down(up_down),
  .count(count)
);

always #5 clock = ~clock;

initial begin
    clock = 0;
    reset = 1;
    up_down = 1;

    #10 reset = 0;

    #50;

    up_down = 0;
    #50;

    $finish;
end
  
initial begin
 	$dumpfile("up_down_counter_synchronous.vcd");
    $dumpvars(0, tb_up_down_counter_synchronous);
end
  
endmodule