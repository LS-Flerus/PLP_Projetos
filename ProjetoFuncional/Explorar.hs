module Explorar where 

import Text.Printf
import Util
import Inventario
import Personagem
import Itens
import Mundo
import Locais
import Criaturas

-- Coletar Implementacao
coletarLocal :: Status -> [Item] -> Int -> Status
coletarLocal status itens idLocal
  |encontroPerseguidor status idLocal = espantarPerseguidor coleta
  |otherwise = atualizarArmadilha coleta idLocal
  where eventos = eventosColeta ((areas (snd status)) !! (idLocal - 1))
        coleta = coletarLocal' status itens idLocal eventos

coletarLocal' :: Status -> [Item] -> Int -> [EventoColeta] -> Status
coletarLocal' status itens idLocal [] = status
coletarLocal' status itens idLocal (evento:tail)
  | not (listaItensEstaContida (requisitosColeta evento) itens) = coletarLocal' status itens idLocal tail
  | qtddItens <= 0 = coletarLocal' status itens idLocal tail
  | otherwise = coletarLocal' (personagemEscreverDiario, areaRemoveItem mundo idLocal itemColeta) itens idLocal tail
  
  where personagem = fst status
        mundo = snd status 
        local = (areas mundo) !! (idLocal - 1)
        itemColeta = coletado evento
        personagemItemAdicionado = addItemPersonagem itemColeta personagem
        mensagem = diario personagem ++ "adquiriu item " ++ nome itemColeta ++ "\n" 
        personagemEscreverDiario = setDiario mensagem personagemItemAdicionado
        qtddItens = quantosNoInventario itemColeta (inventarioLocal local)

-- Investigar Implementacao
investigarLocal :: Status -> [Item] -> Int -> Status
investigarLocal status itens idLocal
  |encontroPerseguidor status idLocal = espantarPerseguidor investigacao
  |otherwise = atualizarArmadilha investigacao idLocal
  where eventos = eventosInvestigacao ((areas (snd status)) !! (idLocal - 1))
        investigacao = investigarLocal' status itens idLocal eventos

investigarLocal' :: Status -> [Item] -> Int -> [EventoInvestigacao] -> Status
investigarLocal' status itens idLocal [] = status
investigarLocal' status itens idLocal (evento:tail)
  | not (listaItensEstaContida (requisitosInvestigacao evento) itens) = investigarLocal' ((setDiario mensagemFail personagem), mundo) itens idLocal tail
  | alvo == [] = investigarLocal' ((setDiario mensagemSucess personagem), mundo) itens idLocal tail
  | (quantosNoInventario (head alvo) (inventarioLocal local)) <= 0 = investigarLocal' status itens idLocal tail
  | otherwise = investigarLocal' ((setDiario mensagemSucess personagem), mundo) itens idLocal tail
  
  where personagem = fst status
        mundo = snd status 
        local = (areas mundo) !! (idLocal - 1)
        alvo = alvoInvestigacao evento
        mensagemSucess = diario personagem ++ mensagemSucesso evento ++ "\n" 
        mensagemFail = diario personagem ++ mensagemFalha evento ++ "\n"
        
        

    
