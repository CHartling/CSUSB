module mux_8x1(a, b, c, d, e, f, g, h, sel0, sel1, sel2, out); // Creat module called mux_8x1

    // Inputs and outputs
    input a, b, c, d, e, f, g, h, sel0, sel1, sel2;
    output out;

    // {sel2, sel1, sel0}: {0,0,0} = a, {0,0,1} = b, {0,1,0} = c, {0,1,1} = d, {1,0,0} = e, {1,0,1} = f, {1,1,0} = g, {1,1,1} = h
    assign out = sel2 ? (sel1 ? (sel0 ? h:g) : (sel0 ? f:e)):(sel1 ? (sel0 ? d:c) : (sel0 ? b:a));

endmodule // Ends module mux_8x1