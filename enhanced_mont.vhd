----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:04:51 02/11/2010 
-- Design Name: 
-- Module Name:    enhanced_mont - Behavioral 
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

entity enhanced_mont is

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
		data_ready : out std_logic;
		fifo_req : out std_logic;
		m_val : out std_logic;
		reset_the_PE : in std_logic); -- estamos preparados para aceptar el siguiente dato
		
end enhanced_mont;

architecture Behavioral of enhanced_mont is

	component enhanced_pe is
		Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  a_j : in std_logic_vector(15 downto 0);
			  b_i : in std_logic_vector(15 downto 0);
			  s_prev : in std_logic_vector(15 downto 0); --entrada de la s anterior para la suma
			  n_j : in std_logic_vector(15 downto 0);
			  s_next : out std_logic_vector(15 downto 0); --salida con la siguiente s
			  ab_valid_in : in std_logic; --indica que los datos de entrada en el multiplicador son validos
			  valid_in : in std_logic; --todas las entradas son validas, y la m está calculada	  
			  valid_out : out std_logic;
			  fifo_req : out std_logic;
			  n_cons : in std_logic_vector (15 downto 0);
			  m_val : out std_logic); --peticion de las siguientes entradas a, b, s, m
   end component;

  

   signal aj_bi,m,next_m, m_out : std_logic_vector(15 downto 0);
   signal mult_valid, valid_m, valid_m_reg : std_logic;  --lo registro para compararlos
	
begin

   PE_0: enhanced_pe port map(
						clk => clk,
						reset=> reset,	
						a_j => a,
						b_i => b,
						s_prev => s_prev,
						n_j => n,
						s_next => s,
						ab_valid_in => ab_valid,
						valid_in => valid_in,
						valid_out => data_ready,
						fifo_req => fifo_req,
						n_cons => n_c,
						m_val => m_val 
						);
						

end Behavioral;

