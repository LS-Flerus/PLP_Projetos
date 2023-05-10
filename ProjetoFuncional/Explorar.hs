module Explorar where 

import Text.Printf
import Util
import Inventario
import Personagem
import Itens
import Mundo
import Locais
                    
coletarLocal' :: Status -> [Item] -> Int -> [EventoColeta] -> Status
coletarLocal' status itens idLocal (evento:tail)
  -- checarRequisito itens (requisitosColeta evento) -- 
  | False = coletarLocal' status itens idLocal tail
  | qtddItens <= 0 = coletarLocal' status itens idLocal tail
  | otherwise = do
    return coletarLocal' (addItemPersonagem (snd evento) personagem, mundo) itens idLocal tail
    
  where personagem = fst status
        mundo = snd status
        local = idLocal !! (areas mundo)
        localInventario = inventarioLocal local
        qtddItens = quantosNoInventario (coletadoItem evento) localInventario
        
        

    
