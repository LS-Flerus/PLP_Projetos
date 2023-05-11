module Mundo where

import Locais
import Itens
import Personagem
import BaseMilitar
import Floresta
import Lago
import Montanha
import VilaAbandonada

data MomentoDia = Manha | Tarde | Noite deriving (Eq, Ord, Show, Read, Bounded, Enum)

type Status = (Personagem, CamboinhaDoNorte)

data StatusArmadilha = Nenhuma | Armando | Armada deriving (Eq, Ord, Show, Read, Bounded, Enum)

data CamboinhaDoNorte = CamboinhaDoNorte
  { dia :: Int,
    momentoDia :: MomentoDia,
    vidaCarro :: Int,
    locaisArmadilha :: [StatusArmadilha],
    areas :: [Local]
  }

nextDia :: CamboinhaDoNorte -> CamboinhaDoNorte
nextDia mundo =
  CamboinhaDoNorte
    { dia = dia mundo + 1,
      momentoDia = Manha,
      vidaCarro = vidaCarro mundo,
      locaisArmadilha = locaisArmadilha mundo,
      areas = areas mundo
    }

nextMomento :: CamboinhaDoNorte -> CamboinhaDoNorte
nextMomento mundo =
  CamboinhaDoNorte
    { dia = dia mundo,
      momentoDia = succ (momentoDia mundo),
      vidaCarro = vidaCarro mundo,
      locaisArmadilha = locaisArmadilha mundo,
      areas = areas mundo
    }

setVidaCarro :: Int -> CamboinhaDoNorte -> CamboinhaDoNorte
setVidaCarro vida mundo =
  CamboinhaDoNorte
    { dia = dia mundo,
      momentoDia = momentoDia mundo,
      vidaCarro = vida,
      locaisArmadilha = locaisArmadilha mundo,
      areas = areas mundo
    }

setArmadilha :: [StatusArmadilha] -> CamboinhaDoNorte -> CamboinhaDoNorte
setArmadilha armadilhas mundo =
  CamboinhaDoNorte
    { dia = dia mundo,
      momentoDia = momentoDia mundo,
      vidaCarro = vidaCarro mundo,
      locaisArmadilha = armadilhas,
      areas = areas mundo
    }

areaRemoveItem :: CamboinhaDoNorte -> Int -> Item -> CamboinhaDoNorte
areaRemoveItem mundo idLocal item = 
  CamboinhaDoNorte
    { dia = dia mundo,
      momentoDia = momentoDia mundo,
      vidaCarro = vidaCarro mundo,
      locaisArmadilha = locaisArmadilha mundo,
      areas = locaisBefore ++ [localRemoveItem local item] ++ locaisAfter
    }

    where local = areas mundo !! (idLocal - 1)
          locaisBefore = take (idLocal - 1) (areas mundo)
          locaisAfter = drop (idLocal) (areas mundo)

areaRemoveTodosItem :: CamboinhaDoNorte -> Int -> Item -> CamboinhaDoNorte
areaRemoveTodosItem mundo idLocal item = 
  CamboinhaDoNorte
    { dia = dia mundo,
      momentoDia = momentoDia mundo,
      vidaCarro = vidaCarro mundo,
      locaisArmadilha = locaisArmadilha mundo,
      areas = locaisBefore ++ [localRemoveTodosItem local item] ++ locaisAfter
    }

    where local = areas mundo !! (idLocal - 1)
          locaisBefore = take (idLocal - 1) (areas mundo)
          locaisAfter = drop (idLocal) (areas mundo)

roboAfetarArea :: Int -> CamboinhaDoNorte -> CamboinhaDoNorte
roboAfetarArea idLocal mundo =
  CamboinhaDoNorte
    { dia = dia mundo,
      momentoDia = momentoDia mundo,
      vidaCarro = vidaCarro mundo,
      locaisArmadilha = locaisArmadilha mundo,
      areas = locaisBefore ++ [roboAfetarLocal local] ++ locaisAfter
    }

    where local = areas mundo !! (idLocal - 1)
          locaisBefore = take (idLocal - 1) (areas mundo)
          locaisAfter = drop (idLocal) (areas mundo)

  
checaSeFimDeJogo :: Status -> String
checaSeFimDeJogo status
                  | fome personagem >= 100 = "Voce morreu de fome."
                  | sede personagem >= 100 = "Voce morreu de sede."
                  | vida personagem <= 0 = "Voce morreu de morte matada."
                  | vidaCarro mundo >= 100 = "Parabens, seu carro esta rodando de novo."
                  | otherwise = ""
                  where personagem = fst status
                        mundo = snd status
