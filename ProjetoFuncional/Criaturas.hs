module Criaturas where

import Inventario
import Itens
import Mundo
import Personagem
import Text.Printf
import Util
import Mundo (setArmadilha)

-- Besta Implementacao
ataqueBesta :: Status -> [Item] -> Status
ataqueBesta status itens
    | elem counterBesta itens = (setDiario (mensagemEscape) personagem, mundo) 
    | otherwise = (setVida (life - 25) personagemEscreverDiario, mundo)
    where personagem = fst status
          life = vida personagem
          mundo = snd status
          mensagemAtaque = diario personagem ++ "Voce foi atacado pela Besta\n"
          mensagemEscape = mensagemAtaque ++ "Mas conseguiu evita-la\n"
          personagemEscreverDiario = setDiario mensagemAtaque personagem

encontroBesta :: Status -> Int -> Bool
encontroBesta status idLocal 
    | mod day 3 == 0 && momento == Manha && idLocal == 2 = True
    | mod day 2 == 0 && momento == Manha && idLocal == 3 = True
    | mod day 1 == 0 && momento == Manha && idLocal == 4 = True
    | mod day 2 == 0 && momento == Tarde && idLocal == 3 = True
    | mod day 1 == 0 && momento == Tarde && idLocal == 4 = True
    | momento == Noite && idLocal == 2 = True
    | otherwise = False
    where mundo = snd status
          day = dia mundo
          momento = momentoDia mundo

-- Perseguidor Implementacao
cairArmadilha :: Status -> [Item] -> Status
cairArmadilha status itens
    | elem counterArmadilha itens = (setDiario (mensagemEscape) personagem, mundoLivre) 
    | otherwise = (setVida (life - 25) personagemEscreverDiario, mundoLivre)
    where personagem = fst status
          life = vida personagem
          mundo = snd status
          mundoLivre = setArmadilha [Nenhuma, Nenhuma, Nenhuma, Nenhuma, Nenhuma] mundo
          mensagemAtaque = diario personagem ++ "Voce caiu numa armadilha\n"
          mensagemEscape = mensagemAtaque ++ "Mas conseguiu evita-la\n"
          personagemEscreverDiario = setDiario mensagemAtaque personagem

encontroArmadilha :: Status -> Int -> Bool
encontroArmadilha status idLocal = (armadilhas !! (idLocal - 1)) == Armada
    where mundo = snd status
          armadilhas = locaisArmadilha mundo

espantarPerseguidor :: Status -> Status
espantarPerseguidor status = (personagemEscreverDiario, mundoLivre)
    where personagem = fst status
          mensagem = diario personagem ++ "Seu Perseguidor estava colocando armadilhas\nVoce o espantou\n"
          personagemEscreverDiario = setDiario mensagem personagem
          mundo = snd status
          mundoLivre = setArmadilha [Nenhuma, Nenhuma, Nenhuma, Nenhuma, Nenhuma] mundo

encontroPerseguidor :: Status -> Int -> Bool
encontroPerseguidor status idLocal = armadilhas !! (idLocal - 1) == Armando
    where mundo = snd status
          armadilhas = locaisArmadilha mundo

atualizarArmadilha :: Status -> Int -> Status
atualizarArmadilha status idLocal 
    | elem Armada armadilhas = status
    | elem Armando armadilhas = (personagem, setArmadilha (armarArmadilha armadilhas) mundo)
    | otherwise = (personagem, setArmadilha armando mundo)
    where personagem = fst status
          mundo = snd status 
          armadilhas = locaisArmadilha mundo
          armando = (take (idLocal-1) armadilhas) ++ [Armando] ++ (drop idLocal armadilhas)

armarArmadilha :: [StatusArmadilha] -> [StatusArmadilha]
armarArmadilha [] = []
armarArmadilha (head:tail) = if head == Armando 
                                then (Armada:tail)
                                else (head:armarArmadilha tail)

-- Robo Implementacao
ataqueRoboBaseMilitar :: Status -> [Item] -> Status
ataqueRoboBaseMilitar status itens
    | elem counterRobo itens = (setDiario (mensagemEscape) personagem, mundo) 
    | otherwise = (setVida (life - 25) personagemEscreverDiario, mundo)
    where personagem = fst status
          life = vida personagem
          mundo = snd status
          mensagemAtaque = diario personagem ++ "Voce foi atacado pelo Robo\n"
          mensagemEscape = mensagemAtaque ++ "Mas conseguiu evita-lo\n"
          personagemEscreverDiario = setDiario mensagemAtaque personagem

encontroRoboBaseMilitar :: Status -> Int -> Bool
encontroRoboBaseMilitar status idLocal = (not (mod day 2 == 0)) && (idLocal == 1)
    where mundo = snd status
          day = dia mundo
