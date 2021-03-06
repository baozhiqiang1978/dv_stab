`include "params.v"

module correlator_core (
    input clk,
    input resetn, 

    input go,
    //bram data and address
    input [`BRAM_DATA_WIDTH-1:0] bram_data,
    output reg [`BRAM_ADDR_WIDTH-1:0] bram_addr,

    //x & y offsets
    input [`MAX_OFFSET_WIDTH-1:0] x_offset, //unsigned
    input [`MAX_OFFSET_WIDTH-1:0] y_offset, //unsigned

    //current frame bram offset, 0 or 1
    input [1:0] curr_frame_bram_offset,
    input [1:0] prev_frame_bram_offset,

    //final correlation sum
    output reg [`FRAME_BITSUM_WIDTH-1:0] corr_sum,
    output done
    



);

//FSM control outputs
wire cframe_line_lshift, cframe_line_load;
wire pframe_line_load, pframe_line_addr;
wire line_sum_en;
wire rst_x_count, rst_y_count, y_counter_incr, x_counter_incr;
wire rst_corr_sum;
wire [7:0] frame_line_xor_sum;

//regs for current frame line
reg [`BRAM_DATA_WIDTH-1:0] cframe_line_reg;
always @ (posedge clk)
begin
    if (!resetn)
        cframe_line_reg <= 0;
    /*
    else if (cframe_line_rshift)
        cframe_line_reg <= cframe_line_reg >> 1; //shift in 0's
    */
    else if (cframe_line_lshift)
        cframe_line_reg <= cframe_line_reg << 1; //shift in 0's
    else if (cframe_line_load)
        cframe_line_reg <= bram_data;
end

//regs for previous frame line
reg [`SEARCH_AREA_W-1:0] pframe_line_reg;
always @ (posedge clk)
begin
    if (!resetn)
        pframe_line_reg <= 0;
    else if (pframe_line_load) //directly load search area line with offsets
        //TODO: Hard coded values
        pframe_line_reg <= bram_data[111:16];
end


//xor'ed values
wire [`SEARCH_AREA_W-1:0] frame_line_xor;
//TODO: Hard coded values
assign frame_line_xor = pframe_line_reg[`SEARCH_AREA_W-1:0] ^ cframe_line_reg[`BRAM_DATA_WIDTH-1:32];

//bitwise sum module; 
bitsum_comp bitsum (.clk(clk), .resetn(resetn), .data(frame_line_xor), .sum(frame_line_xor_sum));

//summing the entire frame
always @ (posedge clk)
begin
    if (!resetn || rst_corr_sum)
        corr_sum <= 0;
    else if (line_sum_en)
        corr_sum <= frame_line_xor_sum + corr_sum;
end


//y counter for search area(line number)
reg [`SUBIMAGE_H_WIDTH-1:0] y_count;
always @ (posedge clk)
begin
    if (!resetn || rst_y_count)
        y_count <= 0; //reset to top left corner of subimage
    else if (y_counter_incr)
        y_count <= y_count + 1;
end

//x counter for x shifting OF CURRENT FRAME
reg [`MAX_OFFSET_WIDTH-1:0] x_count;
always @ (posedge clk)
begin
    if (!resetn || rst_x_count)
        x_count <= 0;
    else if (x_counter_incr)
        x_count <= x_count + 1;
end


//bram address offset computation
wire [`BRAM_FRAME_ADDR_OFFSET_WIDTH-1:0] cframe_bram_offset, pframe_bram_offset;
assign cframe_bram_offset = curr_frame_bram_offset << `BRAM_FRAME_ADDR_OFFSET_SHIFT;
assign pframe_bram_offset = prev_frame_bram_offset << `BRAM_FRAME_ADDR_OFFSET_SHIFT;


//address decoder, select between current frame addr and prev frame addr
always @(*)
begin
    if (pframe_line_addr)
        bram_addr <= y_count + `CENTERING_OFFSET + pframe_bram_offset;
    else //if (cframe_line_load) //offset the current frame
        bram_addr <= y_count + y_offset + cframe_bram_offset;
end

/*    
always (@posedge clk)
begin
    if (!resetn)
        bram_addr <= 0;
    else if (cframe_line_ld_addr) //offset the current frame
    else if (pframe_line_ld_addr)
        bram_addr <= y_count << 4 + pframe_bram_offset;
end
*/


//FSM control
reg [3:0] state;
reg [3:0] next_state;

parameter   RESET =     4'b0000, 
            PREV_ADDR = 4'b0001, //setup the address
            LD_PREV =   4'b0010, //load the read value into regs
            CURR_ADDR = 4'b0011,
            LD_CURR =   4'b0100,
            OFFSET_X =  4'b0101,
            LINE_SUM_COMP = 4'b1000, //wait one cycle to compute line sum
            LINE_SUM =  4'b0110,
            DONE =      4'b0111;

//combinational logic
always @ (*)
begin
    case (state)
        RESET:      if (go && resetn) next_state = PREV_ADDR;
                    else next_state = RESET;
        PREV_ADDR:  next_state = LD_PREV;
        LD_PREV:    next_state = CURR_ADDR;

        CURR_ADDR:  next_state = LD_CURR;
        LD_CURR:    if (x_offset > 0) next_state = OFFSET_X; //only shift if needed
                    else next_state = LINE_SUM_COMP;

        OFFSET_X:   if (x_count < x_offset-1) next_state = OFFSET_X; //use offset-1 to stop shift one cycle earlier
                    else next_state = LINE_SUM_COMP;
        
        LINE_SUM_COMP: next_state = LINE_SUM;

        LINE_SUM:   if (y_count < `SEARCH_AREA_H - 1) next_state = PREV_ADDR; //use -1 to stop one cycle earlier
                    else next_state = DONE;

        DONE:       if (!go) next_state = RESET; //NOTE: assumes software resets "go" to ack that corr_sum is read
                    else next_state = DONE;

        default:    next_state = 4'bxxxx;

    endcase
end


//fsm sequential logic
always @ (posedge clk)
begin
    if (!resetn) state <= RESET;
    else state <= next_state;
end

//output control logic;
assign pframe_line_addr = (state == PREV_ADDR);
assign pframe_line_load = (state == LD_PREV);
assign cframe_line_load = (state == LD_CURR);
assign x_counter_incr = (state == OFFSET_X); //start counting x shifts
assign cframe_line_lshift = (state == OFFSET_X);
assign rst_x_count = (state == LINE_SUM_COMP || state == RESET); //reset x counter
assign line_sum_en = (state == LINE_SUM);
assign y_counter_incr = (state == LINE_SUM_COMP);
assign rst_y_count = (state == DONE || state == RESET); //reset y counter
assign done = (state == DONE);        

assign rst_corr_sum = (state == RESET);

endmodule
