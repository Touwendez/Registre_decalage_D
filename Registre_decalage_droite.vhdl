library ieee;
use ieee.std_logic_1164.all;

entity ShiftRegister is
    port (
        clk   : in  std_logic;
        reset : in  std_logic;
        shift : in  std_logic;
        inData: in  std_logic_vector(3 downto 0);
        outData: out std_logic_vector(3 downto 0)
    );
end entity ShiftRegister;

architecture Behavioral of ShiftRegister is
    signal reg : std_logic_vector(3 downto 0);
begin
    process (clk, reset)
    begin
        if reset = '1' then
            reg <= (others => '0'); -- Réinitialisation du registre à zéro
        elsif rising_edge(clk) then
            if shift = '1' then
                reg <= '0' & reg(3 downto 1); -- Décalage vers la droite
            else
                reg <= inData; -- Maintien de la valeur d'entrée
            end if;
        end if;
    end process;

    outData <= reg;
end architecture Behavioral;
