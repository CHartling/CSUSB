`timescale 1ns / 1ns    // Sets time interval of wireTest
`include "wireTest2.v"  // Links wireTest2.v to this file

module wireTest2_tb; // Create module called wireTest2_tb

reg W;  // Input wire called W
reg X;  // Input wire called X
wire Y; // Output wire called Y
wire Z; // Output wire called Z

wireTest2 uut(W, X, Y, Z); // Instantiate wireTest as uut

initial begin // Starts clock

    $dumpfile("wireTest2_tb.vcd"); // Sets file for output of the test
    $dumpvars(0, wireTest2_tb);

    W = 0; // Set wire W to 0
    X = 0; // Set wire X to 0
    #20 // Wait 20 nanoseconds

    W = 1; // Set wire W to 1
    #20 // Wait 20 nanoseconds

    X = 1; // Set wire X to 1
    #20 // Wait 20 nanoseconds

    W = 0; // Set wire W to 0
    #20 // Wait 20 nanoseconds

    X = 0; // Set wire X to 0

    $display("Wire Test Complete!"); // Print the string

end // Ends clock

endmodule // Ends wireTest2_tb module