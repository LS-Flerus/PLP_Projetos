module Locais where

import Itens
import Inventario

data StatusArmadilha = Nenhuma | Armando | Armada deriving (Eq, Ord, Show, Read, Bounded, Enum)

type EventoColeta = ([Item], Item)
type EventoInvestigacao = ([Item], (String, String))

data Local = Local{ 
                    nome :: String,
                    inventario :: Inventario,
                    eventoColeta :: [EventoColeta],
                    eventosInvestigacao :: [EventoInvestigacao]
                   }