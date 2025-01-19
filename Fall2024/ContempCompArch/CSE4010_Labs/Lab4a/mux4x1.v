module mux_4x1(a, b, c, d, sel0, sel1, out); // Create the module called mux_4x1

    // Inputs and outputs
    input a, b, c, d, sel0, sel1;
    output out;

    // {sel1, sel0}: {0,0} = a, {0,1} = b, {1,0} = c, {1,1} = d
    assign out = sel1 ? (sel0 ? d:c) : (sel0 ? b:a);

endmodule // Ends module mux_4x1