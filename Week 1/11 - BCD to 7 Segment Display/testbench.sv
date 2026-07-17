module tb_bcd_to_7seg;
  
  logic [3:0] bcd;
  logic [6:0] seg;
  
  bcd_to_7seg dut(
    .bcd(bcd),
    .seg(seg)
  );
  
  initial begin
    bcd = 4'b0000; #5;
 	bcd = 4'b0001; #5;
    bcd = 4'b0010; #5;
    bcd = 4'b0011; #5;
    bcd = 4'b0100; #5;
    bcd = 4'b0101; #5;
    bcd = 4'b0110; #5;
    bcd = 4'b0111; #5;
    bcd = 4'b1000; #5;
    bcd = 4'b1001; #5;
    
    $finish;
  end
  
   initial begin
    $dumpfile("bcd_to_7seg_tb.vcd");
    $dumpvars(0, tb_bcd_to_7seg);
  end

endmodule
