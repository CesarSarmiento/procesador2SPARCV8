----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:57:34 04/24/2016 
-- Design Name: 
-- Module Name:    procesadorMonocicloImmediatos - arq_procesadorMonocicloImmediatos 
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

entity procesadorMonocicloImmediatos is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           salidaAlu : out  STD_LOGIC_VECTOR (31 downto 0));
end procesadorMonocicloImmediatos;

architecture arq_procesadorMonocicloImmediatos of procesadorMonocicloImmediatos is
COMPONENT sumador
	PORT(
		operador1 : IN std_logic_vector(31 downto 0);
		operador2 : IN std_logic_vector(31 downto 0);          
		resultado : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT nextProgCounter
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		direccion1 : IN std_logic_vector(31 downto 0);          
		direccion2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT memoriaInstrucciones
	PORT(
		direccion : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		instruccion : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT unidadControl
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		salida : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT registerFile
	PORT(
		regSource1 : IN std_logic_vector(4 downto 0);
		regSource2 : IN std_logic_vector(4 downto 0);
		dataWrite : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;
		regDestino : IN std_logic_vector(4 downto 0);          
		contRegSource1 : OUT std_logic_vector(31 downto 0);
		contRegSource2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT mux
	PORT(
		i : IN std_logic;
		dato_seu : IN std_logic_vector(31 downto 0);
		conReg2 : IN std_logic_vector(31 downto 0);          
		salidaMux : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT seu
	PORT(
		inmediato13bits : IN std_logic_vector(12 downto 0);          
		salidaInmediato : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
		COMPONENT alu
	PORT(
		operando1 : IN std_logic_vector(31 downto 0);
		operando2 : IN std_logic_vector(31 downto 0);
		alu_op : IN std_logic_vector(5 downto 0);          
		salida_Alu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	

	

	
	
	
	signal npcToAdd, sumadorToNPC, pcToIM,imToRUS, rfToAlu1, crsToMux, aluResult,seuToMux,muxToAlu: std_logic_vector(31 downto 0);
	signal alu_op1: std_logic_vector(5 downto 0);
begin
 Inst_sumador: sumador PORT MAP(
		operador1 => x"00000001" ,
		operador2 => npcToAdd,
		resultado => sumadorToNPC
	);
	
	Inst_nextProgCounter: nextProgCounter PORT MAP(
		clk => clk,
		reset => reset,
		direccion1 =>sumadorToNPC ,
		direccion2 =>npcToAdd 
	);
	
	Inst_ProgCounter: nextProgCounter PORT MAP(
		clk => clk,
		reset => reset,
		direccion1 =>npcToAdd ,
		direccion2 =>pcToIM 
	);
	Inst_memoriaInstrucciones: memoriaInstrucciones PORT MAP(
		direccion =>pcToIM  ,
		instruccion =>imToRUS ,
		reset => reset
	);
	Inst_unidadControl: unidadControl PORT MAP(
		op =>imToRUS(31 downto 30) ,
		op3 =>imToRUS(24 downto 19),
		salida => alu_op1
	);
	Inst_registerFile: registerFile PORT MAP(
		regSource1 =>imToRUS(18 downto 14),
		regSource2 =>imToRUS(4 downto 0),
		dataWrite => aluResult,
		reset => reset,
		regDestino =>imToRUS(29 downto 25) ,
		contRegSource1 => rfToAlu1,
		contRegSource2 => crsToMux
	);
	
	Inst_mux: mux PORT MAP(
		i => imToRUS(13),
		dato_seu =>seuToMux ,
		conReg2 =>crsToMux ,
		salidaMux => muxToAlu
	);
	Inst_seu: seu PORT MAP(
		inmediato13bits =>imToRUS(12 downto 0) ,
		salidaInmediato => seuToMux
	);
	
	Inst_alu: alu PORT MAP(
		operando1 => rfToAlu1,
		operando2 => muxToAlu,
		alu_op => alu_op1,
		salida_Alu => aluResult
	);
	
	salidaAlu <= aluResult;


end arq_procesadorMonocicloImmediatos;

