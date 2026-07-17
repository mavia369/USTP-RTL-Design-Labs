module and_tb;

logic A, B;
logic Y;

and_beh dut(
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
  $dumpfile("tb_and.vcd");
  $dumpvars(0, and_tb);
end
  
endmodule