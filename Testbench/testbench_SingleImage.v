`timescale 1ns / 1ps

module testbench_SingleImage;

	// Function to compute log2. This is used for choosing bitwidths
	// according to input parameters
	function integer clog2;
	  input integer value;
	  begin
		 value = value-1;
		 for (clog2=0; value>0; clog2=clog2+1)
			value = value>>1;
	  end
	endfunction
	
	// Input parameters allow you to test images of various sizes.
	// We assume an image of size num_rows*num_cols, with some pixels
	// around these images that are invalid. The number of invalid pixels
	// are described by the outer dimensions full_frame_rows*full_frame_cols
	// 12 bits for RGB and Output width of 16 are same as in the template project.
	parameter num_rows=32;
	parameter num_cols=32;
	parameter full_frame_rows=36;
	parameter full_frame_cols=36;
	parameter invalidBorderWidthX=((full_frame_cols-num_cols)/2);
	parameter invalidBorderWidthY=((full_frame_rows-num_rows)/2);
	parameter num_bits_rgb =12;
	parameter output_width = 16;
	parameter user_directory = "C:\\Users\\dboland\\Google Drive\\ece4063 2014\\";
	
	// These signals correspond to those that you will need to work
	// with in the template project
	reg[num_bits_rgb-1:0] 		sCCD_R, sCCD_G, sCCD_B;
	reg[clog2(num_rows)-1:0] 	X_Cont;
	reg[clog2(num_cols)-1:0] 	Y_Cont;
	reg 								sCCD_DVAL;
	reg 								rCCD_FVAL;
	wire[output_width-1:0] 		wr1_data, wr2_data;
	
	// These signals are used only in the testbench to read in data from a file.
   reg 							clk;
	reg[num_bits_rgb-1:0] 	red_input[num_rows*num_cols-1:0];
	reg[num_bits_rgb-1:0] 	green_input[num_rows*num_cols-1:0];
	reg[num_bits_rgb-1:0] 	blue_input[num_rows*num_cols-1:0];
	integer 						col_count,row_count; 
	
	// These signals are used to test against the expected output provided in software
	reg[num_bits_rgb-1:0] 	expected_output[num_rows*num_cols-1:0];
	reg[num_bits_rgb-1:0] 	expected_current_output;
	wire[output_width-1:0] 	expected_current_output1, expected_current_output2;
	
	//These signals are used to write the output image to a file
	reg [num_bits_rgb-1:0] 	store_output[num_rows*num_cols-1:0];
	integer 						error_count, file;
	reg 							write_output;
	wire[num_bits_rgb-1:0] 	grey_check;
	reg[num_bits_rgb-1:0] 	grey_check_delayed;
	reg 							sCCD_DVAL_delayed;
	
	// Your unit under test
	myModule #(.num_rows(num_rows),.num_cols(num_cols),.full_frame_rows(full_frame_rows),
										.full_frame_cols(full_frame_cols),.num_bits_rgb(num_bits_rgb),
										.output_width(output_width))
			coolName ( .clk(clk), .red_input(sCCD_R),.green_input(sCCD_G),.blue_input(sCCD_B), 
							.x_pos(X_Cont),.y_pos(Y_Cont),
							.f_val(rCCD_FVAL),.d_val(sCCD_DVAL),
							.data_out1(wr1_data),.data_out2(wr2_data),
							.grey_check(grey_check)	);
	
	// Create clk
	always begin 
		clk <= 1;
		#25;
		clk <= 0;
		#25;
	end
	
	/* Create Frame valid, data valid signals and raster scan input */
	// Create initial frame valid signal
	initial begin 
		rCCD_FVAL = 0;
		#100;
		rCCD_FVAL = 1;
		#50;
		rCCD_FVAL = 0;
   end
	
	// After frame valid, start reading rows and columns in raster scan
	always @(posedge clk) begin
		if ((rCCD_FVAL==1) || (col_count==(full_frame_cols-1)))
			col_count <= 0;
		else
			col_count <= col_count+1;
	end
	
	always @(posedge clk) begin
		if (rCCD_FVAL==1)
			row_count <= 0;
		else begin 
			if (col_count==(full_frame_cols-1)) begin
				if (row_count==(full_frame_rows-1)) 
					row_count <= 0;
				else
					row_count <= row_count+1;
			end
			else
				row_count <= row_count;
		end
	end
		
	// Data is valid if in inner frame
	always @(posedge clk) begin
		if (	
				( (col_count < invalidBorderWidthX) 
					|| (col_count >= (num_cols+invalidBorderWidthX)) ) 
			|| 
				( (row_count < invalidBorderWidthY) 
					|| (row_count >= (num_rows+invalidBorderWidthY)) )
					)	
			sCCD_DVAL <= 1'b0;
		else
			sCCD_DVAL <= 1'b1;
	end
		
		
	/* Create streaming image input into unit under test */	
	
	// Read image to file, store in memory
	initial begin
		$readmemh({user_directory, "lennaRed.txt"}, red_input);
		$readmemh({user_directory, "lennaGreen.txt"}, green_input);
		$readmemh({user_directory, "lennaBlue.txt"}, blue_input);
	end
	
	// Translate X, Y position based on inner frame.
	always @(posedge clk) begin
		X_Cont = row_count-invalidBorderWidthY;
		Y_Cont = col_count-invalidBorderWidthX;
	end
	
	// Get relevant pixel input, according to x,y image position.
	always @(posedge clk) begin
		sCCD_R<=red_input[num_cols*X_Cont+Y_Cont];
		sCCD_G<=green_input[num_cols*X_Cont+Y_Cont];
		sCCD_B<=blue_input[num_cols*X_Cont+Y_Cont];
	end
	
	/* Compare output to unit under test */	
	// Load expected output
	initial begin
		$readmemh({user_directory, "lennaGrey.txt"}, expected_output);
	end
	
	// Find relevant expected greyscale output
	always @(posedge clk) begin
		expected_current_output <= expected_output[num_cols*X_Cont+Y_Cont];
	end
	
	// Translate expected greyscale output into format ready to go to display
	assign expected_current_output1 = {expected_current_output[11:7], expected_current_output[11:2]};
	assign expected_current_output2 = {expected_current_output[6:2], expected_current_output[11:2]};
		
	// Compare expected output and actual output
	initial begin 
		error_count = 0;
   end
	always @(posedge clk) begin
		if (sCCD_DVAL==1) begin
			// Buggy version
			if ((expected_current_output1 != wr1_data)
				|| (expected_current_output2 != wr2_data)) begin
				error_count = error_count+1;
				$display("\tTotal errors: %d, Error occurs at Row (XCont) %d, Col (YCont) %d. Expected %h%h, Got %h%h", 
							error_count, X_Cont, Y_Cont-1, expected_current_output1,expected_current_output2, wr1_data,wr2_data);
			end
			
			/*
			// Tolerant version version
			if ((expected_current_output >= (grey_check+3))
				|| (expected_current_output <= (grey_check-3))) begin
				error_count = error_count+1;
				$display("\tTotal errors: %d, Error occurs at Row %d, Col %d. Expected %h, Got %h", 
					error_count, X_Cont, Y_Cont-1, expected_current_output, grey_check);
			end
			*/
		end	
	end
	
	/*
	// Write grey output to file method 1: Store to memory, write memory to file.
	always @(posedge clk) begin
		if (sCCD_DVAL==1)
			store_output[num_cols*X_Cont+Y_Cont-1] = grey_check;
	end

	always @(posedge clk) begin
		if ((col_count == 0) && (row_count == (1+num_rows+invalidBorderWidthX))) 
			$writememh({user_directory, "lennaGreyOut.txt"}, store_output);
	end
	
	
	// Write grey output to file method 2: Write to file as it arrives
	initial begin
		file = $fopen({user_directory, "lennaGreyOut.txt"}, "w");
		$fclose(file) ;
	end
	
	always @(posedge clk) begin
		if (sCCD_DVAL_delayed==1) begin
			file = $fopen({user_directory, "lennaGreyOut.txt"}, "a");
			$fwrite(file,"%h\n",grey_check_delayed); 
			$fclose(file) ;
		end	
	end
	
	// Alignment
	always @(posedge clk) begin
		grey_check_delayed<= grey_check;
		sCCD_DVAL_delayed<= sCCD_DVAL;	
	end
	*/
	
endmodule


//