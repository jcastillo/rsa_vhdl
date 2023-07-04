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
 
ENTITY fifos_Test IS
END fifos_Test;
 
ARCHITECTURE behavior OF fifos_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT montgomery_mult

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
		word_number : in std_logic_vector(7 downto 0) -- cuantas palabras se introducen (n/16)+3, el 3 es por el CIOS algorithm
  );
  
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal valid_in : std_logic := '0';
   signal a : std_logic_vector(15 downto 0) := (others => '0');
   signal b : std_logic_vector(15 downto 0) := (others => '0');
   signal n : std_logic_vector(15 downto 0) := (others => '0');
   signal s_prev : std_logic_vector(15 downto 0) := (others => '0');
   signal n_c : std_logic_vector(15 downto 0) := (others => '0');
   signal word_number : std_logic_vector(7 downto 0) := x"23";
 	--Outputs
   signal s,a_out, n_out : std_logic_vector(15 downto 0);
   signal data_ready : std_logic;
   signal busy: std_logic;
   -- Clock period definitions
   constant clk_period : time := 1ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: montgomery_mult PORT MAP (
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
			 word_number => word_number
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
		b <=x"7643";
		n <=x"e6dd";
		wait for clk_period;
      -- insert stimulus here 
      a <=x"4564";
		b <=x"9027";
		n <=x"7246";
		wait for clk_period;
      -- insert stimulus here 
      a <=x"3593";
		b <= x"2983";
		n <=x"c7e1";
		wait for clk_period;
		a <=x"6278";
		b <= x"7368";
		n <=x"e4d7";
		wait for clk_period;
		a <=x"5634";
		b <= x"2986";
		n <=x"4a07";
		wait for clk_period;
		a <=x"3542";
		b <= x"9390";
		n <=x"9b6d";
				wait for clk_period;
		a <=x"5672";
		b <= x"4872";
		n <=x"390c";
				wait for clk_period;
		a <=x"9348";
		b <= x"6253";
		n <=x"f632";
				wait for clk_period;
		a <=x"8598";
		b<= x"0589";
		n <=x"12cf";
				wait for clk_period;
		a <=x"3894";
		b<= x"9034";
		n <=x"a0c5";
				wait for clk_period;
		a <=x"7785";
		b<= x"3894";
		n <=x"b5d2";
				wait for clk_period;
		a <=x"8384";
		b<= x"2872";
		n <=x"37a0";
				wait for clk_period;
		a <=x"4787";
		b<= x"9089";
		n <=x"3427";
				wait for clk_period;
		a <=x"5378";
		b<= x"5063";
		n <=x"a2a1";
				wait for clk_period;
		a <=x"7346";
		b<= x"3594";
		n <=x"1b57";
				wait for clk_period;
		a <=x"4658";
		b<= x"7829";
		n <=x"4ab9";
						wait for clk_period;
		a <=x"6837";
		b<= x"2634";
		n <=x"68fb";
						wait for clk_period;
		a <=x"3475";
		b<= x"0785";
		n <=x"4184";
						wait for clk_period;
		a <=x"4568";
		b<= x"4989";
		n <=x"35e5";
						wait for clk_period;
		a <=x"6387";
		b<= x"1672";
		n <=x"0429";
						wait for clk_period;
		a <=x"8457";
		b<= x"3874";
		n <=x"652b";
						wait for clk_period;
		a <=x"7563";
		b<= x"3492";
		n <=x"0989";
						wait for clk_period;
		a <=x"3784";
		b<= x"0372";
		n <=x"41fa";
						wait for clk_period;
		a <=x"2312";
		b<= x"0000";
		n <=x"0368";
								wait for clk_period;
		a <=x"1231";
		b<= x"0000";
		n <=x"5992";
								wait for clk_period;
		a <=x"3123";
		b<= x"0000";
		n <=x"e038";
								wait for clk_period;
		a <=x"2312";

		n <=x"01c0";
								wait for clk_period;
		a <=x"2345";

		n <=x"ba53";
								wait for clk_period;
		a <=x"4234";

		n <=x"dbf5";
								wait for clk_period;
		a <=x"3423";

		n <=x"8726";
								wait for clk_period;
		a <=x"4232";
	
		n <=x"f361";
								wait for clk_period;
		a <=x"0123";
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
		
		
		
		
		
      wait for clk_period * 600;
		valid_in <='1';
      -- insert stimulus here 
      a <=x"7654";
		b <=x"7643";
		n <=x"e6dd";
		wait for clk_period;
      -- insert stimulus here 
      a <=x"4564";
		b <=x"9027";
		n <=x"7246";
		wait for clk_period;
      -- insert stimulus here 
      a <=x"3593";
		b <= x"2983";
		n <=x"c7e1";
		wait for clk_period;
		a <=x"6278";
		b <= x"7368";
		n <=x"e4d7";
		wait for clk_period;
		a <=x"5634";
		b <= x"2986";
		n <=x"4a07";
		wait for clk_period;
		a <=x"3542";
		b <= x"9390";
		n <=x"9b6d";
				wait for clk_period;
		a <=x"5672";
		b <= x"4872";
		n <=x"390c";
				wait for clk_period;
		a <=x"9348";
		b <= x"6253";
		n <=x"f632";
				wait for clk_period;
		a <=x"8598";
		b<= x"0589";
		n <=x"12cf";
				wait for clk_period;
		a <=x"3894";
		b<= x"9034";
		n <=x"a0c5";
				wait for clk_period;
		a <=x"7785";
		b<= x"3894";
		n <=x"b5d2";
				wait for clk_period;
		a <=x"8384";
		b<= x"2872";
		n <=x"37a0";
				wait for clk_period;
		a <=x"4787";
		b<= x"9089";
		n <=x"3427";
				wait for clk_period;
		a <=x"5378";
		b<= x"5063";
		n <=x"a2a1";
				wait for clk_period;
		a <=x"7346";
		b<= x"3594";
		n <=x"1b57";
				wait for clk_period;
		a <=x"4658";
		b<= x"7829";
		n <=x"4ab9";
						wait for clk_period;
		a <=x"6837";
		b<= x"2634";
		n <=x"68fb";
						wait for clk_period;
		a <=x"3475";
		b<= x"0785";
		n <=x"4184";
						wait for clk_period;
		a <=x"4568";
		b<= x"4989";
		n <=x"35e5";
						wait for clk_period;
		a <=x"6387";
		b<= x"1672";
		n <=x"0429";
						wait for clk_period;
		a <=x"8457";
		b<= x"3874";
		n <=x"652b";
						wait for clk_period;
		a <=x"7563";
		b<= x"3492";
		n <=x"0989";
						wait for clk_period;
		a <=x"3784";
		b<= x"0372";
		n <=x"41fa";
						wait for clk_period;
		a <=x"2312";
		b<= x"0000";
		n <=x"0368";
								wait for clk_period;
		a <=x"1231";
		b<= x"0000";
		n <=x"5992";
								wait for clk_period;
		a <=x"3123";
		b<= x"0000";
		n <=x"e038";
								wait for clk_period;
		a <=x"2312";

		n <=x"01c0";
								wait for clk_period;
		a <=x"2345";

		n <=x"ba53";
								wait for clk_period;
		a <=x"4234";

		n <=x"dbf5";
								wait for clk_period;
		a <=x"3423";

		n <=x"8726";
								wait for clk_period;
		a <=x"4232";
	
		n <=x"f361";
								wait for clk_period;
		a <=x"0123";
		n <=x"cb6b";
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
		wait;
   end process;

END;
