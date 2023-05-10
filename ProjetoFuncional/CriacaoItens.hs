module CriacaoItens where

import Personagem 
import Itens
import Explorar
import Text.Printf

data Receita = Receita {idReceita :: Int, itemA :: Item, itemB :: Item, resultado :: Item} deriving (Show, Read, Eq)

receitasCrafting :: [Receita] -- lista de [Item A, Item B, Item A + Item B]
receitasCrafting = 
    [
          Receita {idReceita = 2, itemA = linha, itemB = linha, resultado = varaPesca}
        , Receita {idReceita = 3, itemA = madeira, itemB = pedra, resultado = picareta}
        , Receita {idReceita = 1, itemA = linha, itemB = linha, resultado = corda}
        , Receita {idReceita = 4, itemA = madeira, itemB = pedra, resultado = machado}
    ]

receitaContem :: Int -> Item -> Receita -> Bool -- Retorna True se o item enviado é um dos ingredientes da receita (não o resultado)
receitaContem receitaId item receita = (itemA receita == item && idReceita receita == receitaId) || (itemB receita == item && idReceita receita == receitaId)

printReceitas :: [Receita] -> String
printReceitas [] = ""
printReceitas receitas = formatada ++ next
                    where receita = head receitas 
                          formatada = stringFormatadaReceita receita 
                          receitasComReducao = tail receitas
                          next = if not (null receitasComReducao) 
                                 then "\n" ++ printReceitas receitasComReducao
                                 else ""
                                    
stringFormatadaReceita :: Receita -> String
stringFormatadaReceita receita = printf "ID: %i, %s + %s = %s" (idReceita receita) (nome (itemA receita)) (nome (itemB receita)) (nome (resultado receita))  

procuraReceita :: Int -> Item -> Item -> Item
procuraReceita receitaId itemA itemB
                        | not (null receitas) = let receita = head receitas in resultado receita -- Se por alguma razão houver mais de uma receita com os dois itens, escolhemos sempre a primeira
                        | otherwise = erro
                        where receitas = [x | x <- receitasCrafting, receitaContem receitaId itemA x && receitaContem receitaId itemB x]

remocao1 :: Item -> Personagem -> Personagem
remocao1 itemA personagem = removeItemPersonagem itemA personagem

remocao2 :: Item -> Personagem -> Personagem
remocao2 itemB personagem = removeItemPersonagem itemB personagem

adicionaGerado :: Item -> Personagem -> Personagem
adicionaGerado resultado personagem = addItemPersonagem resultado personagem