module Util where

import Itens
import Inventario
import Personagem
import Mundo

data Receita = Receita {itemA :: Item, itemB :: Item, resultado :: Item} deriving (Show, Read, Eq)

type Status = (Personagem, CamboinhaDoNorte)

recebeStringValida :: [String] -> IO String 
recebeStringValida valoresValidos = do
                              putStrLn "Digite sua escolha"
                              input <- getLine
                              if input `elem` valoresValidos
                                    then return input
                                    else do
                                        putStr "Escolha invalida. " 
                                        recebeStringValida valoresValidos