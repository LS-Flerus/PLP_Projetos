:- ['criaturas.pl'].
:- ['mundo.pl'].
:- ['util.pl'].
:- ['inventario.pl'].
:- ['itens.pl'].

%  MC = [Vida, Fome, Sede, Inventario], MUNDO = [Dia, MomentoDia, VidaCarro, Armadilhas, Locais]

% Coletar Implementacao

coletarLocal([Vida, Fome, Sede, Inventario], [Dia, MomentoDia, VidaCarro, Armadilhas, Locais], IdLocal, Itens, [Vida, Fome, Sede, InventarioFinal], [Dia, MomentoDia, VidaCarro, ArmadilhasFinal, LocaisFinal]) :-
    Mc = [Vida, Fome, Sede, Inventario], Mundo = [Dia, MomentoDia, VidaCarro, Armadilhas, Locais],
    I is IdLocal - 1, nth0(I, Locais, Local), nth0(2, Local, EventosColeta),
    coletarLocalB(Mc, Mundo, IdLocal, Itens, EventosColeta, [_, _, _, InventarioFinal], [_, _, _, _, LocaisFinal]),
    finalizar(Armadilhas, IdLocal, ArmadilhasFinal).
    
finalizar(Armadilhas, IdLocal, ArmadilhasFinal) :-
    encontroPerseguidor(Armadilhas, IdLocal) -> espantarPerseguidor(ArmadilhasFinal)
    ; atualizarArmadilha(Armadilhas, IdLocal, ArmadilhasFinal).

coletarLocalB(Mc, Mundo, _, _, [], Mc, Mundo):- !.

coletarLocalB([V, F, S, Inventario], [D, M, VC, Armadilhas, Locais], IdLocal, Itens, [Evento|T], MC, MUNDO) :-
  nth0(0, Evento, Requisitos),
  notX(sublista(Requisitos,Itens)) -> coletarLocalB([V, F, S, Inventario], [D, M, VC, Armadilhas, Locais], IdLocal, Itens, T, MC, MUNDO), !.
  
coletarLocalB([V, F, S, Inventario], [D, M, VC, Armadilhas, Locais], IdLocal, Itens, [Evento|T], MC, MUNDO) :-
  I is IdLocal - 1, nth0(I, Locais, Local), nth0(1, Local, InventarioLocal), nth0(1, Evento, Alvo),
  notX(member((Alvo, _), InventarioLocal)) -> coletarLocalB([V, F, S, Inventario], [D, M, VC, Armadilhas, Locais], IdLocal, Itens, T, MC, MUNDO), !.
  
coletarLocalB([V, F, S, Inventario], [D, M, VC, Armadilhas, Locais], IdLocal, Itens, [Evento|T], MC, MUNDO) :-
  nth0(1, Evento, Alvo), addItem(Alvo, Inventario, Inventario2), areaRemoveItem(IdLocal, Alvo, Locais, Locais2),
  item(Alvo, Nome, _), write("Voce adquiriu 1 "), writeln(Nome),
  coletarLocalB([V, F, S, Inventario2], [D, M, VC, Armadilhas, Locais2], IdLocal, Itens, T, MC, MUNDO).

% Investigar Implementacao

investigarLocal([Vida, Fome, Sede, Inventario], [Dia, MomentoDia, VidaCarro, Armadilhas, Locais], IdLocal, Itens, [Vida, Fome, Sede, Inventario], [Dia, MomentoDia, VidaCarro, ArmadilhasFinal, Locais]) :-
    Mc = [Vida, Fome, Sede, Inventario], Mundo = [Dia, MomentoDia, VidaCarro, Armadilhas, Locais],
    I is IdLocal - 1, nth0(I, Locais, Local), nth0(3, Local, EventosInvestigacao),
    writeln("\nDIARIO:"),
    investigarLocalB(Mc, Mundo, IdLocal, Itens, EventosInvestigacao),
    finalizar(Armadilhas, IdLocal, ArmadilhasFinal).

investigarLocalB(Mc, Mundo, _, _, []):- !.

investigarLocalB([V, F, S, Inventario], [D, M, VC, Armadilhas, Locais], IdLocal, Itens, [Evento|T]) :-
  nth0(0, Evento, Requisitos),
  notX(sublista(Requisitos,Itens)) -> nth0(2, Evento, MensagemFail), writeln(MensagemFail),
  investigarLocalB([V, F, S, Inventario], [D, M, VC, Armadilhas, Locais], IdLocal, Itens, T), !.

investigarLocalB([V, F, S, Inventario], [D, M, VC, Armadilhas, Locais], IdLocal, Itens, [Evento|T]) :-
  I is IdLocal - 1, nth0(I, Locais, Local), nth0(1, Evento, Alvo),
  Alvo =:= 0 -> nth0(2, Local, MensagemSucess), writeln(MensagemSucess), 
  investigarLocalB([V, F, S, Inventario], [D, M, VC, Armadilhas, Locais], IdLocal, Itens, T), !.
  
investigarLocalB([V, F, S, Inventario], [D, M, VC, Armadilhas, Locais], IdLocal, Itens, [Evento|T]) :-
  I is IdLocal - 1, nth0(I, Locais, Local), nth0(1, Local, InventarioLocal), nth0(1, Evento, Alvo), 
  notX(member((Alvo, _), InventarioLocal)) -> investigarLocalB([V, F, S, Inventario], [D, M, VC, Armadilhas, Locais], IdLocal, Itens, T), !.
  
investigarLocalB([V, F, S, Inventario], [D, M, VC, Armadilhas, Locais], IdLocal, Itens, [Evento|T]) :-
  nth0(3, Evento, MensagemSucess), writeln(MensagemSucess),
  investigarLocalB([V, F, S, Inventario2], [D, M, VC, Armadilhas, Locais2], IdLocal, Itens, T).
