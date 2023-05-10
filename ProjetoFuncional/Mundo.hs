module Mundo where

data MomentoDia = Manha | Tarde | Noite deriving (Eq, Ord, Show, Read, Bounded, Enum)

data CamboinhaDoNorte = CamboinhaDoNorte
  { dia :: Int,
    momentoDia :: MomentoDia,
    vidaCarro :: Int,
    locaisArmadilha :: [Int],
    locaisRobo :: [Bool]
  }

nextDia :: CamboinhaDoNorte -> CamboinhaDoNorte
nextDia mundo =
  CamboinhaDoNorte
    { dia = dia mundo + 1,
      momentoDia = Manha,
      vidaCarro = vidaCarro mundo,
      locaisArmadilha = locaisArmadilha mundo,
      locaisRobo = locaisRobo mundo
    }

nextMomento :: CamboinhaDoNorte -> CamboinhaDoNorte
nextMomento mundo =
  CamboinhaDoNorte
    { dia = dia mundo,
      momentoDia = succ (momentoDia mundo),
      vidaCarro = vidaCarro mundo,
      locaisArmadilha = locaisArmadilha mundo,
      locaisRobo = locaisRobo mundo
    }

setVidaCarro :: Int -> CamboinhaDoNorte -> CamboinhaDoNorte
setVidaCarro vida mundo =
  CamboinhaDoNorte
    { dia = dia mundo,
      momentoDia = momentoDia mundo,
      vidaCarro = vida,
      locaisArmadilha = locaisArmadilha mundo,
      locaisRobo = locaisRobo mundo
    }

setArmadilha :: Int -> CamboinhaDoNorte -> CamboinhaDoNorte
setArmadilha local mundo =
  CamboinhaDoNorte
    { dia = dia mundo,
      momentoDia = momentoDia mundo,
      vidaCarro = vidaCarro mundo,
      locaisArmadilha = locaisArmadilha mundo,
      locaisRobo = locaisRobo mundo
    }

setLocalRobo :: Int -> CamboinhaDoNorte -> CamboinhaDoNorte
setLocalRobo local mundo =
  CamboinhaDoNorte
    { dia = dia mundo,
      momentoDia = momentoDia mundo,
      vidaCarro = vidaCarro mundo,
      locaisArmadilha = locaisArmadilha mundo,
      locaisRobo = locaisRobo mundo
    }