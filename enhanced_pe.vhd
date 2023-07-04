----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:38:08 02/11/2010 
-- Design Name: 
-- Module Name:    enhanced_pe - Behavioral 
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

entity enhanced_pe is
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
			  
end enhanced_pe;

architecture Behavioral of enhanced_pe is



	signal prod_aj_bi, next_prod_aj_bi, mult_aj_bi : std_logic_vector(31 downto 0);  -- registros para la primera mult
   signal prod_nj_m, next_prod_nj_m,  mult_nj_m, mult_nj_m_reg: std_logic_vector(31 downto 0);
	signal sum_1, next_sum_1 : std_logic_vector(31 downto 0);
	signal sum_2, next_sum_2 : std_logic_vector(31 downto 0);
	signal ab_valid_reg,valid_out_reg,valid_out_reg2, valid_out_reg3  : std_logic;
	signal n_reg, next_n_reg, s_prev_reg, next_s_prev_reg : std_logic_vector(15 downto 0);
	--signal prod_aj_bi_out, next_prod_aj_bi_out : std_logic_vector(15 downto 0);
	
	type state_type is (wait_ab, calculate_m, obtain_m, calculate, wait_valid);
	signal state, next_state : state_type;
	signal m_cons, next_m_cons : std_logic_vector(15 downto 0);
	signal mul2_in_1, mul2_in_2 : std_logic_vector(15 downto 0);
	signal next_mul2_in_1, next_mul2_in_2 : std_logic_vector(15 downto 0);
	
begin


					 
   process(clk, reset)
	begin

      if(reset='1') then
		      prod_aj_bi <=(others=>'0');
			   prod_nj_m <=(others=>'0');
			   sum_1 <=(others=>'0');
			   sum_2 <=(others=>'0');
            n_reg <= (others => '0');
				valid_out_reg <= '0';
				valid_out_reg2 <= '0';
				valid_out_reg3 <= '0';
				s_prev_reg <= (others => '0');
				state <= wait_ab;
				m_cons <= (others => '0');
            mul2_in_1 <=(others => '0');
				mul2_in_2 <=(others => '0');
		else 
          if(clk='1' and clk'event) 
		    then
		    
				prod_aj_bi <= next_prod_aj_bi;
			   prod_nj_m <= next_prod_nj_m;
				
			   sum_1 <= next_sum_1;
			   sum_2 <= next_sum_2;
				
			   n_reg <= next_n_reg;
				valid_out_reg <= valid_in; --registramos el valid out para sacarle al tiempo de los datos validos
				valid_out_reg2 <= valid_out_reg;
				valid_out_reg3 <= valid_out_reg2;  
				s_prev_reg <= next_s_prev_reg;
				
				state <= next_state;
				m_cons <= next_m_cons;
				mul2_in_1 <= next_mul2_in_1;
				mul2_in_2 <= next_mul2_in_2;
		   end if;
		end if;

   end process;
	
	mult_aj_bi <= a_j * b_i;
	mult_nj_m <= mul2_in_1 * mul2_in_2;
		
	process(state, n_reg, s_prev_reg, prod_aj_bi, prod_nj_m, m_cons, valid_out_reg3, sum_2, valid_in, ab_valid_in, s_prev, mult_aj_bi, n_cons,mult_nj_m, sum_1, s_prev, n_j,a_j, b_i)
	
		variable aux : std_logic_vector(31 downto 0);
	begin
	   
		next_state <= state;
		next_n_reg <= n_reg;
		next_s_prev_reg <= s_prev_reg;
		next_prod_aj_bi <= prod_aj_bi;
		next_prod_nj_m <= prod_nj_m;

		
		next_sum_1 <= sum_1;	
      next_sum_2 <= sum_2;		
		next_m_cons <= m_cons;
		
		valid_out <= valid_out_reg3;
		s_next <=  sum_2(15 downto 0); --salida de la pipe
		fifo_req <= valid_in;
		 
		m_val <= '0';
		next_mul2_in_1 <= (others => '0');
	   next_mul2_in_2 <= (others => '0');



		
		case state is 
			
			--Si nos dicen que ab son validos hacemos la multiplicación
			when wait_ab =>
			   fifo_req <= '0';
			   valid_out <= '0';
				if(ab_valid_in = '1') then
					next_state <= calculate_m;
				end if;
				
			--Tenemos ab en mult_aj_bi
			when calculate_m =>
			   aux :=  mult_aj_bi+s_prev;
				next_prod_aj_bi <= mult_aj_bi+s_prev;
				next_mul2_in_1 <= aux(15 downto 0);
				next_mul2_in_2 <= n_cons;
				next_state <= obtain_m;
				
			--a la salida del dsp tenemos n_cons*t0
			when obtain_m =>
			
				next_mul2_in_1 <= prod_aj_bi(15 downto 0);
				next_mul2_in_2 <= n_cons;
				
				next_m_cons <= mult_nj_m(15 downto 0); 
				next_state <= wait_valid;
				next_n_reg <= n_j;
				next_prod_nj_m <= (others=>'0');
			when wait_valid =>
				m_val <= '1';
				
				if(valid_in='1') then
				   next_s_prev_reg <= s_prev; 	   
		         next_n_reg <= n_j;
					next_state <= calculate;
					next_mul2_in_1 <= n_reg;
					next_mul2_in_2 <= m_cons;
               next_prod_aj_bi <= mult_aj_bi;
		         next_prod_nj_m <= (others => '0'); --registramos la multiplicacion de n_j,m
					next_sum_2 <= (others => '0');
				end if;
			
				
			when calculate =>
			   next_s_prev_reg <= s_prev; 	   
		      next_n_reg <= n_j;
				next_mul2_in_1 <= n_j;
				next_mul2_in_2 <= m_cons;
				next_prod_aj_bi <= mult_aj_bi;
		      next_prod_nj_m <= mult_nj_m; --registramos la multiplicacion de n_j,m
				next_sum_1 <= prod_aj_bi+sum_1(31 downto 16)+s_prev_reg;
				next_sum_2 <= prod_nj_m+sum_2(31 downto 16) + sum_1(15 downto 0);
			
				if(valid_in='0') then
					next_state <= wait_ab;
					next_sum_1 <= (others => '0');
					next_sum_2 <= (others => '0');
				end if;
				
		end case;
	end process;


end Behavioral;

