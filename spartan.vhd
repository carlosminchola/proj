adv slibrary ieee;
-- use ieee.stdcvfvfv_logic_1164.all;
use ieee.std_  g gogic_arith.all;
use ieee.std_logic_unsigned.fffall;
use work.crf158_sade_pkccg.avf fll;fffvvv
btfnfnf
endddity sade_TB vvdvis dvfb
end sadeuyyuuy_TB;dcve

*******

-------
111111

-----

-------
architecture test of sade_TB is
    
    
	component sade_ctrl is
	   port( 
		  clk               : in     std_logic;
		  reset_n           : in     std_logic;
		  sade_config       : in     std_logic_vector (c_sade_config_width-1 downto 0);
		  sade_heartbeat    : in     std_logic;
		  sade_load         : in     std_logic_vector (c_sade_load_limit-1 downto 0);
		  sade_mode         : in     std_logic;
		  sade_sm_rst       : in     std_logic;
		  synchro_pulse     : in     std_logic;                                                  -- System clock
		  magnetic_state    : out    std_logic_vector (c_sade_magnetic_state_width-1 downto 0);
		  motor_type_tm     : out    std_logic;
		  sade_switch_cmd_1 : out    std_logic;
		  sade_switch_cmd_2 : out    std_logic;
		  sade_switch_cmd_3 : out    std_logic;
		  sade_switch_cmd_4 : out    std_logic;
		  sade_switch_cmd_5 : out    std_logic;
		  sade_switch_cmd_6 : out    std_logic;
		  sade_switch_cmd_7 : out    std_logic;
		  sade_switch_cmd_8 : out    std_logic
	   );
	 end component;  
   
    signal clk               : std_logic:='0';         
    signal reset_n           : std_logic;
	signal sade_config       : std_logic_vector (c_sade_config_width-1 downto 0) := (others => '0');
    signal sade_heartbeat    : std_logic;
	signal sade_load         : std_logic_vector (c_sade_load_limit-1 downto 0) := (others => '0');
	signal sade_mode         : std_logic;
	signal sade_sm_rst       : std_logic;
	signal synchro_pulse     : std_logic;                                                  -- System clock
	signal magnetic_state    : std_logic_vector (c_sade_magnetic_state_width-1 downto 0);
	signal motor_type_tm     : std_logic;
	signal sade_switch_cmd_1 : std_logic;
	signal sade_switch_cmd_2 : std_logic;
	signal sade_switch_cmd_3 : std_logic;
	signal sade_switch_cmd_4 : std_logic;
	signal sade_switch_cmd_5 : std_logic;
	signal sade_switch_cmd_6 : std_logic;
	signal sade_switch_cmd_7 : std_logic;
	signal sade_switch_cmd_8 : std_logic;

	signal nsteps : std_logic_vector (3 downto 0):= (others => '0');
	signal motor_type, direction : std_logic;	
	constant period : time := 125 ns; 
      
begin

    clk <= not clk after 62.5 ns;
    --synchro_pulse <= not synchro_pulse after 50 us;
	
	synchro_pulse <= '1' after 9875 ns when synchro_pulse = '0' else '0' after 125 ns;
	
 	dut: sade_ctrl port map(clk, reset_n, sade_config, sade_heartbeat, sade_load, sade_mode, sade_sm_rst, synchro_pulse, magnetic_state, motor_type_tm, sade_switch_cmd_1, sade_switch_cmd_2, sade_switch_cmd_3, sade_switch_cmd_4, sade_switch_cmd_5, sade_switch_cmd_6, sade_switch_cmd_7, sade_switch_cmd_8);   
			
    sade_sm_rst <= '0';
	sade_mode <= '0';
	sade_mode <= '0';
	
	stimuli: process
    
  	variable t_valve_1_dur : time; 
	        
    begin
  		reset_n <= '0';
		wait for period;
		reset_n <= '1';
		wait for period;
		for i in 0 to 0 loop
				for mtr in 0 to 0 loop
					 for dir in 1 to 1 loop
						 for step in 12 to 15 loop
								sade_heartbeat <= '0';
								wait for period;
								
								if  mtr = 0 then
									motor_type <= '0';
								else 
									motor_type <= '1';
								end if;	
								if  dir = 0 then
									direction <= '0';
								else 
									direction <= '1';
								end if;	
								nsteps <= conv_std_logic_vector(step, 4);            
								wait for period;
								
								sade_config  <= motor_type & direction & nsteps;
								wait for period;
								
								sade_heartbeat <= '1';
								wait for period;
								
								sade_heartbeat <= '0';
								wait for period;
																
								t_valve_1_dur := 101 ms;
								wait for t_valve_1_dur;
								--wait for 1 ms;
						 end loop;		
					 end loop;		
				 end loop;
		 end loop;		
		wait;
	end process;

	
end test;


	