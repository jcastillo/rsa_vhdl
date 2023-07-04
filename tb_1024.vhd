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
 
ENTITY tb_1024 IS
END tb_1024;
 
ARCHITECTURE behavior OF tb_1024 IS 
 
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
		word_number : in std_logic_vector(7 downto 0)
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
   signal word_number : std_logic_vector(7 downto 0) := x"43";
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
     n_c <= x"6089";
	  
for i in 0 to 7 loop
valid_in <= '1';
a <= x"7651";
b <= x"7643";
n <= x"ea47";
wait for clk_period;
a <= x"4564";
b <= x"9027";
n <= x"4136";
wait for clk_period;
a <= x"8693";
b <= x"7987";
n <= x"7e7e";
wait for clk_period;
a <= x"5867";
b <= x"8798";
n <= x"554e";
wait for clk_period;
a <= x"2783";
b <= x"3999";
n <= x"c20e";
wait for clk_period;
a <= x"6346";
b <= x"8298";
n <= x"980f";
wait for clk_period;
a <= x"5425";
b <= x"6736";
n <= x"e007";
wait for clk_period;
a <= x"6723";
b <= x"0298";
n <= x"5195";
wait for clk_period;
a <= x"3485";
b <= x"2939";
n <= x"967e";
wait for clk_period;
a <= x"4928";
b <= x"3487";
n <= x"9912";
wait for clk_period;
a <= x"2736";
b <= x"9625";
n <= x"c9ed";
wait for clk_period;
a <= x"7465";
b <= x"4058";
n <= x"8989";
wait for clk_period;
a <= x"8583";
b <= x"4903";
n <= x"1d77";
wait for clk_period;
a <= x"7934";
b <= x"2389";
n <= x"6416";
wait for clk_period;
a <= x"8374";
b <= x"5287";
n <= x"42ff";
wait for clk_period;
a <= x"4652";
b <= x"5934";
n <= x"363f";
wait for clk_period;
a <= x"7387";
b <= x"3847";
n <= x"20f6";
wait for clk_period;
a <= x"4986";
b <= x"4759";
n <= x"a174";
wait for clk_period;
a <= x"8573";
b <= x"5638";
n <= x"999a";
wait for clk_period;
a <= x"5347";
b <= x"3487";
n <= x"07f8";
wait for clk_period;
a <= x"4534";
b <= x"4958";
n <= x"3915";
wait for clk_period;
a <= x"9343";
b <= x"6423";
n <= x"9801";
wait for clk_period;
a <= x"8598";
b <= x"7823";
n <= x"c2dd";
wait for clk_period;
a <= x"3894";
b <= x"2734";
n <= x"8bbe";
wait for clk_period;
a <= x"5785";
b <= x"4516";
n <= x"382e";
wait for clk_period;
a <= x"7234";
b <= x"6723";
n <= x"892a";
wait for clk_period;
a <= x"4589";
b <= x"9457";
n <= x"5c96";
wait for clk_period;
a <= x"0723";
b <= x"8238";
n <= x"e0be";
wait for clk_period;
a <= x"3589";
b <= x"3457";
n <= x"6c99";
wait for clk_period;
a <= x"5724";
b <= x"8952";
n <= x"787d";
wait for clk_period;
a <= x"3984";
b <= x"3247";
n <= x"bf42";
wait for clk_period;
a <= x"4765";
b <= x"9879";
n <= x"4f6b";
wait for clk_period;
a <= x"7938";
b <= x"5768";
n <= x"702b";
wait for clk_period;
a <= x"3495";
b <= x"7676";
n <= x"baee";
wait for clk_period;
a <= x"3746";
b <= x"9878";
n <= x"7f36";
wait for clk_period;
a <= x"6982";
b <= x"7987";
n <= x"caf5";
wait for clk_period;
a <= x"2734";
b <= x"9798";
n <= x"ab32";
wait for clk_period;
a <= x"3848";
b <= x"8958";
n <= x"75a2";
wait for clk_period;
a <= x"9485";
b <= x"3723";
n <= x"d8f4";
wait for clk_period;
a <= x"8573";
b <= x"8612";
n <= x"eb71";
wait for clk_period;
a <= x"5673";
b <= x"1237";
n <= x"6caf";
wait for clk_period;
a <= x"9678";
b <= x"2894";
n <= x"ab48";
wait for clk_period;
a <= x"3468";
b <= x"2343";
n <= x"6b93";
wait for clk_period;
a <= x"4232";
b <= x"2367";
n <= x"e734";
wait for clk_period;
a <= x"5653";
b <= x"2389";
n <= x"a258";
wait for clk_period;
a <= x"4354";
b <= x"8970";
n <= x"7326";
wait for clk_period;
a <= x"3423";
b <= x"3234";
n <= x"8302";
wait for clk_period;
a <= x"2342";
b <= x"4567";
n <= x"569e";
wait for clk_period;
a <= x"4234";
b <= x"3564";
n <= x"0544";
wait for clk_period;
a <= x"3423";
b <= x"3456";
n <= x"44dc";
wait for clk_period;
a <= x"3432";
b <= x"7523";
n <= x"660c";
wait for clk_period;
a <= x"9032";
b <= x"2346";
n <= x"8324";
wait for clk_period;
a <= x"5498";
b <= x"9234";
n <= x"eaeb";
wait for clk_period;
a <= x"3783";
b <= x"3908";
n <= x"6c0f";
wait for clk_period;
a <= x"3982";
b <= x"4506";
n <= x"110e";
wait for clk_period;
a <= x"2812";
b <= x"9359";
n <= x"91a7";
wait for clk_period;
a <= x"9831";
b <= x"4782";
n <= x"8915";
wait for clk_period;
a <= x"7987";
b <= x"5263";
n <= x"5e0c";
wait for clk_period;
a <= x"9798";
b <= x"9078";
n <= x"b3d8";
wait for clk_period;
a <= x"6758";
b <= x"2498";
n <= x"36e8";
wait for clk_period;
a <= x"9789";
b <= x"4167";
n <= x"87f2";
wait for clk_period;
a <= x"7878";
b <= x"2387";
n <= x"991e";
wait for clk_period;
a <= x"4232";
b <= x"2349";
n <= x"36d1";
wait for clk_period;
a <= x"0123";
b <= x"0037";
n <= x"d539";
wait for clk_period;
a <= x"0000";
b <= x"0000";
n <= x"0000";
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
wait for clk_period * 800;
end loop;
      wait;
   end process;

END;
