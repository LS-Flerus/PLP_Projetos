module Locais where

import Itens
import Inventario

data EventoColeta  = EventoColeta {
                    requisitosColeta :: [Item],
                    coletado :: Item
}

data EventoInvestigacao = EventoInvestigacao {
                    requisitosInvestigacao :: [Item],
                    alvoInvestigacao :: [Item], -- Marca que item a investigação está indicando. Caso [] -> O alvo é a mensagem em si --
                    mensagemFalha :: String,
                    mensagemSucesso :: String

}

eventoRobo = EventoInvestigacao {
                                  requisitosInvestigacao = []
                                  , alvoInvestigacao = []
                                  , mensagemFalha = ""
                                  , mensagemSucesso = "O Automato operou neste lugar, e é notório que este nunca mais será o mesmo"
                                  }

data Local = Local{ 
                    nomeLocal :: String,
                    inventarioLocal :: Inventario,
                    eventosColeta :: [EventoColeta],
                    eventosInvestigacao :: [EventoInvestigacao]
                   }

localRemoveItem :: Local -> Item -> Local
localRemoveItem local item = 
  Local {
    nomeLocal = nomeLocal local,
    inventarioLocal = removeItemInventario item (inventarioLocal local),
    eventosColeta = eventosColeta local,
    eventosInvestigacao = eventosInvestigacao local
  }

localRemoveTodosItem :: Local -> Item -> Local
localRemoveTodosItem local item = 
  Local {
    nomeLocal = nomeLocal local,
    inventarioLocal = removeTodosItemInventario item (inventarioLocal local),
    eventosColeta = eventosColeta local,
    eventosInvestigacao = eventosInvestigacao local
  }

roboAfetarLocal :: Local -> Local
roboAfetarLocal local = 
  Local {
    nomeLocal = nomeLocal local,
    inventarioLocal = inventarioLocal local,
    eventosColeta = tail (eventosColeta local),
    eventosInvestigacao = [eventoRobo] ++ (tail (eventosInvestigacao local))
  }
