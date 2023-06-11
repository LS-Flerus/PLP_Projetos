:- ['itens.pl'].
:- ['inventario.pl'].

% usarItemImpl :: Item -> Status -> Status
usarItem(1, [Vida,Fome,Sede,Inventario], Mundo, McMudado, Mundo) :-
    Sede2 is Sede - 25,
    Sede2 < 0 -> removeItem(1, Inventario, Inventario2), McMudado = [Vida,Fome,0,Inventario2]
    ; SedeII is Sede - 25, removeItem(1, Inventario, Inventario2), McMudado = [Vida,Fome,SedeII,Inventario2], !.

usarItem(2, [Vida,Fome,Sede,Inventario], Mundo, McMudado, Mundo) :-
    Fome2 is Fome - 25,
    Fome2 < 0 -> removeItem(2, Inventario, Inventario2), McMudado = [Vida,0,Sede,Inventario2]
    ; FomeII is Fome - 25, removeItem(2, Inventario, Inventario2), McMudado = [Vida,FomeII,Sede,Inventario2], !.

usarItem(3, [Vida,Fome,Sede,Inventario], Mundo, McMudado, Mundo) :-
    Vida2 is Vida + 25, 
    Vida2 > 100 -> removeItem(3, Inventario, Inventario2), McMudado = [100,Fome,Sede,Inventario2]
    ; VidaII is Vida + 25, removeItem(3, Inventario, Inventario2), McMudado = [VidaII,Fome,Sede,Inventario2], !.

usarItem(ITEM, [Vida,Fome,Sede,Inventario], [DIA, MomentoDia, VidaCarro|T], [Vida,Fome,Sede,Inventario2], MundoMudado) :-       
    VidaCarro2 is VidaCarro + 25,
    VidaCarro2 > 100 -> removeItem(ITEM, Inventario, Inventario2), MundoMudado = [DIA, MomentoDia, 100|T]
    ; VidaCarroII is VidaCarro + 25, removeItem(ITEM, Inventario, Inventario2), MundoMudado = [DIA, MomentoDia, VidaCarroII|T], !.

% criarItemImpl :: Int -> Personagem -> Personagem

% coletarImpl :: Status -> Int -> [Item] -> Status

% investigarImpl :: Status -> Int -> [Item] -> Status

% verStatusImpl :: Status -> String
verStatus(Mc, Mundo) :-
    nth0(0, Mc, Vida), write("Vida: "), write(Vida), write(" \n"),
    nth0(1, Mc, Fome), write("Fome: "), write(Fome), write(" \n"),
    nth0(2, Mc, Sede), write("Sede: "), write(Sede), write(" \n"),
    nth0(2, Mundo, VidaCarro), write("Conserto da van: "), write(VidaCarro), write(" \n").