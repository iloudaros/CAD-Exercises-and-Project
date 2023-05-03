LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY d_ff_schematic IS PORT (
	CP : IN std_logic;
	Q : OUT std_logic;
	\Q'\ : OUT std_logic;
	D : IN std_logic
); END d_ff_schematic;



ARCHITECTURE STRUCTURE OF d_ff_schematic IS

-- COMPONENTS

COMPONENT \74AS1000\
	PORT (
	I0_A : IN std_logic;
	I1_A : IN std_logic;
	O_A : OUT std_logic;
	VCC : IN std_logic;
	GND : IN std_logic;
	I0_B : IN std_logic;
	I1_B : IN std_logic;
	O_B : OUT std_logic;
	I0_C : IN std_logic;
	I1_C : IN std_logic;
	O_C : OUT std_logic;
	I0_D : IN std_logic;
	I1_D : IN std_logic;
	O_D : OUT std_logic
	); END COMPONENT;

COMPONENT \74AS10\
	PORT (
	I0_A : IN std_logic;
	I1_A : IN std_logic;
	I2_A : IN std_logic;
	O_A : OUT std_logic;
	VCC : IN std_logic;
	GND : IN std_logic;
	I0_B : IN std_logic;
	I1_B : IN std_logic;
	I2_B : IN std_logic;
	O_B : OUT std_logic;
	I0_C : IN std_logic;
	I1_C : IN std_logic;
	I2_C : IN std_logic;
	O_C : OUT std_logic
	); END COMPONENT;

-- SIGNALS

SIGNAL orcad_unused:std_logic;
SIGNAL N00180 : std_logic;
SIGNAL N00283 : std_logic;
SIGNAL GND : std_logic;
SIGNAL VCC : std_logic;
SIGNAL N00059 : std_logic;
SIGNAL N00072 : std_logic;
SIGNAL N00083 : std_logic;
SIGNAL N00049 : std_logic;

-- INSTANCE ATTRIBUTES




-- GATE INSTANCES

BEGIN
\Q'\<=N00083;
Q<=N00072;
U1 : \74AS1000\	PORT MAP(
	I0_A => N00283, 
	I1_A => N00049, 
	O_A => N00180, 
	VCC => VCC, 
	GND => GND, 
	I0_B => N00180, 
	I1_B => CP, 
	O_B => N00049, 
	I0_C => N00049, 
	I1_C => N00083, 
	O_C => N00072, 
	I0_D => N00072, 
	I1_D => N00059, 
	O_D => N00083
);
U2 : \74AS10\	PORT MAP(
	I0_A => N00049, 
	I1_A => CP, 
	I2_A => N00283, 
	O_A => N00059, 
	VCC => VCC, 
	GND => GND
);
U3 : \74AS1000\	PORT MAP(
	I0_A => N00059, 
	I1_A => D, 
	O_A => N00283, 
	VCC => VCC, 
	GND => GND
);
END STRUCTURE;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY SCHEMATIC1 IS PORT (
	\out1'\ : OUT std_logic;
	\out0'\ : OUT std_logic;
	out0 : OUT std_logic;
	out1 : OUT std_logic;
	i0 : IN std_logic;
	i1 : IN std_logic;
	clk : IN std_logic
); END SCHEMATIC1;



ARCHITECTURE STRUCTURE OF SCHEMATIC1 IS

-- COMPONENTS

COMPONENT d_ff_schematic	 PORT (
	CP : IN std_logic;
	Q : OUT std_logic;
	\Q'\ : OUT std_logic;
	D : IN std_logic
); END COMPONENT;

-- SIGNALS

SIGNAL orcad_unused:std_logic;

-- INSTANCE ATTRIBUTES




-- GATE INSTANCES

BEGIN
U0 : d_ff_schematic	PORT MAP(
	CP => CLK, 
	Q => OUT0, 
	\Q'\ => \OUT0'\, 
	D => I0
);
U1 : d_ff_schematic	PORT MAP(
	CP => CLK, 
	Q => OUT1, 
	\Q'\ => \OUT1'\, 
	D => I1
);
END STRUCTURE;

