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

addItensInventario :: [Item] -> Inventario -> Inventario
addItensInventario [] inventario = inventario
addItensInventario (head:tail) inventario = addItensInventario tail (addItemInventario head inventario)

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

removeItensInventario :: [Item] -> Inventario -> Inventario
removeItensInventario [] inventario = inventario
removeItensInventario (head:tail) inventario = removeItensInventario tail (removeItemInventario head inventario)

removeTodosItemInventario :: Item -> Inventario -> Inventario
removeTodosItemInventario _ [] = []
removeTodosItemInventario item (head:tail) = if itemTupla == item
                                        then 
                                            (item, novaQuantidade) : tail
                                        else head : removeItemInventario item tail
                                where itemTupla = fst head
                                      novaQuantidade = 0

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




listaItensEstaContida :: [Item] -> [Item] -> Bool
listaItensEstaContida listaContida listaContem = listaItensEstaContida' (sortOn nome listaContida) (sortOn nome listaContem)

inventarioParaLista :: Inventario -> [Item]
inventarioParaLista inventario = sortOn nome (inventarioParaLista' inventario [])

listaParaInventario :: [Item] -> Inventario
listaParaInventario lista = listaParaInventario' lista []

adicionaDoisInventarios :: Inventario -> Inventario -> Inventario
adicionaDoisInventarios [] inventario = inventario
adicionaDoisInventarios inventarioA inventarioB = adicionaDoisInventarios inventarioARemovido inventarioBAdicionado
                                          where itemAtual = fst (head inventarioA)
                                                inventarioARemovido = removeItemInventario itemAtual inventarioA
                                                inventarioBAdicionado = addItemInventario itemAtual inventarioB

inventarioEstaContido :: Inventario -> Inventario -> Bool
inventarioEstaContido inventarioContido inventarioContem = listaItensEstaContida (inventarioParaLista inventarioContido) (inventarioParaLista inventarioContem)

listaItensEstaContida' :: [Item] -> [Item] -> Bool -- listaA -> listaB -> True se listaA está contida completamente em listaB, incluindo repetições.
listaItensEstaContida' [] [] = True
listaItensEstaContida' [] listaContem = True 
listaItensEstaContida' listaContida [] = False
listaItensEstaContida' listaContida listaContem
                                                | itemA == itemB = listaItensEstaContida' (tail listaContida) (tail listaContem)
                                                | otherwise = listaItensEstaContida' listaContida (tail listaContem)
                                                where itemA = head listaContida
                                                      itemB = head listaContem

inventarioParaLista' :: Inventario -> [Item] -> [Item]
inventarioParaLista' [] _ = []
inventarioParaLista' inventario lista = inventarioParaLista' inventarioComRemocao listaAtualizada
                                    where itemAtual = fst (head inventario)
                                          listaAtualizada = lista ++ [itemAtual]
                                          inventarioComRemocao = removeItemInventario itemAtual inventario


listaParaInventario' :: [Item] -> Inventario -> Inventario
listaParaInventario' [] inventario = inventario
listaParaInventario' lista inventario = listaParaInventario' listaComRemocao inventarioAdicionado
                              where listaComRemocao = tail lista
                                    itemAtual = head lista
                                    inventarioAdicionado = addItemInventario itemAtual inventario 


