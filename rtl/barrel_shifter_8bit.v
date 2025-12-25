module barrel_shifter_8bit (
    input  [7:0] din,
    input  [2:0] shamt,
    input        dir,      // 0 = Left, 1 = Right
    output [7:0] dout
);

    wire [7:0] stage1, stage2, stage3;
    wire [7:0] left1, left2, left4;
    wire [7:0] right1, right2, right4;

    // Left shifts
    assign left1 = {din[6:0], 1'b0};
    assign left2 = {stage1[5:0], 2'b0};
    assign left4 = {stage2[3:0], 4'b0};

    // Right shifts
    assign right1 = {1'b0, din[7:1]};
    assign right2 = {2'b0, stage1[7:2]};
    assign right4 = {4'b0, stage2[7:4]};

    genvar i;

    // Stage 1: shift by 1
    generate
        for (i = 0; i < 8; i = i + 1) begin : STAGE1
            mux2 m1 (
                .d0(din[i]),
                .d1(dir ? right1[i] : left1[i]),
                .s(shamt[0]),
                .y(stage1[i])
            );
        end
    endgenerate

    // Stage 2: shift by 2
    generate
        for (i = 0; i < 8; i = i + 1) begin : STAGE2
            mux2 m2 (
                .d0(stage1[i]),
                .d1(dir ? right2[i] : left2[i]),
                .s(shamt[1]),
                .y(stage2[i])
            );
        end
    endgenerate

    // Stage 3: shift by 4
    generate
        for (i = 0; i < 8; i = i + 1) begin : STAGE3
            mux2 m3 (
                .d0(stage2[i]),
                .d1(dir ? right4[i] : left4[i]),
                .s(shamt[2]),
                .y(stage3[i])
            );
        end
    endgenerate

    assign dout = stage3;

endmodule

