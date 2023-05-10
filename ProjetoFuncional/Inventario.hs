module Inventario where

import Itens
import Text.Printf

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

getItem :: Int -> Inventario -> Item
getItem i [] = erro
getItem 1 (head:tail) = fst head
getItem i (head:tail) = getItem (i - 1) tail
