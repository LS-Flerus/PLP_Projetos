:- ['itens.pl'].
:- ['criaturas.pl'].
:- ['mundo.pl'].
:- ['util.pl'].
:- ['inventario.pl'].
:- ['menu.pl'].
:- ['basemilitar.pl'].
:- ['floresta.pl'].
:- ['lago.pl'].
:- ['montanha.pl'].
:- ['vilaabandonada.pl'].

loopDia(Mc, [Dia|Tail]) :-
    inicioDia(Dia),
    roboBarulhos(Dia),
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
    last(Mc, Inventario),
    findall((X, Y), (item(X, _, "MATERIAL"), member((X, Y), Inventario)), InventarioMateriais),
    printInventario(InventarioMateriais), printReceitas(),
    read(Opcao), criarItem(Opcao, Mc, McMudado),
    momentoDia(McMudado,Mundo), !.

% COLETA
menu(3, Mc, Mundo) :- 
    escolherLocal(String), writeln(String),
    read(Opcao),

    last(Mc, Inventario),
    writeln("Quais ferramentas deseja levar? (max 2. Digite [Int] ou [] para nao levar nada.)"),
    findall((X, Y), (item(X, _, "FERRAMENTA"), member((X, Y), Inventario)), InventarioFerramenta),
    printInventarioFerramenta(InventarioFerramenta),
    read(OpcaoItens),
    findall(I2, (member(I, OpcaoItens), I2 is I - 1), Indices), findall(X, (member(I2, Indices), nth0(I2, InventarioFerramenta, (X, _))), Itens), 
    coletar(Mc, Mundo, Opcao, Itens, McMudado, MundoMudado),

    encenrrarMomentoDia(McMudado, MundoMudado), !.

% INVESTIGACAO
menu(4, Mc, Mundo) :- 
    escolherLocal(String), writeln(String),
    read(Opcao),

    last(Mc, Inventario),
    writeln("Quais ferramentas deseja levar? (max 5. Digite [Int] ou [] para nao levar nada.)"),
    findall((X, Y), (item(X, _, "FERRAMENTA"), member((X, Y), Inventario)), InventarioFerramenta),
    printInventarioFerramenta(InventarioFerramenta),
    read(OpcaoItens),
    findall(I2, (member(I, OpcaoItens), I2 is I - 1), Indices), findall(X, (member(I2, Indices), nth0(I2, InventarioFerramenta, (X, _))), Itens), 
    investigar(Mc, Mundo, Opcao, Itens, McMudado, MundoMudado),

    encenrrarMomentoDia(McMudado, MundoMudado), !.

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
    MC = [100, 0, 0, [(1, 2), (2, 1), (12, 1)]],
    
    /*let mundo = CamboinhaDoNorte {dia = 1, momentoDia = Manha, vidaCarro = 0, 
                                    locaisArmadilha = [Nenhuma, Nenhuma, Nenhuma, Nenhuma, Nenhuma],
                                    areas = [baseMilitar, floresta, lago, montanha, vilaAbandonada]}*/
    basemilitar(BaseMilitar), floresta(Floresta), lago(Lago), montanha(Montanha), vilaabandonada(VilaAbandonada),
    MUNDO = [1, "MANHA", 0, ["NENHUMA", "NENHUMA", "NENHUMA", "NENHUMA", "NENHUMA"], [BaseMilitar, Floresta, Lago, Montanha, VilaAbandonada]],
    loopDia(MC, MUNDO),
    halt.