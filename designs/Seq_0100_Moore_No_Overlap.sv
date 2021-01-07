module Seq_0100_Moore_No_Overlap(input x, rst_n, clk,
                                 output reg y);

    reg [2:0] pres_state, next_state;

    localparam S0 = 3'b000;
    localparam S1 = 3'b001;
    localparam S2 = 3'b010;
    localparam S3 = 3'b011;
    localparam S4 = 3'b100;

    // Present State Block
    always @(posedge clk, negedge rst_n)
        if (~rst_n)
            pres_state <= S0;
        else
            pres_state <= next_state;

    // Next State Block
    always @(x, pres_state) begin
        case(pres_state)
            S0: next_state = x ? S0 : S1;
            S1: next_state = x ? S2 : S1;
            S2: next_state = x ? S0 : S3;
            S3: next_state = x ? S2 : S4;
            S4: next_state = x ? S0 : S1;
            default: next_state = S0;
        endcase
    end

   // Output Block
    always @(posedge clk, negedge rst_n)
        if (~rst_n)
            y <= S0;
        else
            y <= pres_state == S4;

endmodule
