module Divisible_by_4(input x, rst_n, clk,
                      output reg y);

    reg [1:0] pres_state, next_state;

    localparam S0 = 2'b00;
    localparam S1 = 2'b01;
    localparam S2 = 2'b10;

    // Present State Block
    always @(posedge clk, negedge rst_n)
        if (~rst_n)
            pres_state <= S0;
        else
            pres_state <= next_state;

    // Next State Block
    always @(x, pres_state) begin
        case(pres_state)
            S0: next_state = x ? S1 : S0;
            S1: next_state = x ? S1 : S2;
            S2: next_state = x ? S1 : S0;
            default: next_state = S0;
        endcase
    end

    // Output Block
    always @(posedge clk, negedge rst_n)
        if (~rst_n)
            y <= S0;
        else
            y <= (pres_state == S0 | pres_state == S2) & ~x;

endmodule
