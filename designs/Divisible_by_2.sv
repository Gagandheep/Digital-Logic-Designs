module Divisible_by_2(input x, rst_n, clk,
                      output reg y);

    reg pres_state, next_state;

    localparam S0 = 1'b0;
    localparam S1 = 1'b1;

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
            S1: next_state = x ? S1 : S0;
            default: next_state = S0;
        endcase
    end

    // Output Block
    always @(posedge clk, negedge rst_n)
        if (~rst_n)
            y <= S0;
        else
            y <= (pres_state == S0 | pres_state == S1) & ~x;

endmodule
