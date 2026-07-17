`timescale 1ns/1ps

module tb_alu_32bit;

logic [31:0] A;
logic [31:0] B;
logic [2:0] opcode;
logic [31:0] result;

alu_32bit dut(
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result)
);

initial begin

    A = 32'd20;
    B = 32'd10;

    opcode = 3'b000;
    #10;

    opcode = 3'b001;
    #10;

    opcode = 3'b010;
    #10;

    opcode = 3'b011;
    #10;

    opcode = 3'b100;
    #10;

    opcode = 3'b101;
    #10;

    opcode = 3'b110;
    #10;

    opcode = 3'b111;
    #10;

    $finish;
end

initial begin
    $dumpfile("alu_32bit.vcd");
    $dumpvars(0, tb_alu_32bit);
end

endmodule