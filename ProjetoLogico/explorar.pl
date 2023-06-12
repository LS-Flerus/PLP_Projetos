:- ['criaturas.pl'].
:- ['mundo.pl'].
:- ['util.pl'].
:- ['inventario.pl'].

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

/* 'coletarLocal :: Status -> [Item] -> Int -> Status
coletarLocal status itens idLocal
  |encontroPerseguidor status idLocal = espantarPerseguidor coleta
  |otherwise = atualizarArmadilha coleta idLocal
  where eventos = eventosColeta ((areas (snd status)) !! (idLocal - 1))
        coleta = coletarLocalB status itens idLocal eventos' */

coletarLocalB(Mc, Mundo, _, _, [], Mc, Mundo):- !.

coletarLocalB([V, F, S, Inventario], [D, M, VC, Armadilhas, Locais], IdLocal, Itens, [Evento|T], MC, MUNDO) :-
  nth0(0, Evento, Requisitos), notSublista(Requisitos, Itens, Bool),
  Bool -> coletarLocalB([V, F, S, Inventario], [D, M, VC, Armadilhas, Locais], IdLocal, Itens, T, MC, MUNDO), !.
  
coletarLocalB([V, F, S, Inventario], [D, M, VC, Armadilhas, Locais], IdLocal, Itens, [Evento|T], MC, MUNDO) :-
  I is IdLocal - 1, nth0(I, Locais, Local), nth0(1, Local, InventarioLocal), nth0(1, Evento, Alvo), member((Alvo, Qtdd), InventarioLocal), 
  Qtdd =< 0 -> coletarLocalB([V, F, S, Inventario], [D, M, VC, Armadilhas, Locais], IdLocal, Itens, T, MC, MUNDO), !.
  
coletarLocalB([V, F, S, Inventario], [D, M, VC, Armadilhas, Locais], IdLocal, Itens, [Evento|T], MC, MUNDO) :-
  nth0(1, Evento, Alvo), addItem(Alvo, Inventario, Inventario2), 
  areaRemoveItem(IdLocal, Alvo, Locais, Locais2),
  coletarLocalB([V, F, S, Inventario2], [D, M, VC, Armadilhas, Locais2], IdLocal, Itens, T, MC, MUNDO).


/*'coletarLocalB :: Status -> [Item] -> Int -> [EventoColeta] -> Status
coletarLocalB status itens idLocal [] = status
coletarLocalB status itens idLocal (evento:tail)
  | not (listaItensEstaContida (requisitosColeta evento) itens) = coletarLocalB status itens idLocal tail
  | qtddItens <= 0 = coletarLocalB status itens idLocal tail
  | otherwise = coletarLocalB (personagemEscreverDiario, areaRemoveItem mundo idLocal itemColeta) itens idLocal tail
  
  where personagem = fst status
        mundo = snd status 
        local = (areas mundo) !! (idLocal - 1)
        itemColeta = coletado evento
        personagemItemAdicionado = addItemPersonagem itemColeta personagem
        mensagem = diario personagem ++ "adquiriu item " ++ nome itemColeta ++ "\n" 
        personagemEscreverDiario = setDiario mensagem personagemItemAdicionado
        qtddItens = quantosNoInventario itemColeta (inventarioLocal local)'*/

% Investigar Implementacao

/* 'investigarLocal :: Status -> [Item] -> Int -> Status
investigarLocal status itens idLocal
  |encontroPerseguidor status idLocal = espantarPerseguidor investigacao
  |otherwise = atualizarArmadilha investigacao idLocal
  where eventos = eventosInvestigacao ((areas (snd status)) !! (idLocal - 1))
        investigacao = investigarLocal' status itens idLocal eventos '*/

/* "investigarLocalB :: Status -> [Item] -> Int -> [EventoInvestigacao] -> Status
investigarLocalB status itens idLocal [] = status
investigarLocalB status itens idLocal (evento:tail)
  | not (listaItensEstaContida (requisitosInvestigacao evento) itens) = investigarLocalB ((setDiario mensagemFail personagem), mundo) itens idLocal tail
  | alvo == [] = investigarLocalB ((setDiario mensagemSucess personagem), mundo) itens idLocal tail
  | (quantosNoInventario (head alvo) (inventarioLocal local)) <= 0 = investigarLocalB status itens idLocal tail
  | otherwise = investigarLocalB ((setDiario mensagemSucess personagem), mundo) itens idLocal tail
  
  where personagem = fst status
        mundo = snd status 
        local = (areas mundo) !! (idLocal - 1)
        alvo = alvoInvestigacao evento
        mensagemSucess = diario personagem ++ mensagemSucesso evento ++ \n
        mensagemFail = diario personagem ++ mensagemFalha evento ++ \n */