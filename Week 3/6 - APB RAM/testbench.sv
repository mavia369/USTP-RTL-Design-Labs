module tb_apb_ram;

logic PCLK;
logic PRESETn;

logic PSEL;
logic PENABLE;
logic PWRITE;

logic [3:0] PADDR;
logic [31:0] PWDATA;

logic [31:0] PRDATA;
logic PREADY;

apb_ram DUT(
    .PCLK(PCLK),
    .PRESETn(PRESETn),
    .PSEL(PSEL),
    .PENABLE(PENABLE),
    .PWRITE(PWRITE),
    .PADDR(PADDR),
    .PWDATA(PWDATA),
    .PRDATA(PRDATA),
    .PREADY(PREADY)
);

initial
begin
    $dumpfile("apb_ram.vcd");
    $dumpvars(0,tb_apb_ram);
end

initial
begin
    PCLK = 0;
    forever #5 PCLK = ~PCLK;
end

initial
begin

    PRESETn = 0;

    PSEL = 0;
    PENABLE = 0;
    PWRITE = 0;

    PADDR = 0;
    PWDATA = 0;

    #20;
    PRESETn = 1;

    // Write 1111AAAA to Address 2
    @(posedge PCLK);

    PSEL    = 1;
    PENABLE = 0;
    PWRITE  = 1;
    PADDR   = 4'd2;
    PWDATA  = 32'h1111AAAA;

    @(posedge PCLK);

    PENABLE = 1;

    @(posedge PCLK);

    PSEL = 0;
    PENABLE = 0;

    // Write DEADBEEF to Address 5
    @(posedge PCLK);

    PSEL    = 1;
    PENABLE = 0;
    PWRITE  = 1;
    PADDR   = 4'd5;
    PWDATA  = 32'hDEADBEEF;

    @(posedge PCLK);

    PENABLE = 1;

    @(posedge PCLK);

    PSEL = 0;
    PENABLE = 0;

    // Read Address 2
    @(posedge PCLK);

    PSEL = 1;
    PENABLE = 0;
    PWRITE = 0;
    PADDR = 4'd2;

    @(posedge PCLK);

    PENABLE = 1;

    @(posedge PCLK);

    PSEL = 0;
    PENABLE = 0;

    // Read Address 5
    @(posedge PCLK);

    PSEL = 1;
    PENABLE = 0;
    PWRITE = 0;
    PADDR = 4'd5;

    @(posedge PCLK);

    PENABLE = 1;

    @(posedge PCLK);

    PSEL = 0;
    PENABLE = 0;

    #50;

    $finish;

end

endmodule