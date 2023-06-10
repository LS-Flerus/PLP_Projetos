:- ['itens.pl'].
:- ['mundo.pl'].
:- ['util.pl'].

loopDia(Mc, [Dia|Tail]) :-
    inicioDia(Dia),
    % putStrLn (roboBarulhos (dia mundo) ++ "\n") 
    momentoDia(Mc, [Dia|Tail]).

momentoDia(Mc, Mundo) :-
    checaFimDeJogo(Mc, Mundo),
    nth0(1, Mundo, MomentoMundo), write(MomentoMundo),
    oQueFazer(W), write(W),
    read(Opcao), menu(Opcao, Mc, Mundo).

menu(1, Mc, Mundo) :- 
    write("USAR ITEM"),
    momentoDia(Mc, Mundo).

menu(1, Mc, Mundo) :- 
    write("USAR ITEM"),
    momentoDia(Mc, Mundo), !.

menu(2, Mc, Mundo) :-         
    write("CRIAR ITEM"),
    momentoDia(Mc,Mundo), !.

menu(3, Mc, Mundo) :- 
    write("SAIR EM COLETA"),
    encenrrarMomentoDia(Mc, Mundo), !.

menu(4, Mc, Mundo) :- 
    write("SAIR EM INVESTIGACAO"),
    encenrrarMomentoDia(Mc, Mundo), !.

menu(5, Mc, Mundo) :- 
    write("VER INVENTARIO"),
    momentoDia(Mc, Mundo), !.

menu(6, Mc, Mundo) :- 
    write("VER STATUS"),
    momentoDia(Mc, Mundo), !.

menu(_, Mc, Mundo) :- 
    write("OPCAO INVALIDA"),
    momentoDia(Mc, Mundo).

encenrrarMomentoDia([Vida,Fome,Sede|T], [Dia,MomentoDia|T2]) :-
    MomentoDia = "NOITE" -> nextMomentoDia(MomentoDia, Next), Sede2 is Sede + 2, Fome2 is Fome + 10, Dia2 is Dia + 1, loopDia([Vida,Fome2,Sede2|T], [Dia2,Next|T2])
    ; nextMomentoDia(MomentoDia, Next), Sede2 is Sede + 2, momentoDia([Vida,Fome,Sede2|T], [Dia,Next|T2]).


main([]) :-
    inicio(X), write(X),
    % let mc = Personagem {vida = 100, fome = 0, sede = 0, inventario = [(agua, 2), (comida, 1), (faca, 1)], diario = ""}
    MC = [100, 0, 0, [(1, 2), (2, 1), (12, 1)]],
    /*let mundo = CamboinhaDoNorte {dia = 1, momentoDia = Manha, vidaCarro = 0, 
                                    locaisArmadilha = [Nenhuma, Nenhuma, Nenhuma, Nenhuma, Nenhuma],
                                    areas = [baseMilitar, floresta, lago, montanha, vilaAbandonada]}*/
    MUNDO = [1, "MANHA", 0, ["Nenhuma", "Nenhuma", "Nenhuma", "Nenhuma", "Nenhuma"], []],
    loopDia(MC, MUNDO),
    halt.