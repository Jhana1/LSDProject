module myModule (clk, 
							red_input, green_input, blue_input, 
							x_pos, y_pos, 
							f_val, d_val,
							data_out1, data_out2,
							grey_check);

	function integer clog2;
	  input integer value;
	  begin
		 value = value-1;
		 for (clog2=0; value>0; clog2=clog2+1)
			value = value>>1;
	  end
	endfunction
	
	parameter num_rows;
	parameter num_cols;
	parameter full_frame_rows;
	parameter full_frame_cols;
	parameter num_bits_rgb;
	parameter output_width;
	
	input clk, f_val, d_val;
	input	[num_bits_rgb-1:0] red_input, green_input, blue_input;
	input	[clog2(num_rows)-1:0]  x_pos;
	input	[clog2(num_cols)-1:0]  y_pos;
	
	output [output_width-1:0] data_out1, data_out2;
	output [num_bits_rgb-1:0] grey_check;

	wire [num_bits_rgb-1:0] grey;
	assign grey = (2989 * red_input + 5870 * green_input + 1140 * blue_input)/10000;

	assign data_out1 = {grey[11:7],grey[11:2]};
	assign data_out2 = {grey[6:2],grey[11:2]};
	
	assign grey_check=grey;
	
				
endmodule