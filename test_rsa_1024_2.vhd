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
 
ENTITY test_rsa_1024_2 IS
END test_rsa_1024_2;
 
ARCHITECTURE behavior OF test_rsa_1024_2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rsa_top
    PORT(
         clk_i : IN  std_logic;
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
          clk_i => clk,
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

for i in 0 to 7 loop
      -- insert stimulus here 
		n_c <= x"b73d";
valid_in <= '1';
x <= x"435B";
y <= x"0319";
m <= x"a7eb";
r_c <= x"8c10";
wait for clk_period;
x <= x"BA3A";
y <= x"87db";
m <= x"aa6a";
r_c <= x"e4fc";
wait for clk_period;
x <= x"177C";
y <= x"09d8";
m <= x"1c2c";
r_c <= x"b2a4";
wait for clk_period;
x <= x"424E";
y <= x"f610";
m <= x"38cf";
r_c <= x"bf2d";
wait for clk_period;
x <= x"9D41";
y <= x"9805";
m <= x"c65f";
r_c <= x"f62b";
wait for clk_period;
x <= x"E69F";
y <= x"c02c";
m <= x"be83";
r_c <= x"fb6e";
wait for clk_period;
x <= x"11FF";
y <= x"3ba3";
m <= x"70d1";
r_c <= x"c9fc";
wait for clk_period;
x <= x"2181";
y <= x"fa25";
m <= x"f87a";
r_c <= x"51c8";
wait for clk_period;
x <= x"676D";
y <= x"1bdf";
m <= x"f105";
r_c <= x"9b03";
wait for clk_period;
x <= x"C44B";
y <= x"3db0";
m <= x"6901";
r_c <= x"3dbe";
wait for clk_period;
x <= x"0142";
y <= x"1c3d";
m <= x"53d8";
r_c <= x"0056";
wait for clk_period;
x <= x"829E";
y <= x"4b98";
m <= x"d37f";
r_c <= x"d163";
wait for clk_period;
x <= x"5839";
y <= x"791c";
m <= x"1f53";
r_c <= x"c73d";
wait for clk_period;
x <= x"CE05";
y <= x"1758";
m <= x"e05c";
r_c <= x"ab17";
wait for clk_period;
x <= x"87AD";
y <= x"63f0";
m <= x"60c4";
r_c <= x"7d4f";
wait for clk_period;
x <= x"6097";
y <= x"9e4e";
m <= x"fb5d";
r_c <= x"c7b1";
wait for clk_period;
x <= x"AC7E";
y <= x"6d14";
m <= x"4f1c";
r_c <= x"08e3";
wait for clk_period;
x <= x"CB99";
y <= x"f0fa";
m <= x"48e6";
r_c <= x"1537";
wait for clk_period;
x <= x"76F3";
y <= x"073d";
m <= x"0814";
r_c <= x"fc29";
wait for clk_period;
x <= x"715C";
y <= x"fc0d";
m <= x"cc18";
r_c <= x"47ad";
wait for clk_period;
x <= x"2B28";
y <= x"7143";
m <= x"04b8";
r_c <= x"59e3";
wait for clk_period;
x <= x"A021";
y <= x"5e21";
m <= x"8b31";
r_c <= x"fb0a";
wait for clk_period;
x <= x"F8F4";
y <= x"c508";
m <= x"fc85";
r_c <= x"c78b";
wait for clk_period;
x <= x"808A";
y <= x"a0a2";
m <= x"5952";
r_c <= x"164d";
wait for clk_period;
x <= x"9322";
y <= x"7c30";
m <= x"0703";
r_c <= x"8713";
wait for clk_period;
x <= x"48EE";
y <= x"91d0";
m <= x"32cb";
r_c <= x"b40f";
wait for clk_period;
x <= x"B36C";
y <= x"dca9";
m <= x"3634";
r_c <= x"32b3";
wait for clk_period;
x <= x"40F5";
y <= x"c677";
m <= x"0186";
r_c <= x"79e3";
wait for clk_period;
x <= x"34C6";
y <= x"6cc1";
m <= x"af46";
r_c <= x"90d5";
wait for clk_period;
x <= x"64CF";
y <= x"fc59";
m <= x"3bbb";
r_c <= x"004e";
wait for clk_period;
x <= x"0CEC";
y <= x"74e4";
m <= x"a37f";
r_c <= x"9015";
wait for clk_period;
x <= x"EDC9";
y <= x"3084";
m <= x"3324";
r_c <= x"0540";
wait for clk_period;
x <= x"E621";
y <= x"98d6";
m <= x"d9a9";
r_c <= x"7de9";
wait for clk_period;
x <= x"DBC6";
y <= x"da87";
m <= x"1e7b";
r_c <= x"8ba4";
wait for clk_period;
x <= x"B0A8";
y <= x"f419";
m <= x"f965";
r_c <= x"acb6";
wait for clk_period;
x <= x"EFF0";
y <= x"a9b2";
m <= x"376d";
r_c <= x"82e4";
wait for clk_period;
x <= x"E008";
y <= x"45e0";
m <= x"1969";
r_c <= x"ea8f";
wait for clk_period;
x <= x"2378";
y <= x"f4fe";
m <= x"91b8";
r_c <= x"19bd";
wait for clk_period;
x <= x"9A72";
y <= x"0aa0";
m <= x"09c9";
r_c <= x"0473";
wait for clk_period;
x <= x"91F4";
y <= x"7079";
m <= x"083b";
r_c <= x"72cc";
wait for clk_period;
x <= x"4498";
y <= x"5179";
m <= x"b7b7";
r_c <= x"3027";
wait for clk_period;
x <= x"C346";
y <= x"c6eb";
m <= x"5ccf";
r_c <= x"d0e6";
wait for clk_period;
x <= x"1EAE";
y <= x"ad77";
m <= x"1441";
r_c <= x"c77e";
wait for clk_period;
x <= x"C7A6";
y <= x"6a56";
m <= x"9866";
r_c <= x"753c";
wait for clk_period;
x <= x"F4AA";
y <= x"e7ba";
m <= x"6d7a";
r_c <= x"af49";
wait for clk_period;
x <= x"F32A";
y <= x"30cb";
m <= x"3585";
r_c <= x"f1c8";
wait for clk_period;
x <= x"B9EC";
y <= x"8278";
m <= x"22d0";
r_c <= x"01fb";
wait for clk_period;
x <= x"8B92";
y <= x"de0e";
m <= x"bda5";
r_c <= x"ac44";
wait for clk_period;
x <= x"9CE5";
y <= x"8b35";
m <= x"170f";
r_c <= x"7fda";
wait for clk_period;
x <= x"492C";
y <= x"6b0f";
m <= x"7026";
r_c <= x"eb32";
wait for clk_period;
x <= x"D739";
y <= x"f21c";
m <= x"da19";
r_c <= x"3143";
wait for clk_period;
x <= x"062C";
y <= x"8894";
m <= x"1d01";
r_c <= x"12db";
wait for clk_period;
x <= x"ECEF";
y <= x"a703";
m <= x"5bfb";
r_c <= x"c2b0";
wait for clk_period;
x <= x"90ED";
y <= x"bced";
m <= x"9a91";
r_c <= x"66b3";
wait for clk_period;
x <= x"9C87";
y <= x"061d";
m <= x"355d";
r_c <= x"0867";
wait for clk_period;
x <= x"9A89";
y <= x"f0a6";
m <= x"85c8";
r_c <= x"a00c";
wait for clk_period;
x <= x"EC39";
y <= x"9c6d";
m <= x"7989";
r_c <= x"a474";
wait for clk_period;
x <= x"D778";
y <= x"2283";
m <= x"5ea6";
r_c <= x"ee64";
wait for clk_period;
x <= x"4CC4";
y <= x"65ff";
m <= x"9341";
r_c <= x"60ce";
wait for clk_period;
x <= x"0F50";
y <= x"c21b";
m <= x"f2a0";
r_c <= x"0040";
wait for clk_period;
x <= x"67A4";
y <= x"8f98";
m <= x"d55f";
r_c <= x"c916";
wait for clk_period;
x <= x"1EB6";
y <= x"9a0d";
m <= x"3f39";
r_c <= x"dfde";
wait for clk_period;
x <= x"B25B";
y <= x"484c";
m <= x"6798";
r_c <= x"707b";
wait for clk_period;
x <= x"3D2A";
y <= x"67cd";
m <= x"a9e1";
r_c <= x"1dac";
wait for clk_period;
valid_in <='0';

wait for clk_period*800000;
n_c <= x"b73d";
valid_in <= '1';
x <= x"0b9f";
y <= x"0319";
m <= x"a7eb";
r_c <= x"8c10";
wait for clk_period;
x <= x"f4e8";
y <= x"87db";
m <= x"aa6a";
r_c <= x"e4fc";
wait for clk_period;
x <= x"b698";
y <= x"09d8";
m <= x"1c2c";
r_c <= x"b2a4";
wait for clk_period;
x <= x"cfcc";
y <= x"f610";
m <= x"38cf";
r_c <= x"bf2d";
wait for clk_period;
x <= x"f3ad";
y <= x"9805";
m <= x"c65f";
r_c <= x"f62b";
wait for clk_period;
x <= x"8e40";
y <= x"c02c";
m <= x"be83";
r_c <= x"fb6e";
wait for clk_period;
x <= x"6af9";
y <= x"3ba3";
m <= x"70d1";
r_c <= x"c9fc";
wait for clk_period;
x <= x"4e63";
y <= x"fa25";
m <= x"f87a";
r_c <= x"51c8";
wait for clk_period;
x <= x"9600";
y <= x"1bdf";
m <= x"f105";
r_c <= x"9b03";
wait for clk_period;
x <= x"68f4";
y <= x"3db0";
m <= x"6901";
r_c <= x"3dbe";
wait for clk_period;
x <= x"5a12";
y <= x"1c3d";
m <= x"53d8";
r_c <= x"0056";
wait for clk_period;
x <= x"d62e";
y <= x"4b98";
m <= x"d37f";
r_c <= x"d163";
wait for clk_period;
x <= x"8fc1";
y <= x"791c";
m <= x"1f53";
r_c <= x"c73d";
wait for clk_period;
x <= x"d2cd";
y <= x"1758";
m <= x"e05c";
r_c <= x"ab17";
wait for clk_period;
x <= x"c6e4";
y <= x"63f0";
m <= x"60c4";
r_c <= x"7d4f";
wait for clk_period;
x <= x"4a36";
y <= x"9e4e";
m <= x"fb5d";
r_c <= x"c7b1";
wait for clk_period;
x <= x"cedf";
y <= x"6d14";
m <= x"4f1c";
r_c <= x"08e3";
wait for clk_period;
x <= x"19ea";
y <= x"f0fa";
m <= x"48e6";
r_c <= x"1537";
wait for clk_period;
x <= x"ad18";
y <= x"073d";
m <= x"0814";
r_c <= x"fc29";
wait for clk_period;
x <= x"4402";
y <= x"fc0d";
m <= x"cc18";
r_c <= x"47ad";
wait for clk_period;
x <= x"fdb2";
y <= x"7143";
m <= x"04b8";
r_c <= x"59e3";
wait for clk_period;
x <= x"45fa";
y <= x"5e21";
m <= x"8b31";
r_c <= x"fb0a";
wait for clk_period;
x <= x"6941";
y <= x"c508";
m <= x"fc85";
r_c <= x"c78b";
wait for clk_period;
x <= x"61cf";
y <= x"a0a2";
m <= x"5952";
r_c <= x"164d";
wait for clk_period;
x <= x"6c80";
y <= x"7c30";
m <= x"0703";
r_c <= x"8713";
wait for clk_period;
x <= x"2e3c";
y <= x"91d0";
m <= x"32cb";
r_c <= x"b40f";
wait for clk_period;
x <= x"b5c5";
y <= x"dca9";
m <= x"3634";
r_c <= x"32b3";
wait for clk_period;
x <= x"f44b";
y <= x"c677";
m <= x"0186";
r_c <= x"79e3";
wait for clk_period;
x <= x"f9c6";
y <= x"6cc1";
m <= x"af46";
r_c <= x"90d5";
wait for clk_period;
x <= x"e9a2";
y <= x"fc59";
m <= x"3bbb";
r_c <= x"004e";
wait for clk_period;
x <= x"2148";
y <= x"74e4";
m <= x"a37f";
r_c <= x"9015";
wait for clk_period;
x <= x"b16b";
y <= x"3084";
m <= x"3324";
r_c <= x"0540";
wait for clk_period;
x <= x"4038";
y <= x"98d6";
m <= x"d9a9";
r_c <= x"7de9";
wait for clk_period;
x <= x"4496";
y <= x"da87";
m <= x"1e7b";
r_c <= x"8ba4";
wait for clk_period;
x <= x"99f0";
y <= x"f419";
m <= x"f965";
r_c <= x"acb6";
wait for clk_period;
x <= x"7560";
y <= x"a9b2";
m <= x"376d";
r_c <= x"82e4";
wait for clk_period;
x <= x"9fe3";
y <= x"45e0";
m <= x"1969";
r_c <= x"ea8f";
wait for clk_period;
x <= x"5579";
y <= x"f4fe";
m <= x"91b8";
r_c <= x"19bd";
wait for clk_period;
x <= x"74b5";
y <= x"0aa0";
m <= x"09c9";
r_c <= x"0473";
wait for clk_period;
x <= x"71e4";
y <= x"7079";
m <= x"083b";
r_c <= x"72cc";
wait for clk_period;
x <= x"45e6";
y <= x"5179";
m <= x"b7b7";
r_c <= x"3027";
wait for clk_period;
x <= x"f595";
y <= x"c6eb";
m <= x"5ccf";
r_c <= x"d0e6";
wait for clk_period;
x <= x"91e3";
y <= x"ad77";
m <= x"1441";
r_c <= x"c77e";
wait for clk_period;
x <= x"4ef1";
y <= x"6a56";
m <= x"9866";
r_c <= x"753c";
wait for clk_period;
x <= x"d694";
y <= x"e7ba";
m <= x"6d7a";
r_c <= x"af49";
wait for clk_period;
x <= x"475c";
y <= x"30cb";
m <= x"3585";
r_c <= x"f1c8";
wait for clk_period;
x <= x"9b2b";
y <= x"8278";
m <= x"22d0";
r_c <= x"01fb";
wait for clk_period;
x <= x"e3fc";
y <= x"de0e";
m <= x"bda5";
r_c <= x"ac44";
wait for clk_period;
x <= x"2009";
y <= x"8b35";
m <= x"170f";
r_c <= x"7fda";
wait for clk_period;
x <= x"2aa1";
y <= x"6b0f";
m <= x"7026";
r_c <= x"eb32";
wait for clk_period;
x <= x"9f13";
y <= x"f21c";
m <= x"da19";
r_c <= x"3143";
wait for clk_period;
x <= x"6672";
y <= x"8894";
m <= x"1d01";
r_c <= x"12db";
wait for clk_period;
x <= x"f315";
y <= x"a703";
m <= x"5bfb";
r_c <= x"c2b0";
wait for clk_period;
x <= x"adf5";
y <= x"bced";
m <= x"9a91";
r_c <= x"66b3";
wait for clk_period;
x <= x"5c95";
y <= x"061d";
m <= x"355d";
r_c <= x"0867";
wait for clk_period;
x <= x"228f";
y <= x"f0a6";
m <= x"85c8";
r_c <= x"a00c";
wait for clk_period;
x <= x"f2d3";
y <= x"9c6d";
m <= x"7989";
r_c <= x"a474";
wait for clk_period;
x <= x"2306";
y <= x"2283";
m <= x"5ea6";
r_c <= x"ee64";
wait for clk_period;
x <= x"e5e0";
y <= x"65ff";
m <= x"9341";
r_c <= x"60ce";
wait for clk_period;
x <= x"93b7";
y <= x"c21b";
m <= x"f2a0";
r_c <= x"0040";
wait for clk_period;
x <= x"1f17";
y <= x"8f98";
m <= x"d55f";
r_c <= x"c916";
wait for clk_period;
x <= x"48fd";
y <= x"9a0d";
m <= x"3f39";
r_c <= x"dfde";
wait for clk_period;
x <= x"257f";
y <= x"484c";
m <= x"6798";
r_c <= x"707b";
wait for clk_period;
x <= x"0002";
y <= x"67cd";
m <= x"a9e1";
r_c <= x"1dac";
wait for clk_period;
valid_in <='0';
wait for clk_period*800000;

end loop;

      wait;
   end process;

END;