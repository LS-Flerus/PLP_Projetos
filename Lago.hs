Lago = Local{ 
          nomeLocal = "Lago",
          inventarioLocal = [(agua, 200), (estepe,1)],
          eventosInvestigacao = [EventoInvestigacao {
                                      -- Evento de sucesso
                                requisitosInvestigacao = [varaPesca],
                                alvoInvestigacao = [estepe],
                                mensagemFalha = "O lago eh confortante, abundante em agua e brisa, um espaco de calmaria no mar de caos que se tornou sua vida. Voce passa um tempo apenas atirando pedrinhas na agua limpida, sentindo a pressao se perder em cada salto, contando as ondulaccoes e sentindo sua respiraccao estabilizar. Pensando claramente, pedacco a pedacco, sua esperancca volta. E, assim, voce nota algo no fundo, um circulo preto no fundo... serah? Estah muito profundo para nadar, mas se voce tivesse alguma coisa para alcanccar.... Na proxima vez, voce virah preparado.",
                                mensagemSucesso = "Tem um pneu no fundo do lago, mas seus bracinhos de macarrao nao tem forcca para pescah-lo. Volte sem a mochila para super-poderes de carregamento"
                                      
                }],
        eventosColeta = 
            [EventoColeta {
                    requisitosColeta = [varaPesca],
                    coletado = estepe 
                },
                EventoColeta {
                    requisitosColeta = [],
                    coletado = agua 
                },
                EventoColeta {
                    requisitosColeta = [],
                    coletado = madeira 
                } ] } 