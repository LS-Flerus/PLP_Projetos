import Text.Printf
import Util
import Inventario
import Personagem
import Itens
import Menu
import Mundo
import CriacaoItens

-- STRINGS INÍCIO --
inicio = "Voce estava cansado da vida na cidade, saiu com seu carro, deu tudo errado.\n"

inicioDia :: Int -> String
inicioDia = printf "\n--- INICIO DO DIA %i --- \n"

oQueFazer = "O que deseja fazer?\n1) Usar Item\n2) Criar Item \n3) Sair em Coleta\n4) Sair em investigação\n5) Ver Inventário\n6) Ver Status\n"
escolherLocal = "Qual local deseja visitar?\n1. Base Militar\n2) Floresta \n3) Lago\n4) Montanha\n5) Vila Abandonada\n"

-- STRINGS FIM --  

loopDia :: Status -> IO ()
loopDia status = do
            putStrLn (inicioDia (dia mundo))
            momentoDiaImpl status
            
            where personagem = fst status
                  mundo = snd status

momentoDiaImpl :: Status -> IO ()
momentoDiaImpl status = do
            putStrLn (diario personagem)
            putStrLn (show (momentoDia mundo) ++ "\n")
            putStrLn oQueFazer
            input <- getLine
            operacao input status
              
            where personagem = fst status
                  mundo = snd status


operacao :: String -> Status -> IO ()
operacao entrada status 
  | entrada ==  "1" = do
  putStrLn "Usar Item\n"
  usarItem status
  
  | entrada == "2" = do
  putStrLn "Criar Item\n"
  criarItem status
  
  | entrada == "3" = do
  putStrLn "Coletar\n"
  coletar status
  
  | entrada == "4" = do
  putStrLn "Investigar\n"
  investigar status
  
  | entrada == "5" = do
  putStrLn (verInventario personagem ++ "\n")
  momentoDiaImpl status
  -- Ver Status --
  | entrada == "6" = do
  putStrLn (verStatus status ++ "\n")
  momentoDiaImpl status
  -- OTHERWISE --
  | otherwise = do
  putStrLn "Comando desconhecido\n"
  momentoDiaImpl status
  
  where personagem = fst status
        mundo = snd status

-- USAR ITEM --
usarItem :: Status-> IO ()
usarItem status = do
    let inventarioConsumiveis = inventarioFiltrado Consumivel (inventario personagem)
    putStrLn (printInventario inventarioConsumiveis ++ "\n")
    print "Qual deseja usar?"
    input <- readLn :: IO Int
    if (input > length inventarioConsumiveis || input < 1)
      then 
      valorInvalido status
      else
      momentoDiaImpl ((usarItemImpl (getItem input inventarioConsumiveis) status))

      where personagem = fst status
            mundo = snd status

-- CRIAR ITEM --
criarItem :: Status -> IO ()
criarItem status = do
    putStrLn ("Receitas:\n" ++ printReceitas ++ "\n")
    let inventarioConsumiveis = inventarioFiltrado Consumivel (inventario personagem)
    putStrLn ("Inventario:\n" ++ printInventario inventarioConsumiveis ++ "\n")
    print "Qual deseja criar?"
    input <- readLn :: IO Int
    if (input > length receitasCrafting || input < 1)
      then 
        valorInvalido status
      else
        momentoDiaImpl ((criarItemImpl input personagem, mundo))
    where personagem = fst status
          mundo = snd status

-- COLETAR --
coletar :: Status -> IO ()
coletar status = do
    putStrLn escolherLocal
    inputLocal <- readLn :: IO Int
    let inventarioFerramentas = inventarioFiltrado Ferramenta (inventario personagem)
    print "Quais ferramanetas deseja levar (max 3)?"
    putStrLn (printInventario inventarioFerramentas ++ "\n")
    inputItens <- getLine
    let listaIDs = read inputItens
    let listaItens = [z |x <- inventarioFerramentas, i <- listaIDs, fst x == fst (inventarioFerramentas !! (i + 1)), let z = fst x]

    let statusII = coletarImpl inputLocal listaItens status
    if momentoDia mundo == Noite
        then 
          loopDia (fst statusII, nextDia (snd statusII))
        else
          momentoDiaImpl (fst statusII, nextMomento (snd statusII))
          
    where personagem = fst status
          mundo = snd status

-- INVESTIGAR --
investigar :: Status -> IO ()
investigar status = do

    putStrLn escolherLocal
    inputLocal <- readLn :: IO Int
    let inventarioFerramentas = inventarioFiltrado Ferramenta (inventario personagem)
    print "Quais ferramanetas deseja levar (max 5)?"
    putStrLn (printInventario inventarioFerramentas ++ "\n")
    inputItens <- getLine
    let listaIDs = read inputItens
    let listaItens = [z |x <- inventarioFerramentas, i <- listaIDs, fst x == fst (inventarioFerramentas !! (i + 1)), let z = fst x]

    let statusII = investigarImpl inputLocal listaItens status
    if momentoDia mundo == Noite
        then 
          loopDia (fst statusII, nextDia (snd statusII))
        else
          momentoDiaImpl (fst statusII, nextMomento (snd statusII))
          
    where personagem = fst status
          mundo = snd status

valorInvalido :: Status -> IO ()
valorInvalido status = do
    print "Valor Invalido"
    momentoDiaImpl status



main = do 
    putStrLn inicio
    let mc = Personagem {vida = 100, fome = 0, sede = 0, inventario = [(agua, 2), (comida, 1), (faca, 1)], diario = ""}
    let mundo = CamboinhaDoNorte {dia = 1, momentoDia = Manha, vidaCarro = 0, locaisArmadilha = [0,0,0,0,0], locaisRobo =       
    [False,False,False,False,False]}
    let status = (mc, mundo)
    putStrLn "Start\n"
    loopDia status