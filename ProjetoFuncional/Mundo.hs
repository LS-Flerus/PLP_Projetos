module Mundo where

import Locais

data MomentoDia = Manha | Tarde | Noite deriving (Eq, Ord, Show, Read, Bounded, Enum)

data CamboinhaDoNorte = CamboinhaDoNorte
  { dia :: Int,
    momentoDia :: MomentoDia,
    vidaCarro :: Int,
    locaisArmadilha :: [Int],
    locaisRobo :: [Bool],
    areas :: [Local]
  }

nextDia :: CamboinhaDoNorte -> CamboinhaDoNorte
nextDia mundo =
  CamboinhaDoNorte
    { dia = dia mundo + 1,
      momentoDia = Manha,
      vidaCarro = vidaCarro mundo,
      locaisArmadilha = locaisArmadilha mundo,
      locaisRobo = locaisRobo mundo,
      areas = areas mundo
    }

nextMomento :: CamboinhaDoNorte -> CamboinhaDoNorte
nextMomento mundo =
  CamboinhaDoNorte
    { dia = dia mundo,
      momentoDia = succ (momentoDia mundo),
      vidaCarro = vidaCarro mundo,
      locaisArmadilha = locaisArmadilha mundo,
      locaisRobo = locaisRobo mundo,
      areas = areas mundo
    }

setVidaCarro :: Int -> CamboinhaDoNorte -> CamboinhaDoNorte
setVidaCarro vida mundo =
  CamboinhaDoNorte
    { dia = dia mundo,
      momentoDia = momentoDia mundo,
      vidaCarro = vida,
      locaisArmadilha = locaisArmadilha mundo,
      locaisRobo = locaisRobo mundo,
      areas = areas mundo
    }

setArmadilha :: Int -> CamboinhaDoNorte -> CamboinhaDoNorte
setArmadilha local mundo =
  CamboinhaDoNorte
    { dia = dia mundo,
      momentoDia = momentoDia mundo,
      vidaCarro = vidaCarro mundo,
      locaisArmadilha = locaisArmadilha mundo,
      locaisRobo = locaisRobo mundo,
      areas = areas mundo
    }

setLocalRobo :: Int -> CamboinhaDoNorte -> CamboinhaDoNorte
setLocalRobo local mundo =
  CamboinhaDoNorte
    { dia = dia mundo,
      momentoDia = momentoDia mundo,
      vidaCarro = vidaCarro mundo,
      locaisArmadilha = locaisArmadilha mundo,
      locaisRobo = locaisRobo mundo,
      areas = areas mundo
    }