--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:19:07 11/01/2009
-- Design Name:   
-- Module Name:   C:/ise_wp/ciosspartan/fifos_Test.vhd
-- Project Name:  ciosspartan
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: module_with_fifo
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY fifos_Test_i_2 IS
END fifos_Test_i_2;
 
ARCHITECTURE behavior OF fifos_Test_i_2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT montgomery_step
port(
		clk : in std_logic;
		reset : in std_logic;
		valid_in : in std_logic;
		a : in std_logic_vector(15 downto 0);
		b : in std_logic_vector(15 downto 0);
		n : in std_logic_vector(15 downto 0);
		s_prev : in std_logic_vector(15 downto 0);
		n_c : in std_logic_vector(15 downto 0);
		s : out std_logic_vector( 15 downto 0);
		valid_out : out std_logic;  -- es le valid out TODO : cambiar nombre
		word_number : in std_logic_vector(15 downto 0); -- cuantas palabras se introducen (n/16)+3, el 3 es por el CIOS algorithm
		stop : in std_logic
  );
  
  
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal valid_in : std_logic := '0';
	signal stop : std_logic := '0';
   signal a : std_logic_vector(15 downto 0) := (others => '0');
   signal b : std_logic_vector(15 downto 0) := (others => '0');
   signal n : std_logic_vector(15 downto 0) := (others => '0');
   signal s_prev : std_logic_vector(15 downto 0) := (others => '0');
   signal n_c : std_logic_vector(15 downto 0) := (others => '0');
   signal word_number : std_logic_vector(15 downto 0) := x"0023";
 	--Outputs
   signal s,a_out, n_out : std_logic_vector(15 downto 0);
   signal data_ready : std_logic;
   signal busy: std_logic;
	
   -- Clock period definitions
   constant clk_period : time := 1ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: montgomery_step PORT MAP (
          clk => clk,
          reset => reset,
          valid_in => valid_in,
          a => a,
          b => b,
          n => n,
          s_prev => s_prev,
          n_c => n_c,
          s => s,
          valid_out => data_ready,
			 word_number => word_number,
			 stop => stop
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
  -- Stimulus process
   stim_proc: process
   begin		
	   valid_in<='0';
      -- hold reset state for 100ms.
		reset <= '1';
      wait for 10ns;	
      reset <= '0';
      wait for clk_period*10;
		
      n_c <= x"de8b";
		valid_in <='1';
      -- insert stimulus here 
      a <=x"7654";
		
		n <=x"e6dd";
		wait for clk_period;
      -- insert stimulus here 
      a <=x"4564";
		b <=x"7643";
		n <=x"7246";
		wait for clk_period;
      -- insert stimulus here 
      a <=x"3593";
		n <=x"c7e1";
		wait for clk_period;
		a <=x"6278";
		n <=x"e4d7";
		wait for clk_period;
		a <=x"5634";
		n <=x"4a07";
		wait for clk_period;
		a <=x"3542";
		n <=x"9b6d";
				wait for clk_period;
		a <=x"5672";
		n <=x"390c";
				wait for clk_period;
		a <=x"9348";
		n <=x"f632";
				wait for clk_period;
		a <=x"8598";
		n <=x"12cf";
				wait for clk_period;
		a <=x"3894";
		n <=x"a0c5";
				wait for clk_period;
		a <=x"7785";
		n <=x"b5d2";
				wait for clk_period;
		a <=x"8384";
		n <=x"37a0";
				wait for clk_period;
		a <=x"4787";
		n <=x"3427";
				wait for clk_period;
		a <=x"5378";
		n <=x"a2a1";
				wait for clk_period;
		a <=x"7346";
		n <=x"1b57";
				wait for clk_period;
		a <=x"4658";
		n <=x"4ab9";
						wait for clk_period;
		a <=x"6837";
		n <=x"68fb";
						wait for clk_period;
		a <=x"3475";
		n <=x"4184";
						wait for clk_period;
		a <=x"4568";
		n <=x"35e5";
						wait for clk_period;
		a <=x"6387";
		n <=x"0429";
						wait for clk_period;
		a <=x"8457";
		n <=x"652b";
						wait for clk_period;
		a <=x"7563";
		n <=x"0989";
						wait for clk_period;
		a <=x"0784";
		n <=x"41fa";
						wait for clk_period;
		a <=x"0000";
		n <=x"0368";
								wait for clk_period;
		a <=x"0000";
		n <=x"5992";
								wait for clk_period;
		a <=x"0000";
		n <=x"e038";
								wait for clk_period;
		a <=x"0000";
		n <=x"01c0";
								wait for clk_period;
		a <=x"0000";
		n <=x"ba53";
								wait for clk_period;
		a <=x"0000";
		n <=x"dbf5";
								wait for clk_period;
		a <=x"0000";
		n <=x"8726";
								wait for clk_period;
		a <=x"0000";
		n <=x"f361";
								wait for clk_period;
		a <=x"0000";
		n <=x"bb6b";
								wait for clk_period;
		a <=x"0000";
		n <=x"0000";
										wait for clk_period;
		a <=x"0000";
		n <=x"0000";
		wait for clk_period;
		a <=x"0000";
		n <=x"0000";
		wait for clk_period;
		a <=x"0000";
		n <=x"0000";
		valid_in <='0';
		
		
		
		
		wait for clk_period*10;
		
		
		
      n_c <= x"de8b";
		valid_in <='1';
      -- insert stimulus here 
      a <=x"7654";
		
		n <=x"e6dd";
		s_prev <= x"eb7d";
		wait for clk_period;
      -- insert stimulus here 
      a <=x"4564";
		b <=x"9027";
		n <=x"7246";
		s_prev <= x"ec99";
		wait for clk_period;
      -- insert stimulus here 
      a <=x"3593";
		n <=x"c7e1";
		s_prev <= x"643e";
		wait for clk_period;
		a <=x"6278";
		n <=x"e4d7";
		s_prev <= x"a968";
		wait for clk_period;
		a <=x"5634";
		n <=x"4a07";
		s_prev <= x"31ac";
		wait for clk_period;
		a <=x"3542";
		n <=x"9b6d";
		s_prev <= x"8ba1";
				wait for clk_period;
		a <=x"5672";
		n <=x"390c";
		s_prev <= x"e40c";
				wait for clk_period;
		a <=x"9348";
		n <=x"f632";
		s_prev <= x"ee3b";
				wait for clk_period;
		a <=x"8598";
		n <=x"12cf";
		s_prev <= x"9231";
				wait for clk_period;
		a <=x"3894";
		n <=x"a0c5";
		s_prev <= x"898f";
				wait for clk_period;
		a <=x"7785";
		n <=x"b5d2";
		s_prev <= x"bac3";
				wait for clk_period;
		a <=x"8384";
		n <=x"37a0";
		s_prev <= x"9720";
				wait for clk_period;
		a <=x"4787";
		n <=x"3427";
		s_prev <= x"3039";
				wait for clk_period;
		a <=x"5378";
		n <=x"a2a1";
		s_prev <= x"6acb";
				wait for clk_period;
		a <=x"7346";
		n <=x"1b57";
		s_prev <= x"3ed1";
				wait for clk_period;
		a <=x"4658";
		n <=x"4ab9";
		s_prev <= x"4e1f";
						wait for clk_period;
		a <=x"6837";
		n <=x"68fb";
		s_prev <= x"f707";
						wait for clk_period;
		a <=x"3475";
		n <=x"4184";
		s_prev <= x"a2ad";
						wait for clk_period;
		a <=x"4568";
		n <=x"35e5";
		s_prev <= x"39f1";
						wait for clk_period;
		a <=x"6387";
		n <=x"0429";
		s_prev <= x"39b6";
						wait for clk_period;
		a <=x"8457";
		n <=x"652b";
		s_prev <= x"c320";
						wait for clk_period;
		a <=x"7563";
		n <=x"0989";
		s_prev <= x"2b9e";
						wait for clk_period;
		a <=x"0784";
		n <=x"41fa";
		s_prev <= x"6339";
						wait for clk_period;
		a <=x"0000";
		n <=x"0368";
		s_prev <= x"2732";
								wait for clk_period;
		a <=x"0000";
		n <=x"5992";
		s_prev <= x"4e03";
								wait for clk_period;
		a <=x"0000";
		n <=x"e038";
		s_prev <= x"461e";
								wait for clk_period;
		a <=x"0000";
		n <=x"01c0";
		s_prev <= x"1be2";
								wait for clk_period;
		a <=x"0000";
		n <=x"ba53";
		s_prev <= x"4fc7";
								wait for clk_period;
		a <=x"0000";
		n <=x"dbf5";
		s_prev <= x"1c39";
								wait for clk_period;
		a <=x"0000";
		n <=x"8726";
		s_prev <= x"8cda";
								wait for clk_period;
		a <=x"0000";
		n <=x"f361";
		s_prev <= x"105c";
								wait for clk_period;
		a <=x"0000";
		n <=x"bb6b";
		s_prev <= x"0ffb";
								wait for clk_period;
		a <=x"0000";
		n <=x"0000";
		s_prev <= x"0000";
										wait for clk_period;
		a <=x"0000";
		n <=x"0000";
		s_prev <= x"0000";
										wait for clk_period;
		a <=x"0000";
		n <=x"0000";
		s_prev <= x"0000";
										wait for clk_period;
		a <=x"0000";
		n <=x"0000";
		s_prev <= x"0000";
		valid_in <='0';
      wait;
   end process;

END;
