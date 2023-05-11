import Text.Printf
import Util
import Inventario
import Personagem
import Itens
import Menu
import Mundo
import CriacaoItens 
import BaseMilitar
import Floresta
import Lago
import Montanha
import VilaAbandonada

loopDia :: Status -> IO ()
loopDia status = do
            let personagemDiarioResetado = setDiario "" personagem
            putStrLn (inicioDia (dia mundo))
            momentoDiaImpl status
            
            where personagem = fst status
                  mundo = snd status

momentoDiaImpl :: Status -> IO ()
momentoDiaImpl status = if (checaSeFimDeJogo status) /= "" then do
                          printf "%s Aperte enter para fechar o programa." (checaSeFimDeJogo status)
                          input <- getLine
                          print("")
                        else
                            do
                              let personagemDiarioResetado = setDiario "" personagem
                              putStrLn (show (momentoDia mundo) ++ "\n")
                              putStrLn oQueFazer
                              input <- getLine
                              operacao input (personagemDiarioResetado, mundo)
                            
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
      momentoDiaImpl (usarItemImpl (fst (inventarioConsumiveis !! (input - 1))) status)

      where personagem = fst status
            mundo = snd status

-- CRIAR ITEM --
criarItem :: Status -> IO ()
criarItem status = do
    putStrLn ("Receitas:\n" ++ printReceitas receitasCrafting ++ "\n")
    let inventarioMateriais = inventarioFiltrado Material (inventario personagem)
    putStrLn ("Inventario:\n" ++ printInventario inventarioMateriais ++ "\n")
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
    print "Quais ferramentas deseja levar? (max 2. Digite [Int] ou [] para nao levar nada.)"
    putStrLn (printInventario inventarioFerramentas ++ "\n")
    inputItens <- getLine
    let listaIDs = read inputItens
    let listaItens = [fst x |x <- inventarioFerramentas, i <- listaIDs, fst x == fst (inventarioFerramentas !! (i - 1))]

    let statusII = coletarImpl status inputLocal listaItens
    putStrLn (diario (fst statusII))
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
    print "Quais ferramentas deseja levar? (max 5. Digite [Int] ou [] para nao levar nada.)"
    putStrLn (printInventario inventarioFerramentas ++ "\n")
    inputItens <- getLine
    let listaIDs = read inputItens
    let listaItens = [fst x |x <- inventarioFerramentas, i <- listaIDs, fst x == fst (inventarioFerramentas !! (i - 1))]

    let statusII = investigarImpl status inputLocal listaItens
    putStrLn (diario (fst statusII))
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



main :: IO ()
main = do 
    putStrLn inicio
    let mc = Personagem {vida = 100, fome = 0, sede = 0, inventario = [(agua, 2), (comida, 1), (faca, 1)], diario = ""}
    let mundo = CamboinhaDoNorte {dia = 1, 
                                  momentoDia = Manha, 
                                  vidaCarro = 0, locaisArmadilha = [Nenhuma, Nenhuma, Nenhuma, Nenhuma, Nenhuma], 
                                  locaisRobo = [False,False,False,False,False],
                                  areas = [baseMilitar, floresta, lago, montanha, vilaAbandonada]
                                  }
    let status = (mc, mundo)
    putStrLn "Start\n"
    loopDia status
