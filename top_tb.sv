`timescale 1ns/1ps
module matrix_inv_tb #(parameter STG  = 12,parameter SIZE = 16,parameter INT  = 4,parameter FRAC = 12);

    // Input
    bit                        clk_tb;
    logic                      rst_n_tb;
    logic                      start_tb;
    logic                      read_tb;

    // Output
    logic signed [SIZE -1 : 0] data_out_tb;
    logic                      done_tb;
    logic                      finish_tb;

    always begin
        #5
        clk_tb = !clk_tb;
    end

    initial begin

        initialize () ;

        reset      () ;

        start      () ;

while(!done_tb)
@(negedge clk_tb);
read_tb = 1'b1;

        display    () ;

        repeat (100) @(negedge clk_tb);
        $stop;
    end

    task reset();
        begin
            rst_n_tb = 1'b1 ;            // rst is deactivated
            repeat(5)@(negedge clk_tb);
            rst_n_tb = 1'b0 ;            // rst is activated
            repeat(5)@(negedge clk_tb);
            rst_n_tb = 1'b1 ; 
        end
    endtask

    task initialize ;
        begin
            clk_tb   = 1'b0 ;
            start_tb = 1'b0 ;
            read_tb  = 1'b0 ;   
        end
    endtask

    task start() ;
        begin
            @(negedge clk_tb);
            start_tb = 1'b1 ;

            @(negedge clk_tb);
            start_tb = 1'b0 ; 
        end
    endtask

    task display();
        begin
            $monitor("data_out = %0h",data_out_tb);  
            $monitor("done     = %0h",done_tb);  
           $monitor("finish   = %0h @time %0t ",finish_tb,$time);   
        end
    endtask

    ////***********************************************DUT Instantation*********************************************************////
    matrix_inv DUT (
        .clk(clk_tb),
        .rst_n(rst_n_tb),
        .start(start_tb),  
        .read(read_tb), 
        .data_out(data_out_tb),
        .done(done_tb),
        .finish(finish_tb)
    );

endmodule