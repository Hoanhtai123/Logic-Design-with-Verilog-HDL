module t_project ();
	wire t_signal, t_enable;
	wire [1:0] t_result;
	wire [11:0] t_password;
	wire [11:0] t_password2;
	wire clock3_t;
	wire[1:0] trials_t;
	reg  t_clock, t_reset,t_mode;
	reg [3:0] t_test;

	// testbench ()
	t_main main_t(.password(t_password),   
	.result(t_result), 
	.data_test(t_test), 
	.mode_test(t_mode), 
	.reset_test(~t_reset), 
	.enable_t(t_enable),
	.signal_t(t_signal),
	.clock_t(~t_clock),
	.password2(t_password2),
	.clock3(clock3_t),
	.trials(trials_t));

	initial 
	begin
		$monitor ("%tps: trials %b, reset %b, mode %b, signal %b, enable %b, password input %b, result %b, pass verify %b,clock3 %b \n \n", 
		$time,trials_t,t_reset, t_mode, t_signal, t_enable, t_password, t_result,t_password2,clock3_t);
	end
	
	initial 
	begin
		t_mode = 1'b0;     		// 0ps : mode set
		t_reset = 1'b1;
		#1 t_clock = 1'b1;		// 1ps : clock 
		#1 t_test = 4'b0000; 	// 2ps : prepare data	
		#1 t_clock = 1'b0;		// 3ps : input data - 1 negegde clock
		#1 t_clock = 1'b1;		// 4ps : clock return
		#1 t_test = 4'b0001;		// 5ps : prepare data
		#1 t_clock = 1'b0;		// 6ps : input data - 2 negegde clock
		#1 t_clock = 1'b1;		// 7ps : clock return
		#1 t_test = 4'b1011;		// 8ps : prepare data 
		#1 t_clock = 1'b0;		// 9ps : input data - 3 negegde clock - set password
		#1 t_clock = 1'b1;		// 10ps : clock return
		
		//--------------------------------------------------------------------------
		
		#1 t_mode = 1'b1;			// 11ps : mode verify
		#1 t_test = 4'b0000;		// 12ps : prepare data
		#1 t_clock = 1'b0;		// 13ps : input data - 1 negedge clock
		#1 t_clock = 1'b1;		// 14ps : clock return 
		#1 t_test = 4'b0001;		// 15ps : prepare data
		#1 t_clock = 1'b0;		// 16ps : input data - 2 negedge clock
		#1 t_clock = 1'b1;		// 17ps : clock return
		#1 t_test = 4'b1011;		// 18ps : prepare data
		#1 t_clock = 1'b0;		// 19ps : input data - 3 negedge clock - verify password
		#1 t_clock = 1'b1;		// 20ps : clock return  						(verify right)
		
		//------------------------------------------------------------------------------
		
		#1 t_test = 4'b0010;		// 21ps : prepare data
		#1 t_clock = 1'b0;		// 22ps : input data - 1 negedge clock
		#1 t_clock = 1'b1;		// 23ps : clock return 
		#1 t_test = 4'b1000;		// 24ps : prepare data
		#1 t_clock = 1'b0;		// 25ps : input data - 2 negedge clock
		#1 t_clock = 1'b1;		// 26ps : clock return
		#1 t_test = 4'b1001;		// 27ps : prepare data
		#1 t_clock = 1'b0;		// 28ps : input data - 3 negedge clock - verify password
		#1 t_clock = 1'b1;		// 29ps : clock return				(verify wrong 1 time)
		
		//------------------------------------------------------------------------------
		
		#1 t_test = 4'b0010;		// 30ps : prepare data
		#1 t_clock = 1'b0;		// 31ps : input data - 1 negedge clock
		#1 t_clock = 1'b1;		// 32ps : clock return 
		#1 t_test = 4'b1000;		// 33ps : prepare data
		#1 t_clock = 1'b0;		// 34ps : input data - 2 negedge clock
		#1 t_clock = 1'b1;		// 35ps : clock return
		#1 t_test = 4'b1001;		// 36ps : prepare data
		#1 t_clock = 1'b0;		// 37ps : input data - 3 negedge clock - verify password
		#1 t_clock = 1'b1;		// 38ps : clock return				(verify wrong 2 times)
		
		//------------------------------------------------------------------------------
		
		#1 t_test = 4'b0010;		// 39ps : prepare data
		#1 t_clock = 1'b0;		// 40ps : input data - 1 negedge clock
		#1 t_clock = 1'b1;		// 41ps : clock return 
		#1 t_test = 4'b1000;		// 42ps : prepare data
		#1 t_clock = 1'b0;		// 43ps : input data - 2 negedge clock
		#1 t_clock = 1'b1;		// 44ps : clock return
		#1 t_test = 4'b1001;		// 45ps : prepare data
		#1 t_clock = 1'b0;		// 46ps : input data - 3 negedge clock - verify password
		#1 t_clock = 1'b1;		// 47ps : clock return | *verify wrong 3 times => block system
		
		//------------------------------------------------------------------------------
		
		//try to input right password
		#1 t_test = 4'b0000; 	// 48ps : prepare data	
		#1 t_clock = 1'b0;		// 49ps : input data - 1 negegde clock
		#1 t_clock = 1'b1;		// 50ps : clock return
		#1 t_test = 4'b0001;		// 51ps : prepare data
		#1 t_clock = 1'b0;		// 52ps : input data - 2 negegde clock
		#1 t_clock = 1'b1;		// 53ps : clock return
		#1 t_test = 4'b1011;		// 54ps : prepare data 
		#1 t_clock = 1'b0;		// 55ps : input data - 3 negegde clock - verify but block
		#1 t_clock = 1'b1;		// 56ps : clock return
		
		//-------------------------------------------------------------------------------
		
		#1 t_reset = 1'b0;		// 57ps : reset system
		#1 t_reset = 1'b1;		// 58ps : reset return
		#1 t_test = 4'b0000; 	// 59ps : prepare data	
		#1 t_clock = 1'b0;		// 60ps : input data - 1 negegde clock
		#1 t_clock = 1'b1;		// 61ps : clock return
		#1 t_test = 4'b0001;		// 62ps : prepare data
		#1 t_clock = 1'b0;		// 63ps : input data - 2 negegde clock
		#1 t_clock = 1'b1;		// 64ps : clock return
		#1 t_test = 4'b1011;		// 65ps : prepare data 
		#1 t_clock = 1'b0;		// 66ps : input data - 3 negegde clock - verify right
		#1 t_clock = 1'b1;		// 67ps : clock return 
		
		//---------------------------------------------------------------------------
		
		#1 t_mode = 1'b0;     	// 68ps : mode set
		#1 t_test = 4'b0011; 	// 69ps : prepare data	
		#1 t_clock = 1'b0;		// 70ps : input data - 1 negegde clock
		#1 t_clock = 1'b1;		// 71ps : clock return
		#1 t_test = 4'b0011;		// 72ps : prepare data
		#1 t_clock = 1'b0;		// 73ps : input data - 2 negegde clock
		#1 t_clock = 1'b1;		// 74ps : clock return
		#1 t_test = 4'b1100;		// 75ps : prepare data 
		#1 t_clock = 1'b0;		// 76ps : input data - 3 negegde clock - set password
		#1 t_clock = 1'b1;		// 77ps : clock return 
		
		//---------------------------------------------------------------------------
		
		#1 t_mode = 1'b1;			// 78ps : mode verify 
		#1 t_test = 4'b0011; 	// 79ps : prepare data	
		#1 t_clock = 1'b0;		// 80ps : input data - 1 negegde clock
		#1 t_clock = 1'b1;		// 81ps : clock return
		#1 t_test = 4'b0011;		// 82ps : prepare data
		#1 t_clock = 1'b0;		// 83ps : input data - 2 negegde clock
		#1 t_clock = 1'b1;		// 84ps : clock return
		#1 t_test = 4'b1100;		// 85ps : prepare data 
		#1 t_clock = 1'b0;		// 86ps : input data - 3 negegde clock - verify password right
		#1 t_clock = 1'b1;		// 87ps : clock return 
		
		//------------------------------------------------------------------------------------
	
		#1 t_test = 4'b0010; 	// 88ps : prepare data	
		#1 t_clock = 1'b0;		// 89ps : input data - 1 negegde clock
		#1 t_clock = 1'b1;		// 90ps : clock return
		#1 t_test = 4'b0011;		// 91ps : prepare data
		#1 t_clock = 1'b0;		// 92ps : input data - 2 negegde clock
		#1 t_clock = 1'b1;		// 93ps : clock return
		#1 t_test = 4'b1100;		// 94ps : prepare data 
		#1 t_clock = 1'b0;		// 95ps : input data - 3 negegde clock - verify password wrong
		#1 t_clock = 1'b1;		// 96ps : clock return (1 time wrong)		
		
		//------------------------------------------------------------------------------------
		
		#1 t_test = 4'b0011; 	// 97ps : prepare data	
		#1 t_clock = 1'b0;		// 98ps : input data - 1 negegde clock
		#1 t_clock = 1'b1;		// 99ps : clock return
		#1 t_test = 4'b0011;		// 100ps : prepare data
		#1 t_clock = 1'b0;		// 101ps : input data - 2 negegde clock
		#1 t_clock = 1'b1;		// 102ps : clock return
		#1 t_test = 4'b1100;		// 103ps : prepare data 
		#1 t_clock = 1'b0;		// 104ps : input data - 3 negegde clock - verify password right
		#1 t_clock = 1'b1;		// 105ps : clock return  -  reset trial

		//------------------------------------------------------------------------------------
		 
		#1 t_test = 4'b0010; 	// 106ps : prepare data	
		#1 t_clock = 1'b0;		// 107ps : input data - 1 negegde clock
		#1 t_clock = 1'b1;		// 108ps : clock return
		#1 t_test = 4'b0011;		// 109ps : prepare data
		#1 t_clock = 1'b0;		// 110ps : input data - 2 negegde clock
		#1 t_clock = 1'b1;		// 111ps : clock return
		#1 t_test = 4'b1100;		// 112ps : prepare data 
		#1 t_clock = 1'b0;		// 113ps : input data - 3 negegde clock - verify password wrong
		#1 t_clock = 1'b1;		// 114ps : clock return (1 time wrong)		
		
		//-------------------------------------------------------------------------------------
	
		#1 t_test = 4'b0010; 	// 115ps : prepare data	
		#1 t_clock = 1'b0;		// 116ps : input data - 1 negegde clock
		#1 t_clock = 1'b1;		// 117ps : clock return
		#1 t_test = 4'b0011;		// 118ps : prepare data
		#1 t_clock = 1'b0;		// 119ps : input data - 2 negegde clock
		#1 t_clock = 1'b1;		// 120ps : clock return
		#1 t_test = 4'b1100;		// 121ps : prepare data 
		#1 t_clock = 1'b0;		// 122ps : input data - 3 negegde clock - verify password wrong
		#1 t_clock = 1'b1;		// 123ps : clock return (2 times wrong)		
		
		//-------------------------------------------------------------------------------------
		
		#1 t_test = 4'b0011; 	// 124ps : prepare data	
		#1 t_clock = 1'b0;		// 125ps : input data - 1 negegde clock
		#1 t_clock = 1'b1;		// 126ps : clock return
		#1 t_test = 4'b0011;		// 127ps : prepare data
		#1 t_clock = 1'b0;		// 128ps : input data - 2 negegde clock
		#1 t_clock = 1'b1;		// 129ps : clock return
		#1 t_test = 4'b1100;		// 130ps : prepare data 
		#1 t_clock = 1'b0;		// 131ps : input data - 3 negegde clock - verify password right
		#1 t_clock = 1'b1;		// 132ps : clock return  -  reset trial
		
	end
		
		
endmodule 