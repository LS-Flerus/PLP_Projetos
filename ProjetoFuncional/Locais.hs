module Locais where

import Itens
import Inventario

data StatusArmadilha = Nenhuma | Armando | Armada deriving (Eq, Ord, Show, Read, Bounded, Enum)

data EventoColeta  = EventoColeta {
                    requisitosColeta :: [Item],
                    coletado :: Item
}

data EventoInvestigacao = EventoInvestigacao {
                    requisitosInvestigacao :: [Item],
                    mensagemFalha :: String,
                    mensagemSucesso :: String

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

localRemoveTodosItens :: Local -> Local
localRemoveTodosItens local = 
  Local {
    nomeLocal = nomeLocal local,
    inventarioLocal = [],
    eventosColeta = eventosColeta local,
    eventosInvestigacao = eventosInvestigacao local
  }