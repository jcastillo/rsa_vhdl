--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:01:39 10/31/2009
-- Design Name:   
-- Module Name:   C:/ise_wp/ciosspartan/Etapa_test.vhd
-- Project Name:  ciosspartan
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: montgomery
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
 
ENTITY Etapa_test IS
END Etapa_test;
 
ARCHITECTURE behavior OF Etapa_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT montgomery
     port(
	   clk : in std_logic;
		reset : in std_logic;
		ab_valid : in std_logic;
		valid_in : in std_logic;
		a : in std_logic_vector(15 downto 0);
		b : in std_logic_vector(15 downto 0);
		n : in std_logic_vector(15 downto 0);
		s_prev : in std_logic_vector(15 downto 0);
		n_c : in std_logic_vector(15 downto 0);
		s : out std_logic_vector( 15 downto 0);
		data_ready : out std_logic); -- estamos preparados para aceptar el siguiente dato
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal ab_valid : std_logic := '0';
   signal a : std_logic_vector(15 downto 0) := (others => '0');
   signal b : std_logic_vector(15 downto 0) := (others => '0');
   signal n : std_logic_vector(15 downto 0) := (others => '0');
   signal s_prev : std_logic_vector(15 downto 0) := (others => '0');
   signal n_c : std_logic_vector(15 downto 0) := (others => '0');
   signal valid_in, data_ready : std_logic;
 	--Outputs
   signal s : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 1ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: montgomery PORT MAP (
          clk => clk,
          reset => reset,
          ab_valid => ab_valid,
          a => a,
          b => b,
          n => n,
          s_prev => s_prev,
          n_c => n_c,
          s => s,
			 valid_in => valid_in,
			 data_ready => data_ready
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
   stim_proc: process
   begin		
	   valid_in<='0';
		ab_valid<='0';
      -- hold reset state for 100ms.
		reset <= '1';
      wait for 10ns;	
      reset <= '0';
      wait for clk_period*10;
      n_c <= x"de8b";
		ab_valid<='1';
      -- insert stimulus here 
      a <=x"7654";
		b <=x"7643";
		n <=x"e6dd";
		wait for clk_period;
		ab_valid<='0';
		wait for clk_period*20;
		valid_in <= '1';
		wait for clk_period;
      -- insert stimulus here 
      a <=x"4564";
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
      wait;
   end process;

END;
