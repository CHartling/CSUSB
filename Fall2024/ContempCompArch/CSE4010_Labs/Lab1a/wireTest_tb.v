`timescale 1ns / 1ns   // Sets time interval of wireTest
`include "wireTest.v"  // Links wireTest.v to this file

module wireTest_tb; // Create module called wireTest_tb

reg A;  // Input wire called A
wire B; // Output wire called B
wire C; // Output wire called C

wireTest uut(A, B, C); // Instantiate wireTest as uut

initial begin // Starts clock

    $dumpfile("wireTest_tb.vcd"); // Sets file for output of the test
    $dumpvars(0, wireTest_tb);

    A = 0; // Set wire A to 0
    #20 // Wait 20 nanoseconds

    A = 1; // Set wire A to 1
    #20 // Wait 20 nanoseconds

    A = 0; // Set wire A to 0
    #20 // Wait 20 nanoseconds

    A = 1; // Set wire A to 1
    #20 // Wait 20 nanoseconds

    $display("Wire Test Complete!"); // Print the string

end // Ends clock

endmodule // Ends wireTest_tb module