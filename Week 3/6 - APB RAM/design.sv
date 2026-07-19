module apb_ram
#(
    parameter ADDR_WIDTH = 4,
    parameter DATA_WIDTH = 32
)
(
    input  logic                    PCLK,
    input  logic                    PRESETn,

    input  logic                    PSEL,
    input  logic                    PENABLE,
    input  logic                    PWRITE,

    input  logic [ADDR_WIDTH-1:0]   PADDR,
    input  logic [DATA_WIDTH-1:0]   PWDATA,

    output logic [DATA_WIDTH-1:0]   PRDATA,
    output logic                    PREADY
);

logic [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

assign PREADY = 1'b1;

integer i;

always_ff @(posedge PCLK or negedge PRESETn)
begin
    if(!PRESETn)
    begin
        PRDATA <= 0;

        for(i=0;i<(1<<ADDR_WIDTH);i=i+1)
            mem[i] <= 0;
    end
    else
    begin
        if(PSEL && PENABLE)
        begin
            if(PWRITE)
            begin
                mem[PADDR] <= PWDATA;
            end
            else
            begin
                PRDATA <= mem[PADDR];
            end
        end
    end
end

endmodule