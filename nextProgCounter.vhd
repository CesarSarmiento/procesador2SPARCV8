----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:41:11 04/18/2016 
-- Design Name: 
-- Module Name:    nextProgCounter - arq_nextProgCounter 
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

entity nextProgCounter is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           direccion1 : in  STD_LOGIC_VECTOR (31 downto 0);
           direccion2 : out  STD_LOGIC_VECTOR (31 downto 0));
end nextProgCounter;

architecture arq_nextProgCounter of nextProgCounter is

begin
	process(clk, reset,direccion1)
	begin 
		if(rising_edge(clk))then 
			if(reset='1')then
				 direccion2 <= (others =>'0');
			 else 
				direccion2 <= direccion1; 
		end if;
	end if;
	end process;
	
end arq_nextProgCounter;

