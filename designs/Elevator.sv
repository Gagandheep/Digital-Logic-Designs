module Elevator(input [2:0] floor_no, input clk, rst_n, ip,
                output reg [2:0] curr_floor, output reg door = 1'b1); // Door open = 1, close = 0

    localparam MOVE = 2'b00;
    localparam OPEN = 2'b01;
    localparam CLOSE = 2'b10;

    reg [1:0] state = OPEN;
    reg direction; // Up = 1, Down = 0
    reg [7:0] stops = 8'h00; // Stores the stops
    reg [7:0] curr_hot = 8'h01; // Stores the current floor as one hot array

    wire on;
    
    assign on = | stops;
    
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            curr_floor <= 3'b000;
            direction <= 1'b1;
            door <= 1'b1;
            stops <= 8'h00;
            curr_hot <= 8'h01;
        end

        else begin
            if (ip)
                stops[floor_no] <= 1'b1;

            case(state)
                MOVE: begin
                    if (stops[curr_floor]) begin
                        state <= OPEN;
                        stops[curr_floor] <= 1'b0;
                    end
                    else begin
                        if (direction) begin
                            curr_hot <= curr_hot << 1;
                            curr_floor <= curr_floor + 1'b1;
                        end
                        else begin
                            curr_hot <= curr_hot >> 1;
                            curr_floor <= curr_floor - 1'b1;
                        end
                    end
                end
                OPEN: begin
                    door <= 1'b1;
                    state <= on ? CLOSE : OPEN;
                end
                CLOSE: begin
                    door <= 1'b0;
                    direction <= curr_hot < stops;
                    state <= MOVE;
                end
            endcase
        end
    end

endmodule
