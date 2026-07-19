module tb_ps2_keyboard_receiver;

logic clk;
logic rst;

logic ps2_clk;
logic ps2_data;

logic A;
logic B;
logic C;
logic data_valid;

ps2_keyboard_receiver DUT(
    .clk(clk),
    .rst(rst),
    .ps2_clk(ps2_clk),
    .ps2_data(ps2_data),
    .A(A),
    .B(B),
    .C(C),
    .data_valid(data_valid)
);

initial begin
    $dumpfile("ps2.vcd");
    $dumpvars(0,tb_ps2_keyboard_receiver);
end

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

task send_bit(input logic b);
begin
    ps2_data = b;

    #20;
    ps2_clk = 0;

    #20;
    ps2_clk = 1;
end
endtask

task send_code(input [7:0] code);
integer i;
begin

    // Start bit
    send_bit(0);

    // Data bits (LSB first)
    for(i=0;i<8;i=i+1)
        send_bit(code[i]);

    // Parity bit
    send_bit(1);

    // Stop bit
    send_bit(1);

end
endtask

initial begin

    rst = 1;
    ps2_clk = 1;
    ps2_data = 1;

    #50;
    rst = 0;

    // A = 1C
    send_code(8'h1C);

    #200;

    // B = 32
    send_code(8'h32);

    #200;

    // C = 21
    send_code(8'h21);

    #200;

    $finish;

end

endmodule