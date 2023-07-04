----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:02:39 02/16/2010 
-- Design Name: 
-- Module Name:    rsa_group - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rsa_group is
port(
		clk_i : in std_logic;
		reset : in std_logic;
		valid_in : in std_logic;
		x : in std_logic_vector(15 downto 0); -- estos 3 son x^y mod m
		y : in std_logic_vector(15 downto 0);
		m : in std_logic_vector(15 downto 0);
		r_c : in std_logic_vector(15 downto 0); --constante de montgomery r^2 mod m
		n_c : in std_logic_vector(15 downto 0); --constante necesaria en la multiplicacion
		s : out std_logic_vector( 15 downto 0);
		valid_out : out std_logic;  
		word_number : in std_logic_vector(15 downto 0); -- cuantas palabras se introducen (n/16)
		bit_size : in std_logic_vector(15 downto 0);
		core_select : in std_logic_vector(2 downto 0) --tamano bit del exponente y (log2(y))
  );
end rsa_group;

architecture Behavioral of rsa_group is


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

	signal val_1, val_2, val_3, val_4, val_5 : std_logic;
	signal s_1, s_2, s_3, s_4, s_5 : std_logic_vector(15 downto 0);
	signal s_1_o, s_2_o, s_3_o, s_4_o, s_5_o : std_logic_vector(15 downto 0);
	signal val_o_1, val_o_2, val_o_3, val_o_4, val_o_5 : std_logic;
	signal o_val_o_1, o_val_o_2, o_val_o_3, o_val_o_4, o_val_o_5 : std_logic;
	
   
	signal valid_in_reg : std_logic;
	signal x_reg,y_reg, m_reg, r_c_reg, n_c_reg, word_number_reg, bit_size_reg : std_logic_vector(15 downto 0);
	
	signal clk: std_logic;
	
	component BUFG
   port (O : out STD_ULOGIC;
         I : in STD_ULOGIC);
	end component;

begin

buf_clk : BUFG port map(clk, clk_i);


uut_1: rsa_top PORT MAP (
          clk => clk,
          reset => reset,
          valid_in => val_1,
          x => x_reg,
          y => y_reg,
          m => m_reg,
          r_c => r_c_reg,
          n_c => n_c_reg,
          s => s_1_o,
          valid_out => o_val_o_1,
          word_number => word_number_reg,
			 bit_size => bit_size_reg
        );
		  
	
uut_2: rsa_top PORT MAP (
          clk => clk,
          reset => reset,
          valid_in => val_2,
          x => x_reg,
          y => y_reg,
          m => m_reg,
          r_c => r_c_reg,
          n_c => n_c_reg,
          s => s_2_o,
          valid_out => o_val_o_2,
          word_number => word_number_reg,
			 bit_size => bit_size_reg
        );
		  
		  
uut_3: rsa_top PORT MAP (
          clk => clk,
          reset => reset,
          valid_in => val_3,
          x => x_reg,
          y => y_reg,
          m => m_reg,
          r_c => r_c_reg,
          n_c => n_c_reg,
          s => s_3_o,
          valid_out => o_val_o_3,
          word_number => word_number_reg,
			 bit_size => bit_size_reg
        );
		  
		  
uut_4: rsa_top PORT MAP (
          clk => clk,
          reset => reset,
          valid_in => val_4,
          x => x_reg,
          y => y_reg,
          m => m_reg,
          r_c => r_c_reg,
          n_c => n_c_reg,
          s => s_4_o,
          valid_out => o_val_o_4,
          word_number => word_number_reg,
			 bit_size => bit_size_reg
        );
		  
		  
uut_5: rsa_top PORT MAP (
          clk => clk,
          reset => reset,
          valid_in => val_5,
          x => x_reg,
          y => y_reg,
          m => m_reg,
          r_c => r_c_reg,
          n_c => n_c_reg,
          s => s_5_o,
          valid_out => o_val_o_5,
          word_number => word_number_reg,
			 bit_size => bit_size_reg
        );		  
		  
	process(clk, reset)
	begin
    if(clk='1' and clk'event) then
		   if(reset='1')then
				valid_in_reg <= '0';
				x_reg <= (others => '0');
				y_reg <= (others => '0'); 
				m_reg <= (others => '0'); 
				r_c_reg <= (others => '0'); 
				n_c_reg <= (others => '0'); 
				word_number_reg <= (others => '0'); 
				bit_size_reg  <= (others => '0');
				s_1 <= (others => '0');
				s_2 <= (others => '0');
				s_3 <= (others => '0');
				s_4 <= (others => '0');
				s_5 <= (others => '0');
				
				val_o_1 <= '0';
				val_o_2 <= '0';
				val_o_3 <= '0';
				val_o_4 <= '0';
				val_o_5 <= '0';
				
		   else
            valid_in_reg <= valid_in;
				x_reg <= x;
				y_reg <= y;
				m_reg <= m;
				r_c_reg <= r_c; 
				n_c_reg <= n_c;
				word_number_reg <=  word_number;
				bit_size_reg  <= bit_size;
				s_1 <= s_1_o;
				s_2 <= s_2_o;
				s_3 <= s_3_o;
				s_4 <= s_4_o;
				s_5 <= s_5_o;
				val_o_1 <= o_val_o_1;
				val_o_2 <= o_val_o_2;
				val_o_3 <= o_val_o_3;
				val_o_4 <= o_val_o_4;
				val_o_5 <= o_val_o_5;
				
			end if;
		end if;
	end process;
	
	process(valid_in_reg, core_select, val_o_1, val_o_2, val_o_3, val_o_4, val_o_5, s_1, s_2, s_3, s_4, s_5)
	begin
	
	val_1 <= '0';
	val_2 <= '0';
	val_3 <= '0';
	val_4 <= '0';
	val_5 <= '0';
	
	
	s <= (others => '0');
	valid_out <= '0';
	
	case core_select is
		when "001" =>
			val_1 <= valid_in_reg;
			s<= s_1;
			valid_out <= val_o_1;
		when "010" =>
		   val_2 <= valid_in_reg;
			s<= s_2;
			valid_out <= val_o_2;
		when "011" =>
		   val_3 <= valid_in_reg;   
			s<= s_3;
			valid_out <= val_o_3;
		when "100" =>
		   val_4 <= valid_in_reg;
			s<= s_4;
			valid_out <= val_o_4;
		when "101" =>
		   val_5 <= valid_in_reg;
			s<= s_5;
			valid_out <= val_o_5;
		when others =>
	end case;	
	end process;
end Behavioral;

