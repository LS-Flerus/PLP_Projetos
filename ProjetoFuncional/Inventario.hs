module Inventario where

import Itens
import Text.Printf
import Data.List (sortOn)

type Inventario = [(Item, Int)] -- [(Item, Número de items no inventário)]

addItemInventario :: Item -> Inventario -> Inventario
addItemInventario item [] = [(item, 1)]
addItemInventario item (head:tail) = if itemTupla == item
                                        then (item, novaQuantidade) : tail
                                        else head : addItemInventario item tail
                                    where itemTupla = fst head
                                          quantidadeTupla = snd head
                                          novaQuantidade = quantidadeTupla + 1

removeItemInventario :: Item -> Inventario -> Inventario
removeItemInventario _ [] = []
removeItemInventario item (head:tail) = if itemTupla == item
                                        then 
                                            if novaQuantidade <= 0 
                                            then tail 
                                            else (item, novaQuantidade) : tail
                                        else head : removeItemInventario item tail
                                where itemTupla = fst head
                                      quantidadeTupla = snd head
                                      novaQuantidade = quantidadeTupla - 1

quantosNoInventario :: Item -> Inventario -> Int
quantosNoInventario _ [] = 0
quantosNoInventario item (head:tail) = if itemTupla == item
                                       then quantidadeTupla 
                                       else quantosNoInventario item tail
                                where itemTupla = fst head
                                      quantidadeTupla = snd head

inventarioFiltrado :: TipoItem -> Inventario -> Inventario
inventarioFiltrado _ [] = []
inventarioFiltrado tipo inventario = [x | x <- inventario, let item = fst x in tipoItem item == tipo] 

printInventario :: Inventario -> String
printInventario inventario = printInventario' inventario 1

printInventario' :: Inventario -> Int -> String
printInventario' [] _ = ""
printInventario' (head:tail) indice = printf "%i. %s %i. %s" indice (nome item) (snd head) prox
                                where item = fst head
                                      prox = if not (null tail)
                                                then "\n" ++ printInventario' tail (indice+1)
                                                else "" 

listaItensContemTodos' :: [Item] -> [Item] -> Bool -- listaA -> listaB -> True se listaA está contida completamente em listaB, incluindo repetições.
listaItensContemTodos' [] [] = True
listaItensContemTodos' [] listaContem = True 
listaItensContemTodos' listaContida [] = False
listaItensContemTodos' listaContida listaContem
                                                | itemA == itemB = listaItensContemTodos' (tail listaContida) (tail listaContem)
                                                | otherwise = listaItensContemTodos' listaContida (tail listaContem)
                                                where itemA = head listaContida
                                                      itemB = head listaContem


listaItensContemTodos :: [Item] -> [Item] -> Bool
listaItensContemTodos listaContida listaContem = listaItensContemTodos' (sortOn nome listaContida) (sortOn nome listaContem)
                                          


{--
getItem :: Int -> Inventario -> Item
getItem i [] = erro
getItem 1 (head:tail) = fst head
getItem i (head:tail) = getItem (i - 1) tail
--}

