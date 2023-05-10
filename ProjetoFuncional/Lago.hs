import Locais
import Itens
import Inventario

lago = Local{ 
          nomeLocal = "Lago"
        , inventarioLocal = listaParaInventario [pedra, pedra, madeira, comida, agua, agua]
        , eventosInvestigacao = 
            [
                EventoInvestigacao 
                { -- a mensagem do deus das frutas tropicais
                    requisitosInvestigacao = [lanterna]
                    , mensagemFalha = "Ha um lugar mais escuro do que todos os outros nesse lago:\
                                      \ uma arvore morta, de tronco oco. Ha um buraco na base,\
                                      \ onde você poderia enfiar o braco para procurar itens. Dá para ouvir alguma coisa\
                                      \ se mexendo lá dentro.\nVoce julga melhor voltar aqui com uma lanterna,\ 
                                      \ ate para poder driblar a ira do que for que esta morando la."

                    , mensagemSucesso = "De lanterna em maos, voce vai direto\
                      \ para o tronco oco do lago. 'Que se exploda o que estiver la dentro,' voce pensa.\
                      \ Com um tiquinho assim de apreensao, voce se deita e aponta a lanterna para dentro do buraco...\n\n\ 
                      \Nada. Nada vivo, ao menos: da para ver uns restos gelatinosos que foram comida de algum bicho pequeno e nojento.\
                      \ La dentro, depois dos restos gosmentos, um papel:\n\n''''Nao temos coqueiro por aqui, mas a ajuda esta num coco.\n\
                      \    O coco eh seu amigo, mas ele eh dificil de achar.\n\
                      \    Ele nao tem >>>FACA<<< para se soltar das vinhas\n\
                      \    Muito menos uma >>>LANTERNA<<< para ver entre as linhas''''\n\n\
                      \Voce nao entende essa mensagem, mesmo com as letras maisculas garrafais e os sinais para duas palavras especificas.\
                      \ De qualquer forma, eh bom saber que alguem se importa com voce no meio desse nada: o deus das frutas tropicais esta do seu lado."
                                      
                },
                EventoInvestigacao 
                { -- a mensagem do deus das frutas tropicais
                    requisitosInvestigacao = [faca]
                    , mensagemFalha = "Num surto de sorte, voce acha uma canoa de pesca.\
                                      \uSonhos de fuga passam pela sua cabeca, ate voce lembrar que isso eh um lago: o maximo que voce pode fazer eh dar um passeio e voltar.\
                                      \Mas algo te diz que ha segredos dentro desse lago, entao por que nao?\
                                      \ Voce ate tenta embarcar na canoa, mas um detalhe tinha passado despercebido ate entao:\n\
                                      \ A canoa esta presa ao pier com uma corda. Uma corda muito forte, do tipo que so uma Faca poderia cortar."

                    , mensagemSucesso = "Voce, com sua faca em maos, anda ate o pier do lago, onde uma corda forte prende a canoa.\
                      \ Voce desce a faca uma, duas, tres vezes e a corda se parte sem fazer um som.\
                      \ Com a canoa solta e nada pra te impedir, voce embarca na sua aventura de exploracao do pequeno corpo de agua.\n\
                      \ Voce procura um pouco e nada. Voce procura com mais vigor e ainda nada. Em um momento que voce se permite olhar (derrotado) para baixo, uma surpresa:\n\
                      \ Algo circular, com um aro metalico, refletindo luz, bem no fundo do lago.\
                      \ Esta fundo, mas nao fundo o suficiente que uma Vara de Pesca nao seja capaz de alcancar"
                                      
                },
                EventoInvestigacao 
                { -- um quartinho de ferramentas na beira do lago, com a porta emperrada
                    requisitosInvestigacao = [] -- nao precisa de nenhum item 
                    , mensagemFalha = ""

                    , mensagemSucesso = "Ha um pequeno galpao de ferramentas meio distante.\
                                      \ Com toda a coragem e disposicao de quem quer sobreviver, voce anda sobre pedras e uma garrafa de vidro quebrada para chegar a porta do puxadinho.\
                                      \ Alguma coisa (o vento, talvez?) fez o teto desabar, destruindo tudo e bloqueando a porta, deixando-a com um rombo.\n\
                                      \ Pelo buraco da porta, voce ve tudo destruido, exceto por um unico chapeu de operario, que pousou no topo das prateleiras caídas.\n\
                                      \ Imagine o nivel de protecao cranial que esse capacete ira lhe prover, meu amigo. Uma pena que a porta nao mexe um centimetro gracas aos escombros.\n\
                                      \ Talvez com um Machado voce conseguisse quebrar a porta e adquirir uma cobertura para o cranio."
                                      
                }
            ]
        , eventosColeta = 
            [
                EventoColeta 
                {
                      requisitosColeta = [lanterna, faca] -- o tal do coco da mensagem acima
                    , coletado = [corda, isqueiro] 
                },
                EventoColeta 
                {
                      requisitosColeta = [varaPesca] -- tem um pneu velho jogado dentro do lago
                    , coletado = [estepe] 
                },
                EventoColeta 
                {
                      requisitosColeta = [machado] -- o chapeu de Operario dentro de um pequeno galpao de ferramentas
                    , coletado = [chapeuOperario] 
                }
            ]
                   }