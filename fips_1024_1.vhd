--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:40:28 12/13/2009
-- Design Name:   
-- Module Name:   C:/ise_wp/ciosspartan/test_rsa_1024.vhd
-- Project Name:  ciosspartan
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rsa_top
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
 
ENTITY test_rsa_1024_fips IS
END test_rsa_1024_fips;
 
ARCHITECTURE behavior OF test_rsa_1024_fips IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rsa_top
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         valid_in : IN  std_logic;
         x : IN  std_logic_vector(15 downto 0);
         y : IN  std_logic_vector(15 downto 0);
         m : IN  std_logic_vector(15 downto 0);
         r_c : IN  std_logic_vector(15 downto 0);
         n_c : IN  std_logic_vector(15 downto 0);
         s : OUT  std_logic_vector(15 downto 0);
         valid_out : OUT  std_logic;
         word_number : IN  std_logic_vector(15 downto 0);
			bit_size : in std_logic_vector(15 downto 0) 
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal valid_in : std_logic := '0';
   signal x : std_logic_vector(15 downto 0) := (others => '0');
   signal y : std_logic_vector(15 downto 0) := (others => '0');
   signal m : std_logic_vector(15 downto 0) := (others => '0');
   signal r_c : std_logic_vector(15 downto 0) := (others => '0');
   signal n_c : std_logic_vector(15 downto 0) := (others => '0');
	signal word_number : std_logic_vector(15 downto 0) := x"0040";
   signal bit_size : std_logic_vector(15 downto 0) := x"0400";
 	--Outputs
   signal s : std_logic_vector(15 downto 0);
   signal valid_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 1ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rsa_top PORT MAP (
          clk => clk,
          reset => reset,
          valid_in => valid_in,
          x => x,
          y => y,
          m => m,
          r_c => r_c,
          n_c => n_c,
          s => s,
          valid_out => valid_out,
			 word_number => word_number,
          bit_size => bit_size
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
      -- hold reset state for 100ms.
		reset <= '1';
      wait for 10ns;	
      reset <= '0';
      wait for clk_period*10;

      -- insert stimulus here 

--n_c and valid signal and the r_c constant are also required
		n_c <= x"801d";
		valid_in <= '1';
		x <= x"0955";
		y <= x"b3c1";
		m <= x"bdcb";
		r_c <= x"8fbc";
		wait for clk_period;
		x <= x"063e";
		y <= x"5b1c";
		m <= x"091d";
		r_c <= x"4fa7";
		wait for clk_period;
		x <= x"38d6";
		y <= x"4bc8";
		m <= x"e5fd";
		r_c <= x"beb0";
		wait for clk_period;
		x <= x"e968";
		y <= x"463a";
		m <= x"46f8";
		r_c <= x"04bd";
		wait for clk_period;
		x <= x"b50d";
		y <= x"3fe4";
		m <= x"8f59";
		r_c <= x"50cd";
		wait for clk_period;
		x <= x"85d8";
		y <= x"b888";
		m <= x"ca2a";
		r_c <= x"f1c9";
		wait for clk_period;
		x <= x"4ddf";
		y <= x"c2b7";
		m <= x"7298";
		r_c <= x"988c";
		wait for clk_period;
		x <= x"51a7";
		y <= x"9428";
		m <= x"e253";
		r_c <= x"63ce";
		wait for clk_period;
		x <= x"558d";
		y <= x"94af";
		m <= x"687f";
		r_c <= x"679d";
		wait for clk_period;
		x <= x"a74e";
		y <= x"cc48";
		m <= x"f6c1";
		r_c <= x"72b2";
		wait for clk_period;
		x <= x"0ade";
		y <= x"a1ce";
		m <= x"9a41";
		r_c <= x"47a8";
		wait for clk_period;
		x <= x"c913";
		y <= x"fbe1";
		m <= x"527a";
		r_c <= x"693e";
		wait for clk_period;
		x <= x"c84f";
		y <= x"3edd";
		m <= x"a51f";
		r_c <= x"794f";
		wait for clk_period;
		x <= x"8700";
		y <= x"74a1";
		m <= x"7b61";
		r_c <= x"2198";
		wait for clk_period;
		x <= x"36ad";
		y <= x"ed4f";
		m <= x"b12d";
		r_c <= x"1d80";
		wait for clk_period;
		x <= x"da95";
		y <= x"9926";
		m <= x"e0aa";
		r_c <= x"81ee";
		wait for clk_period;
		x <= x"bb48";
		y <= x"0a93";
		m <= x"394e";
		r_c <= x"8737";
		wait for clk_period;
		x <= x"40e5";
		y <= x"f5d2";
		m <= x"4598";
		r_c <= x"62ae";
		wait for clk_period;
		x <= x"c9c1";
		y <= x"c3be";
		m <= x"b245";
		r_c <= x"a21c";
		wait for clk_period;
		x <= x"2ef5";
		y <= x"d38d";
		m <= x"8834";
		r_c <= x"6be1";
		wait for clk_period;
		x <= x"fe9f";
		y <= x"092c";
		m <= x"5374";
		r_c <= x"8c5a";
		wait for clk_period;
		x <= x"4a90";
		y <= x"c56c";
		m <= x"0609";
		r_c <= x"62a5";
		wait for clk_period;
		x <= x"ca2f";
		y <= x"af68";
		m <= x"649d";
		r_c <= x"a2de";
		wait for clk_period;
		x <= x"24c2";
		y <= x"e56a";
		m <= x"ee6a";
		r_c <= x"15a6";
		wait for clk_period;
		x <= x"96a0";
		y <= x"9444";
		m <= x"2584";
		r_c <= x"5c7b";
		wait for clk_period;
		x <= x"d6eb";
		y <= x"a952";
		m <= x"d93a";
		r_c <= x"b62d";
		wait for clk_period;
		x <= x"783b";
		y <= x"76f1";
		m <= x"b4b7";
		r_c <= x"b5ae";
		wait for clk_period;
		x <= x"70e5";
		y <= x"111c";
		m <= x"3ee6";
		r_c <= x"c627";
		wait for clk_period;
		x <= x"4a19";
		y <= x"cfbc";
		m <= x"3772";
		r_c <= x"7d6a";
		wait for clk_period;
		x <= x"1d65";
		y <= x"50ac";
		m <= x"dfc7";
		r_c <= x"ffd8";
		wait for clk_period;
		x <= x"b1c3";
		y <= x"ad59";
		m <= x"e0a3";
		r_c <= x"88df";
		wait for clk_period;
		x <= x"6d84";
		y <= x"7ff3";
		m <= x"afb8";
		r_c <= x"cb2b";
		wait for clk_period;
		x <= x"04bb";
		y <= x"dac9";
		m <= x"807f";
		r_c <= x"f5da";
		wait for clk_period;
		x <= x"8def";
		y <= x"c93e";
		m <= x"5b8b";
		r_c <= x"7a9d";
		wait for clk_period;
		x <= x"eae2";
		y <= x"b82e";
		m <= x"9d8a";
		r_c <= x"4eed";
		wait for clk_period;
		x <= x"68df";
		y <= x"7fdc";
		m <= x"1971";
		r_c <= x"2d48";
		wait for clk_period;
		x <= x"a679";
		y <= x"39e3";
		m <= x"ec46";
		r_c <= x"e94c";
		wait for clk_period;
		x <= x"2314";
		y <= x"82a9";
		m <= x"60e1";
		r_c <= x"d60a";
		wait for clk_period;
		x <= x"1df8";
		y <= x"a2c0";
		m <= x"520d";
		r_c <= x"fe28";
		wait for clk_period;
		x <= x"53c1";
		y <= x"870d";
		m <= x"76ed";
		r_c <= x"24f7";
		wait for clk_period;
		x <= x"2cf6";
		y <= x"69d6";
		m <= x"cd48";
		r_c <= x"087b";
		wait for clk_period;
		x <= x"4f87";
		y <= x"3926";
		m <= x"eb6f";
		r_c <= x"0542";
		wait for clk_period;
		x <= x"1c0b";
		y <= x"5e5c";
		m <= x"48ce";
		r_c <= x"339a";
		wait for clk_period;
		x <= x"da5d";
		y <= x"6574";
		m <= x"61ea";
		r_c <= x"fc39";
		wait for clk_period;
		x <= x"5268";
		y <= x"6bc4";
		m <= x"02ab";
		r_c <= x"99f6";
		wait for clk_period;
		x <= x"069e";
		y <= x"998d";
		m <= x"035c";
		r_c <= x"a52d";
		wait for clk_period;
		x <= x"2017";
		y <= x"b3c7";
		m <= x"baaf";
		r_c <= x"d714";
		wait for clk_period;
		x <= x"6372";
		y <= x"9410";
		m <= x"b8df";
		r_c <= x"de18";
		wait for clk_period;
		x <= x"5df7";
		y <= x"41b2";
		m <= x"f51f";
		r_c <= x"3cb8";
		wait for clk_period;
		x <= x"74c9";
		y <= x"5796";
		m <= x"7454";
		r_c <= x"8dba";
		wait for clk_period;
		x <= x"d300";
		y <= x"3801";
		m <= x"b6f0";
		r_c <= x"cd60";
		wait for clk_period;
		x <= x"94cc";
		y <= x"8481";
		m <= x"40d6";
		r_c <= x"e688";
		wait for clk_period;
		x <= x"c82a";
		y <= x"b427";
		m <= x"43a4";
		r_c <= x"c73b";
		wait for clk_period;
		x <= x"996f";
		y <= x"0668";
		m <= x"d410";
		r_c <= x"70cd";
		wait for clk_period;
		x <= x"3d1e";
		y <= x"251e";
		m <= x"07ee";
		r_c <= x"9801";
		wait for clk_period;
		x <= x"39a3";
		y <= x"3f31";
		m <= x"368d";
		r_c <= x"6f01";
		wait for clk_period;
		x <= x"f2a0";
		y <= x"cdf8";
		m <= x"71f7";
		r_c <= x"f4d9";
		wait for clk_period;
		x <= x"7e9b";
		y <= x"30c1";
		m <= x"9da8";
		r_c <= x"79fe";
		wait for clk_period;
		x <= x"7ab8";
		y <= x"88db";
		m <= x"ac2b";
		r_c <= x"7ba7";
		wait for clk_period;
		x <= x"b44a";
		y <= x"c4b9";
		m <= x"2338";
		r_c <= x"72b7";
		wait for clk_period;
		x <= x"397b";
		y <= x"f289";
		m <= x"ce9c";
		r_c <= x"3538";
		wait for clk_period;
		x <= x"c0a5";
		y <= x"41fa";
		m <= x"0682";
		r_c <= x"5875";
		wait for clk_period;
		x <= x"e04d";
		y <= x"fc53";
		m <= x"2f09";
		r_c <= x"7a49";
		wait for clk_period;
		x <= x"1253";
		y <= x"a5da";
		m <= x"bbf8";
		r_c <= x"2791";
		wait for clk_period;
		valid_in <= '0';

--valid_in <='0';


      wait;
   end process;

END;
