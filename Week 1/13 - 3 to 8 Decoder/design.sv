module decoder_3to8(
    input logic A, B, C,
    output logic Y0, Y1, Y2, Y3,
                 Y4, Y5, Y6, Y7
);

always_comb begin
    Y0=0; Y1=0; Y2=0; Y3=0;
    Y4=0; Y5=0; Y6=0; Y7=0;

    case ({A,B,C})
        3'b000: Y0 = 1;
        3'b001: Y1 = 1;
        3'b010: Y2 = 1;
        3'b011: Y3 = 1;
        3'b100: Y4 = 1;
        3'b101: Y5 = 1;
        3'b110: Y6 = 1;
        3'b111: Y7 = 1;
    endcase
end

endmodule