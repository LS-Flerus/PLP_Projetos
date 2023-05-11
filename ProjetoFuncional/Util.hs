module Util where

import Text.Printf
import Itens
import Inventario
import Personagem
import Mundo

-- STRINGS INÍCIO --
inicio = "Voce estava cansado da vida na cidade, saiu com seu carro, deu tudo errado.\n"

inicioDia :: Int -> String
inicioDia = printf "\n--- INICIO DO DIA %i --- \n"

oQueFazer = "O que deseja fazer?\n1) Usar Item\n2) Criar Item \n3) Sair em Coleta\n4) Sair em investigação\n5) Ver Inventário\n6) Ver Status\n"
escolherLocal = "Qual local deseja visitar?\n1. Base Militar\n2. Floresta \n3. Lago\n4. Montanha\n5. Vila Abandonada\n"

-- STRINGS FIM --

recebeStringValida :: [String] -> IO String 
recebeStringValida valoresValidos = do
                              putStrLn "Digite sua escolha"
                              input <- getLine
                              if input `elem` valoresValidos
                                    then return input
                                    else do
                                        putStr "Escolha invalida. " 
                                        recebeStringValida valoresValidos
