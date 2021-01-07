module JKFF(input j, k, clk, set, rst_n, output reg q);

    always @(posedge clk, negedge rst_n) begin
        if (~rst_n)
            q <= 1'b0;
        else if (set)
            q <= 1'b1;
        else
            q <= (j) ? ((k) ? ~q : 1'b1) : ((k) ? 1'b0 : q);
    end

endmodule
