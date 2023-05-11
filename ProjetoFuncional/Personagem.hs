module Personagem where

import Inventario 
import Itens
import Text.Printf

data Personagem = Personagem { vida :: Int, 
                               fome :: Int,
                               sede :: Int, 
                               inventario :: Inventario,
                               diario :: String   -- String do evento que acabou de acontecer
                               } deriving (Show)

addItemPersonagem :: Item -> Personagem -> Personagem
addItemPersonagem item personagem = Personagem {vida = vida personagem, fome = fome personagem, sede = sede personagem, 
                                                inventario = addItemInventario item (inventario personagem), diario = diario personagem}

addItensPersonagem :: [Item] -> Personagem -> Personagem
addItensPersonagem itens personagem = Personagem {vida = vida personagem, fome = fome personagem, sede = sede personagem, 
                                                inventario = addItensInventario itens (inventario personagem), diario = diario personagem}

removeItemPersonagem :: Item -> Personagem -> Personagem
removeItemPersonagem item personagem = Personagem {vida = vida personagem, fome = fome personagem, sede = sede personagem, 
                                                inventario = removeItemInventario item (inventario personagem), diario = diario personagem}

quantosNoPersonagem :: Item -> Personagem -> Int
quantosNoPersonagem item personagem = quantosNoInventario item (inventario personagem)

inventarioDeUmTipo :: TipoItem -> Personagem -> Inventario
inventarioDeUmTipo tipo personagem = [x | x <- inventario personagem, let item = fst x in tipoItem item == tipo]

verInventario :: Personagem -> String
verInventario personagem = printf "Seu inventario: \n%s" (printInventario (inventario personagem))

setVida :: Int -> Personagem -> Personagem
setVida valor personagem
  | valor < 0 = Personagem {vida = 0, fome = fome personagem, sede = sede personagem, 
                              inventario = inventario personagem, diario = diario personagem }
  | valor > 100 = Personagem {vida = 100, fome = fome personagem, sede = sede personagem, 
                              inventario = inventario personagem, diario = diario personagem }
  | otherwise = Personagem {vida = valor, fome = fome personagem, sede = sede personagem, 
                              inventario = inventario personagem, diario = diario personagem }


setFome :: Int -> Personagem -> Personagem
setFome valor personagem
  | valor < 0 = Personagem {vida = vida personagem, fome = 0, sede = sede personagem, 
                              inventario = inventario personagem, diario = diario personagem }
  | valor > 100 = Personagem {vida = vida personagem, fome = 100, sede = sede personagem, 
                              inventario = inventario personagem, diario = diario personagem }
  | otherwise = Personagem {vida = vida personagem, fome = valor, sede = sede personagem, 
                              inventario = inventario personagem, diario = diario personagem }

setSede :: Int -> Personagem -> Personagem
setSede valor personagem
  | valor < 0 = Personagem {vida = vida personagem, fome = fome personagem, sede = 0, 
                              inventario = inventario personagem, diario = diario personagem }
  | valor > 100 = Personagem {vida = vida personagem, fome = fome personagem, sede = 100, 
                              inventario = inventario personagem, diario = diario personagem }
  | otherwise = Personagem {vida = vida personagem, fome = fome personagem, sede = valor, 
                              inventario = inventario personagem, diario = diario personagem }

setDiario:: String -> Personagem -> Personagem
setDiario texto personagem = Personagem {vida = vida personagem, fome = fome personagem, sede = sede personagem, 
                               inventario = inventario personagem, diario = texto }
                              