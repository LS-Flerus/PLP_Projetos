import Locais
import Itens
import Inventario

lago = Local{ 
          nomeLocal = "Lago"
        , inventarioLocal = listaParaInventario [pedra, pedra, madeira, combustivel, comida, agua, agua]
        , eventosInvestigacao = 
            [
                EventoInvestigacao 
                {
                    requisitosInvestigacao = [lanterna]
                    , mensagemFalha = "Ha um lugar mais escuro do que todos os outros nesse lago:  \
                                      \uma arvore morta, de tronco oco. Ha um buraco na base, \
                                      \onde você poderia enfiar o braco para procurar itens. Dá para ouvir alguma coisa\
                                      \se mexendo lá dentro. \nVoce julga melhor voltar aqui com uma lanterna,\ 
                                      \ ate para poder driblar a ira do que for que esta la dentro."

                    , mensagemSucesso = "De lanterna em maos, voce vai direto\
                      \ para o tronco oco do lago. 'Que se exploda o que estiver la dentro,' voce pensa.\
                      \ Com um tiquinho assim de apreensao, voce se deita e aponta a lanterna para dentro do buraco...\n\n\ 
                      \Nada. Nada vivo, ao menos: da para ver uns restos gelatinosos que foram comida de algum bicho pequeno e nojento.\
                      \ La dentro, depois dos restos gosmentos, um papel:\n\n''''Nao temos coqueiro por aqui, mas a ajuda esta num coco.\n\
                      \    O coco eh seu amigo, mas ele eh dificil de achar.\n\
                      \    Ele nao tem >>>FACA<<< para se soltar das vinhas\n\
                      \    Muito menos uma >>>LANTERNA<<< para ver entre as linhas''''\n\n\
                      \Voce nao entende essa mensagem, mesmo com as letras maisculas garrafais e os sinais para duas palavras especificas.\
                      \ De qualquer forma, eh bom saber que alguem se importa com voce no meio desse nada."
                                      
                }
            ]
        , eventosColeta = 
            [
                EventoColeta 
                {
                      requisitosColeta = [lanterna, faca] -- o tal do coco da mensagem acima
                    , coletado = [corda, isqueiro] 
                }
            ]
                   }