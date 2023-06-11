% ITEM = (ID, NOME, TIPO).

% Item Consumivel 

item(1, "AGUA", "CONSUMIVEL").
item(2, "COMIDA", "CONSUMIVEL").
item(3, "KIT MEDICO", "CONSUMIVEL").
item(4, "STEP", "CONSUMIVEL").
item(5, "COMBUSTIVEL", "CONSUMIVEL").
item(6, "BATERIA DE CARRO", "CONSUMIVEL").
item(7, "REBIMBOCA DA PARAFUSETA", "CONSUMIVEL").
item(8, "CARVAO", "CONSUMIVEL").

% Item Material 

item(9, "MADEIRA", "MATERIAL").
item(10, "PEDRA", "MATERIAL").
item(11, "LINHA", "MATERIAL").

% Item Ferramenta

item(12, "FACA", "FERRAMENTA").
item(13, "LANTERNA", "FERRAMENTA").
item(14, "BUSSOLA", "FERRAMENTA").
item(15, "VARA DE PESCA", "FERRAMENTA").
item(16, "CORDA", "FERRAMENTA").
item(17, "ISQUEIRO", "FERRAMENTA").
item(18, "RADAR", "FERRAMENTA").
item(19, "PICARETA", "FERRAMENTA").
item(20, "MACHADO", "FERRAMENTA").
item(21, "CHAPEU OPERARIO", "FERRAMENTA").
item(22, "MOCHILA", "FERRAMENTA").

% Receitas

% {idReceita = 1, itemA = linha, itemB = linha, resultado = corda}.
receita(1, 11, 11, 16).
% {idReceita = 2, itemA = madeira, itemB = linha, resultado = varaPesca}.
receita(2, 9, 11, 15).
% {idReceita = 3, itemA = madeira, itemB = pedra, resultado = picareta}.
receita(3, 9, 10, 19).
% {idReceita = 4, itemA = madeira, itemB = pedra, resultado = machado}.
receita(4, 9, 10, 20).