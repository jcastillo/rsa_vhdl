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
 
ENTITY test_rsa_2048 IS
END test_rsa_2048;
 
ARCHITECTURE behavior OF test_rsa_2048 IS 
 
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
   signal word_number : std_logic_vector(15 downto 0) := x"0080";
   signal bit_size : std_logic_vector(15 downto 0) := x"0800";
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
		n_c <= x"fd47";
		valid_in <= '1';

		x <= x"0b9f";
		y <= x"3bd5";
		m <= x"6389";
		r_c <= x"4eb4";
		wait for clk_period;
		x <= x"f4e8";
		y <= x"5425";
		m <= x"39f9";
		r_c <= x"26f2";
		wait for clk_period;
		x <= x"b698";
		y <= x"1304";
		m <= x"3ecf";
		r_c <= x"bd40";
		wait for clk_period;
		x <= x"cfcc";
		y <= x"8d4b";
		m <= x"4292";
		r_c <= x"286c";
		wait for clk_period;
		x <= x"f3ad";
		y <= x"57a5";
		m <= x"e28d";
		r_c <= x"d204";
		wait for clk_period;
		x <= x"8e40";
		y <= x"7c51";
		m <= x"d9d2";
		r_c <= x"f744";
		wait for clk_period;
		x <= x"6af9";
		y <= x"2fde";
		m <= x"3d4e";
		r_c <= x"9fc5";
		wait for clk_period;
		x <= x"4e63";
		y <= x"4314";
		m <= x"a572";
		r_c <= x"4900";
		wait for clk_period;
		x <= x"9600";
		y <= x"0746";
		m <= x"aaf2";
		r_c <= x"431a";
		wait for clk_period;
		x <= x"68f4";
		y <= x"d2de";
		m <= x"be65";
		r_c <= x"4ade";
		wait for clk_period;
		x <= x"5a12";
		y <= x"b0d9";
		m <= x"6c92";
		r_c <= x"c446";
		wait for clk_period;
		x <= x"d62e";
		y <= x"b800";
		m <= x"d8d4";
		r_c <= x"b8ac";
		wait for clk_period;
		x <= x"8fc1";
		y <= x"c69e";
		m <= x"6e11";
		r_c <= x"bede";
		wait for clk_period;
		x <= x"d2cd";
		y <= x"4947";
		m <= x"b347";
		r_c <= x"432b";
		wait for clk_period;
		x <= x"c6e4";
		y <= x"3fe6";
		m <= x"6356";
		r_c <= x"d2e0";
		wait for clk_period;
		x <= x"4a36";
		y <= x"9baf";
		m <= x"4162";
		r_c <= x"cce6";
		wait for clk_period;
		x <= x"cedf";
		y <= x"c7ee";
		m <= x"f873";
		r_c <= x"3a8e";
		wait for clk_period;
		x <= x"19ea";
		y <= x"5dbf";
		m <= x"057e";
		r_c <= x"c047";
		wait for clk_period;
		x <= x"ad18";
		y <= x"3623";
		m <= x"6b68";
		r_c <= x"6427";
		wait for clk_period;
		x <= x"4402";
		y <= x"104a";
		m <= x"daac";
		r_c <= x"329f";
		wait for clk_period;
		x <= x"fdb2";
		y <= x"c15d";
		m <= x"c1e0";
		r_c <= x"89a4";
		wait for clk_period;
		x <= x"45fa";
		y <= x"cc85";
		m <= x"9da0";
		r_c <= x"915f";
		wait for clk_period;
		x <= x"6941";
		y <= x"276e";
		m <= x"b652";
		r_c <= x"7dc7";
		wait for clk_period;
		x <= x"61cf";
		y <= x"5063";
		m <= x"0335";
		r_c <= x"a74a";
		wait for clk_period;
		x <= x"6c80";
		y <= x"f036";
		m <= x"7c45";
		r_c <= x"f565";
		wait for clk_period;
		x <= x"2e3c";
		y <= x"106d";
		m <= x"aef6";
		r_c <= x"6181";
		wait for clk_period;
		x <= x"b5c5";
		y <= x"b1e2";
		m <= x"86db";
		r_c <= x"8cf1";
		wait for clk_period;
		x <= x"f44b";
		y <= x"3b0e";
		m <= x"538d";
		r_c <= x"fe71";
		wait for clk_period;
		x <= x"f9c6";
		y <= x"3c8f";
		m <= x"e85b";
		r_c <= x"0848";
		wait for clk_period;
		x <= x"e9a2";
		y <= x"ee60";
		m <= x"d2c3";
		r_c <= x"f44c";
		wait for clk_period;
		x <= x"2148";
		y <= x"a4f9";
		m <= x"7e7a";
		r_c <= x"e99a";
		wait for clk_period;
		x <= x"b16b";
		y <= x"fd31";
		m <= x"42c8";
		r_c <= x"c876";
		wait for clk_period;
		x <= x"4038";
		y <= x"54a4";
		m <= x"2c27";
		r_c <= x"15d5";
		wait for clk_period;
		x <= x"4496";
		y <= x"9f40";
		m <= x"f3af";
		r_c <= x"9ef8";
		wait for clk_period;
		x <= x"99f0";
		y <= x"117b";
		m <= x"4daa";
		r_c <= x"597b";
		wait for clk_period;
		x <= x"7560";
		y <= x"37a1";
		m <= x"beb0";
		r_c <= x"e6e5";
		wait for clk_period;
		x <= x"9fe3";
		y <= x"54c2";
		m <= x"a8f0";
		r_c <= x"459f";
		wait for clk_period;
		x <= x"5579";
		y <= x"aea7";
		m <= x"5e90";
		r_c <= x"28be";
		wait for clk_period;
		x <= x"74b5";
		y <= x"f08c";
		m <= x"b4ff";
		r_c <= x"554e";
		wait for clk_period;
		x <= x"71e4";
		y <= x"dbca";
		m <= x"0331";
		r_c <= x"7abf";
		wait for clk_period;
		x <= x"45e6";
		y <= x"df0c";
		m <= x"fb82";
		r_c <= x"57a9";
		wait for clk_period;
		x <= x"f595";
		y <= x"93ec";
		m <= x"ab2f";
		r_c <= x"d1ba";
		wait for clk_period;
		x <= x"91e3";
		y <= x"0204";
		m <= x"e4bf";
		r_c <= x"221c";
		wait for clk_period;
		x <= x"4ef1";
		y <= x"352a";
		m <= x"a52c";
		r_c <= x"4221";
		wait for clk_period;
		x <= x"d694";
		y <= x"f90d";
		m <= x"9ef5";
		r_c <= x"29b8";
		wait for clk_period;
		x <= x"475c";
		y <= x"8ea4";
		m <= x"308f";
		r_c <= x"196f";
		wait for clk_period;
		x <= x"9b2b";
		y <= x"06fe";
		m <= x"685e";
		r_c <= x"2f74";
		wait for clk_period;
		x <= x"e3fc";
		y <= x"ad19";
		m <= x"20ae";
		r_c <= x"2270";
		wait for clk_period;
		x <= x"2009";
		y <= x"25cb";
		m <= x"e223";
		r_c <= x"ff53";
		wait for clk_period;
		x <= x"2aa1";
		y <= x"5d86";
		m <= x"9151";
		r_c <= x"5339";
		wait for clk_period;
		x <= x"9f13";
		y <= x"8a61";
		m <= x"0ce5";
		r_c <= x"307a";
		wait for clk_period;
		x <= x"6672";
		y <= x"7545";
		m <= x"3403";
		r_c <= x"8fff";
		wait for clk_period;
		x <= x"f315";
		y <= x"ce0d";
		m <= x"c42c";
		r_c <= x"5c84";
		wait for clk_period;
		x <= x"adf5";
		y <= x"5fd6";
		m <= x"0cda";
		r_c <= x"d030";
		wait for clk_period;
		x <= x"5c95";
		y <= x"7422";
		m <= x"9891";
		r_c <= x"a102";
		wait for clk_period;
		x <= x"228f";
		y <= x"fa73";
		m <= x"59fc";
		r_c <= x"1d05";
		wait for clk_period;
		x <= x"f2d3";
		y <= x"ddf8";
		m <= x"ca36";
		r_c <= x"6746";
		wait for clk_period;
		x <= x"2306";
		y <= x"2b97";
		m <= x"bb9d";
		r_c <= x"e8b9";
		wait for clk_period;
		x <= x"e5e0";
		y <= x"c670";
		m <= x"b443";
		r_c <= x"2cc5";
		wait for clk_period;
		x <= x"93b7";
		y <= x"100b";
		m <= x"22e2";
		r_c <= x"2dbd";
		wait for clk_period;
		x <= x"1f17";
		y <= x"503a";
		m <= x"77c2";
		r_c <= x"d742";
		wait for clk_period;
		x <= x"48fd";
		y <= x"a756";
		m <= x"e40d";
		r_c <= x"c586";
		wait for clk_period;
		x <= x"257f";
		y <= x"5c9b";
		m <= x"8e72";
		r_c <= x"2489";
		wait for clk_period;
		x <= x"b9f2";
		y <= x"d229";
		m <= x"4cda";
		r_c <= x"16e0";
		wait for clk_period;
		x <= x"4e80";
		y <= x"1684";
		m <= x"2730";
		r_c <= x"8b6c";
		wait for clk_period;
		x <= x"698f";
		y <= x"20d6";
		m <= x"2363";
		r_c <= x"c41d";
		wait for clk_period;
		x <= x"fccb";
		y <= x"21ae";
		m <= x"4c23";
		r_c <= x"dc3e";
		wait for clk_period;
		x <= x"3adc";
		y <= x"5814";
		m <= x"cdb1";
		r_c <= x"7490";
		wait for clk_period;
		x <= x"e40f";
		y <= x"aa59";
		m <= x"93dd";
		r_c <= x"1375";
		wait for clk_period;
		x <= x"af98";
		y <= x"7071";
		m <= x"c0b1";
		r_c <= x"11e8";
		wait for clk_period;
		x <= x"e636";
		y <= x"a72e";
		m <= x"a7c1";
		r_c <= x"e15a";
		wait for clk_period;
		x <= x"6004";
		y <= x"40b8";
		m <= x"8ff9";
		r_c <= x"4bcd";
		wait for clk_period;
		x <= x"8f49";
		y <= x"d0d2";
		m <= x"74e2";
		r_c <= x"e64e";
		wait for clk_period;
		x <= x"a126";
		y <= x"090b";
		m <= x"f27d";
		r_c <= x"fe5d";
		wait for clk_period;
		x <= x"62e5";
		y <= x"62e8";
		m <= x"ac5b";
		r_c <= x"3496";
		wait for clk_period;
		x <= x"fc1d";
		y <= x"55eb";
		m <= x"8128";
		r_c <= x"f413";
		wait for clk_period;
		x <= x"2cd8";
		y <= x"82ea";
		m <= x"ac91";
		r_c <= x"be49";
		wait for clk_period;
		x <= x"6e4d";
		y <= x"94c8";
		m <= x"1841";
		r_c <= x"c845";
		wait for clk_period;
		x <= x"a36c";
		y <= x"5a89";
		m <= x"394a";
		r_c <= x"78e5";
		wait for clk_period;
		x <= x"edf4";
		y <= x"ed30";
		m <= x"924d";
		r_c <= x"91c0";
		wait for clk_period;
		x <= x"9eac";
		y <= x"acb0";
		m <= x"b0cf";
		r_c <= x"fd0b";
		wait for clk_period;
		x <= x"d181";
		y <= x"5f6c";
		m <= x"8425";
		r_c <= x"25c0";
		wait for clk_period;
		x <= x"402a";
		y <= x"032f";
		m <= x"eff7";
		r_c <= x"bf59";
		wait for clk_period;
		x <= x"db24";
		y <= x"4af6";
		m <= x"739b";
		r_c <= x"c7ad";
		wait for clk_period;
		x <= x"5faf";
		y <= x"04b4";
		m <= x"dee2";
		r_c <= x"8704";
		wait for clk_period;
		x <= x"9414";
		y <= x"3671";
		m <= x"c272";
		r_c <= x"69a8";
		wait for clk_period;
		x <= x"1cf6";
		y <= x"92ad";
		m <= x"d023";
		r_c <= x"db49";
		wait for clk_period;
		x <= x"c806";
		y <= x"68f1";
		m <= x"5df8";
		r_c <= x"64d3";
		wait for clk_period;
		x <= x"e3c6";
		y <= x"eb84";
		m <= x"4dad";
		r_c <= x"6e68";
		wait for clk_period;
		x <= x"5c52";
		y <= x"dbb5";
		m <= x"3cf4";
		r_c <= x"73d1";
		wait for clk_period;
		x <= x"44bb";
		y <= x"69d4";
		m <= x"3115";
		r_c <= x"465f";
		wait for clk_period;
		x <= x"9c6f";
		y <= x"3dba";
		m <= x"1ea2";
		r_c <= x"af8f";
		wait for clk_period;
		x <= x"9a2f";
		y <= x"fbde";
		m <= x"8dd5";
		r_c <= x"37c2";
		wait for clk_period;
		x <= x"148e";
		y <= x"c3e9";
		m <= x"3775";
		r_c <= x"931a";
		wait for clk_period;
		x <= x"16b2";
		y <= x"4290";
		m <= x"aee2";
		r_c <= x"8ea9";
		wait for clk_period;
		x <= x"038b";
		y <= x"d911";
		m <= x"0ee8";
		r_c <= x"6c8c";
		wait for clk_period;
		x <= x"4964";
		y <= x"8e22";
		m <= x"a6d6";
		r_c <= x"a572";
		wait for clk_period;
		x <= x"9f04";
		y <= x"3f75";
		m <= x"6a4d";
		r_c <= x"296a";
		wait for clk_period;
		x <= x"5609";
		y <= x"ecd9";
		m <= x"318c";
		r_c <= x"780a";
		wait for clk_period;
		x <= x"fe37";
		y <= x"a295";
		m <= x"19b0";
		r_c <= x"5b92";
		wait for clk_period;
		x <= x"5799";
		y <= x"6448";
		m <= x"4cad";
		r_c <= x"342b";
		wait for clk_period;
		x <= x"4b55";
		y <= x"e53e";
		m <= x"4d2c";
		r_c <= x"eb9e";
		wait for clk_period;
		x <= x"1e47";
		y <= x"64d5";
		m <= x"0d04";
		r_c <= x"645f";
		wait for clk_period;
		x <= x"5e67";
		y <= x"cd8d";
		m <= x"dff0";
		r_c <= x"7c47";
		wait for clk_period;
		x <= x"5954";
		y <= x"27ff";
		m <= x"2019";
		r_c <= x"7365";
		wait for clk_period;
		x <= x"1e3f";
		y <= x"c515";
		m <= x"e8e4";
		r_c <= x"f881";
		wait for clk_period;
		x <= x"ef19";
		y <= x"2191";
		m <= x"7893";
		r_c <= x"3c52";
		wait for clk_period;
		x <= x"6944";
		y <= x"d714";
		m <= x"dc79";
		r_c <= x"72c8";
		wait for clk_period;
		x <= x"75cd";
		y <= x"a713";
		m <= x"8b87";
		r_c <= x"25f6";
		wait for clk_period;
		x <= x"b2b4";
		y <= x"ddd7";
		m <= x"44af";
		r_c <= x"b145";
		wait for clk_period;
		x <= x"3fc9";
		y <= x"43c9";
		m <= x"4d0f";
		r_c <= x"1c1a";
		wait for clk_period;
		x <= x"009e";
		y <= x"10b1";
		m <= x"6be7";
		r_c <= x"e57b";
		wait for clk_period;
		x <= x"aa12";
		y <= x"f231";
		m <= x"9bf4";
		r_c <= x"417a";
		wait for clk_period;
		x <= x"f132";
		y <= x"0911";
		m <= x"4fd6";
		r_c <= x"686b";
		wait for clk_period;
		x <= x"6729";
		y <= x"1ae4";
		m <= x"f908";
		r_c <= x"eddf";
		wait for clk_period;
		x <= x"3156";
		y <= x"ce25";
		m <= x"0633";
		r_c <= x"eed7";
		wait for clk_period;
		x <= x"df5f";
		y <= x"67d8";
		m <= x"1675";
		r_c <= x"4c9f";
		wait for clk_period;
		x <= x"c95a";
		y <= x"6a2a";
		m <= x"b35c";
		r_c <= x"1c67";
		wait for clk_period;
		x <= x"28f5";
		y <= x"1425";
		m <= x"8d16";
		r_c <= x"a8c5";
		wait for clk_period;
		x <= x"2d32";
		y <= x"ec27";
		m <= x"e889";
		r_c <= x"d022";
		wait for clk_period;
		x <= x"306f";
		y <= x"abea";
		m <= x"ccf4";
		r_c <= x"cafa";
		wait for clk_period;
		x <= x"5e02";
		y <= x"b27e";
		m <= x"bc18";
		r_c <= x"671b";
		wait for clk_period;
		x <= x"3b7e";
		y <= x"c391";
		m <= x"0cae";
		r_c <= x"81ed";
		wait for clk_period;
		x <= x"f179";
		y <= x"e4aa";
		m <= x"0c7d";
		r_c <= x"951c";
		wait for clk_period;
		x <= x"8fd1";
		y <= x"0caf";
		m <= x"6620";
		r_c <= x"6822";
		wait for clk_period;
		x <= x"57f4";
		y <= x"6a45";
		m <= x"bed2";
		r_c <= x"b5e1";
		wait for clk_period;
		x <= x"0022";
		y <= x"771b";
		m <= x"f69a";
		r_c <= x"7245";
		wait for clk_period;
		x <= x"000f";
		y <= x"5ca2";
		m <= x"dd3c";
		r_c <= x"5bef";
		wait for clk_period;

valid_in <='0';


      wait;
   end process;

END;
