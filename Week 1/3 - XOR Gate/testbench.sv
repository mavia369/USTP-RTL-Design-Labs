module xor_tb;

logic A, B;
logic Y;

xor_beh dut(
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
  $dumpfile("tb_xor.vcd");
  $dumpvars(0, xor_tb);
end
  
endmodule
