% STRINGS INÍCIO

inicio("Voce estava cansado da vida na cidade, saiu com seu carro, deu tudo errado.\n").

inicioDia(Dia) :- write("\n--- INICIO DO DIA "), write(Dia), writeln(" --- \n").

oQueFazer("O que deseja fazer?\n1. Usar Item\n2. Criar Item \n3. Sair em Coleta\n4. Sair em investigacao\n5. Ver Inventario\n6. Ver Status\n7. Sair\n").

escolherLocal("Qual local deseja visitar?\n1. Base Militar\n2. Floresta \n3. Lago\n4. Montanha\n5. Vila Abandonada\n").

checaFimDeJogo([0|_], _) :- write("Voce morreu de morte matada."), halt.
checaFimDeJogo([_,100|_], _) :- write("Voce morreu de fome."), halt.
checaFimDeJogo([_,_,100|_], _) :- write("Voce morreu de sede."), halt.
checaFimDeJogo(_, [_,_,100|_]) :- write("Parabens, seu carro esta rodando de novo."), halt.
checaFimDeJogo(_, _).

sublista([], _) :- !.
sublista(L2, L1):- 
    append(_, L3, L1),  
    append(L2, _, L3).

notSublista(L2, L1, Bool) :-
  sublista(L2, L1) -> Bool = false; Bool = true.

