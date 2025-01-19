`timescale 1ns/1ns   // Sets time interval of fullSubtractor
`include "mux4x1.v"  // Links fullSubtractor.v to this file

module mux4x1_tb; // Create the module called mux4x1_tb

    reg A, B, C, D, Sel0, Sel1;  // Input wires
    wire O;                      // Output wire

    mux_4x1 uut(A, B, C, D, Sel0, Sel1, O);  // Instantiate mux_4x1 as uut

    initial begin // Start clock
        
        $dumpfile("mux4x1_tb");
        $dumpvars(0, mux4x1_tb);

        A = 0; B = 1; C = 0; D = 1; // Set initial values
        {Sel1, Sel0} = 2'd0; #20; // Set Sel1 = 0 and Sel0 = 0. Wait 20ns
        {Sel1, Sel0} = 2'd1; #20; // Set Sel1 = 0 and Sel0 = 1. Wait 20ns
        {Sel1, Sel0} = 2'd2; #20; // Set Sel1 = 1 and Sel0 = 0. Wait 20ns
        {Sel1, Sel0} = 2'd3; #20; // Set Sel1 = 1 and Sel0 = 1. Wait 20ns

        $display("Completed!");
    end // Ends clock
endmodule // Ends module mux4x1_tb