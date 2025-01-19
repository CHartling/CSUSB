`timescale 1ns/1ns    // Sets time interval of fullSubtractor
`include "mux8x1.v"   // Links fullSubtractor.v to this file

module mux8x1_tb; // Create module called mux8x1_tb

    reg A, B, C, D, E, F, G, H, Sel0, Sel1, Sel2; // Input wires
    wire O;                                       // Output wire

    mux_8x1 uut(A, B, C, D, E, F, G, H, Sel0, Sel1, Sel2, O);  // Instantiate mux_8x1 as uut

    initial begin // Starts clock
        
        $dumpfile("mux8x1_tb"); // Sets file for output of the test
        $dumpvars(0, mux8x1_tb);

        A = 0; B = 1; C = 0; D = 1; E = 0; F = 1; G = 0; H = 1; // Set intitial values
        {Sel2, Sel1, Sel0} = 3'd0; #20; // Set Sel2 = 0, Sel1 = 0, and Sel0 = 0. Wait 20ns
        {Sel2, Sel1, Sel0} = 3'd1; #20; // Set Sel2 = 0, Sel1 = 0, and Sel0 = 1. Wait 20ns
        {Sel2, Sel1, Sel0} = 3'd2; #20; // Set Sel2 = 0, Sel1 = 1, and Sel0 = 0. Wait 20ns
        {Sel2, Sel1, Sel0} = 3'd3; #20; // Set Sel2 = 0, Sel1 = 1, and Sel0 = 1. Wait 20ns
        {Sel2, Sel1, Sel0} = 3'd4; #20; // Set Sel2 = 1, Sel1 = 0, and Sel0 = 0. Wait 20ns
        {Sel2, Sel1, Sel0} = 3'd5; #20; // Set Sel2 = 1, Sel1 = 0, and Sel0 = 1. Wait 20ns
        {Sel2, Sel1, Sel0} = 3'd6; #20; // Set Sel2 = 1, Sel1 = 1, and Sel0 = 0. Wait 20ns
        {Sel2, Sel1, Sel0} = 3'd7; #20; // Set Sel2 = 1, Sel1 = 1, and Sel0 = 1. Wait 20ns

        $display("Completed!");
    end // Ends clock
endmodule // Ends module mux8x1_tb