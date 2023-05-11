module Menu where

import Inventario
import Itens
import Mundo
import Personagem
import Text.Printf
import Util

usarItemImpl :: Item -> Status -> Status
usarItemImpl item status 
  | item == agua = (setSede (sede mc - 25) mc, mundo)
  | item == comida = (setFome (fome mc - 25) mc, mundo)
  | item == kitMedico = (setVida (vida mc + 25) mc, mundo)
  | otherwise = (mc, setVidaCarro (vidaCarro mundo + 15) mundo) 
  where
    mc = removeItemPersonagem item (fst status)
    mundo = snd status
    
criarItemImpl :: Int -> Personagem -> Personagem
criarItemImpl n mc = mc

coletarImpl :: Status -> Int -> [Item] -> Status
coletarImpl status idLocal itens = status

investigarImpl :: Status -> Int -> [Item] -> Status
investigarImpl status idLocal itens = status

verStatus :: Status -> String
verStatus status = printf "Vida: %i%%\nFome: %i%%\nSede: %i%%\nConserto da van: %i%%" (vida personagem) (fome personagem) (sede personagem) (vidaCarro mundo)
  where
    personagem = fst status
    mundo = snd status
