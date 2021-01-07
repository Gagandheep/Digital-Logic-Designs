module M10SyncCounter(input clk, rst_n, output reg [3:0] out);

    always @(posedge clk, negedge rst_n) begin
        if (~rst_n)
            out <= 4'h0;
        else
            out <= (out == 4'h9) ? 4'h0 : out + 1'b1;
    end

endmodule