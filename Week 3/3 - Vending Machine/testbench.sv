`timescale 1ns/1ps

module tb_vending_machine;

  logic clk;
  logic rst_n;
  logic nickel;
  logic dime;
  logic dispense;

  vending_machine dut (
    .clk(clk),
    .rst_n(rst_n),
    .nickel(nickel),
    .dime(dime),
    .dispense(dispense)
  );

  always begin
    #5 clk = ~clk;
  end

  task insert_nickel();
    @(posedge clk);
    nickel = 1;
    #1; 
    nickel = 0;
  endtask

  task insert_dime();
    @(posedge clk);
    dime = 1;
    #1; 
    dime = 0;
  endtask

  initial begin
    clk = 0;
    rst_n = 0;
    nickel = 0;
    dime = 0;

    #15 rst_n = 1;
    #5;

    insert_nickel(); 
    insert_nickel(); 
    insert_nickel();
    @(posedge clk);  

    #20; 

    insert_dime();   
    insert_nickel(); 
    @(posedge clk);  

    #20; 

    insert_nickel();
    insert_dime();  
    @(posedge clk); 

    #20;
    $finish;
  end

  initial begin
    $dumpfile("vending_machine_tb.vcd"); 
    $dumpvars(0, tb_vending_machine);    
  end

endmodule
