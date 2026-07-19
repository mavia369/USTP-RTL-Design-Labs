module ps2_keyboard_receiver(

    input logic clk,
    input logic rst,
    input logic ps2_clk,
    input logic ps2_data,

    output logic A,
    output logic B,
    output logic C,
    output logic data_valid
);

logic ps2_clk_d;

logic [10:0] shift_reg;
logic [3:0] bit_count;

logic [10:0] next_shift;

always_ff @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        ps2_clk_d <= 1;

        shift_reg <= 0;
        bit_count <= 0;

        A <= 0;
        B <= 0;
        C <= 0;

        data_valid <= 0;
    end
    else
    begin
        ps2_clk_d <= ps2_clk;

        A <= 0;
        B <= 0;
        C <= 0;
        data_valid <= 0;

        if(ps2_clk_d && !ps2_clk)
        begin
            next_shift = {ps2_data,shift_reg[10:1]};

            shift_reg <= next_shift;

            if(bit_count == 10)
            begin
                bit_count <= 0;

                data_valid <= 1;

                case(next_shift[8:1])

                    8'h1C: A <= 1;
                    8'h32: B <= 1;
                    8'h21: C <= 1;

                endcase
            end
            else
            begin
                bit_count <= bit_count + 1;
            end
        end
    end
end

endmodule