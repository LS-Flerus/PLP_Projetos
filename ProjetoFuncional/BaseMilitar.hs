module BaseMilitar where

import Locais
import Itens
import Inventario

baseMilitar = Local{ 
          nomeLocal = "BaseMilitar",
          inventarioLocal = [(linha, 200), (bateriaCarro,1), (lanterna, 10)],
          eventosInvestigacao = [EventoInvestigacao {
                                      -- Evento de sucesso
                                requisitosInvestigacao = [lanterna],
                                alvoInvestigacao = [bateriaCarro],
                                mensagemFalha = "Voce toma coragem para entrar na base militar, mas estah escuro dentro e voce tem medo do escuro. Uma pena mesmo",
                                mensagemSucesso = "Voce entra na base militar. Tem um robo lah, dancando a macarena. Ele diz que lhe da uma bateria de carro se você for coletar depois."
                                      
                }],
        eventosColeta = 
            [EventoColeta {
                    requisitosColeta = [],
                    coletado = lanterna 
                },
                EventoColeta {
                    requisitosColeta = [],
                    coletado = linha 
                },
                EventoColeta {
                    requisitosColeta = [lanterna],
                    coletado = bateriaCarro 
               }]}
