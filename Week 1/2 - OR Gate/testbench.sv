module or_tb;

logic A, B;
logic Y;

or_beh dut(
  .a(A),
  .b(B),
  .y(Y)
);

initial begin     
  	A=0; B=0; #10;
    A=0; B=1; #10;
    A=1; B=0; #10;
    A=1; B=1; #10;
 
    $finish;
end
  
initial begin
  $dumpfile("tb_or.vcd");
  $dumpvars(0, or_tb);
end
  
endmodule