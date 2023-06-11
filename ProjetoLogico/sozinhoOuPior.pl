:- ['itens.pl'].
:- ['mundo.pl'].
:- ['util.pl'].
:- ['inventario.pl'].
:- ['menu.pl'].

loopDia(Mc, [Dia|Tail]) :-
    inicioDia(Dia),
    % putStrLn (roboBarulhos (dia mundo) ++ "\n") 
    momentoDia(Mc, [Dia|Tail]).

momentoDia(Mc, Mundo) :-
    checaFimDeJogo(Mc, Mundo),
    nth0(1, Mundo, MomentoMundo), writeln(MomentoMundo), write(" \n"),
    oQueFazer(W), writeln(W),
    read(Opcao), menu(Opcao, Mc, Mundo).

% USAR ITEM
menu(1, Mc, Mundo) :- 
    last(Mc, Inventario),
    findall((X, Y), (item(X, _, "CONSUMIVEL"), member((X, Y), Inventario)), InventarioConsumiveis),
    printInventario(InventarioConsumiveis),
    read(Opcao), I is Opcao - 1, nth0(I, InventarioConsumiveis, (X,_)), usarItem(X, Mc, Mundo, Mc2, Mundo2),
    momentoDia(Mc2, Mundo2), !.

% CRIAR ITEM
menu(2, Mc, Mundo) :-         
    write("CRIAR ITEM"),
    momentoDia(Mc,Mundo), !.

% COLETA
menu(3, Mc, Mundo) :- 
    write("SAIR EM COLETA"),
    encenrrarMomentoDia(Mc, Mundo), !.

% INVESTIGACAO
menu(4, Mc, Mundo) :- 
    write("SAIR EM INVESTIGACAO"),
    encenrrarMomentoDia(Mc, Mundo), !.

% VER INVENTARIO
menu(5, Mc, Mundo) :- 
    nth0(3, Mc, Inventario), printInventario(Inventario),
    momentoDia(Mc, Mundo), !.

% VER STATUS
menu(6, Mc, Mundo) :- 
    verStatus(Mc, Mundo),
    momentoDia(Mc, Mundo), !.

% Sair
menu(7, _, _) :- 
    write("Talvez o sofrimento nao vale a pena."),
    halt.

% ELSE
menu(_, Mc, Mundo) :- 
    write("OPCAO INVALIDA"),
    momentoDia(Mc, Mundo).

encenrrarMomentoDia([Vida,Fome,Sede|T], [Dia,MomentoDia|T2]) :-
    MomentoDia = "NOITE" -> nextMomentoDia(MomentoDia, Next), Sede2 is Sede + 2, Fome2 is Fome + 10, Dia2 is Dia + 1, loopDia([Vida,Fome2,Sede2|T], [Dia2,Next|T2])
    ; nextMomentoDia(MomentoDia, Next), Sede2 is Sede + 2, momentoDia([Vida,Fome,Sede2|T], [Dia,Next|T2]).


main([]) :-
    inicio(X), write(X),
    % let mc = Personagem {vida = 100, fome = 0, sede = 0, inventario = [(agua, 2), (comida, 1), (faca, 1)]}
    MC = [50, 30, 25, [(1, 2), (2, 1), (3, 1), (4, 1), (12, 1)]],
    /*let mundo = CamboinhaDoNorte {dia = 1, momentoDia = Manha, vidaCarro = 0, 
                                    locaisArmadilha = [Nenhuma, Nenhuma, Nenhuma, Nenhuma, Nenhuma],
                                    areas = [baseMilitar, floresta, lago, montanha, vilaAbandonada]}*/
    MUNDO = [1, "MANHA", 20, ["Nenhuma", "Nenhuma", "Nenhuma", "Nenhuma", "Nenhuma"], []],
    loopDia(MC, MUNDO),
    halt.