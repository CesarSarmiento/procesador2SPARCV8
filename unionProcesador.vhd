----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:18:43 04/18/2016 
-- Design Name: 
-- Module Name:    unionProcesador - arq_unionProcesador 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity unionProcesador is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           resultadoAlU : out  STD_LOGIC_VECTOR (31 downto 0));
end unionProcesador;

architecture arq_unionProcesador of unionProcesador is

COMPONENT nextProgCounter
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		direccion1 : IN std_logic_vector(31 downto 0);          
		direccion2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
begin


end arq_unionProcesador;

