module VilaAbandonada where
import Locais
import Itens
import Inventario

vilaAbandonada = Local{ 
       nomeLocal = "Vila Abandonada",
          inventarioLocal = [(kitMedico, 7), (comida, 10), (combustivel, 1)],
          eventosInvestigacao = [EventoInvestigacao {
                                      -- Evento de sucesso
                                requisitosInvestigacao = [],
                                alvoInvestigacao = [combustivel],
                                mensagemFalha = "Voce encontra uma vila abandonada, uma cidade fantasma. As casas foram abandonadas as pressas, comida largada (comida que voce pode aproveitar), lares partidos.... talvez a farmacia ainda tenha alguns kits de primeiros socorros",
                                mensagemSucesso = "Hoje voce resolve ir atras do posto de gasolina. Uma contruccao triste, isolada, com quase nada de util.... Quase. Ainda hah alguns litros de gasolina esperando para serem usados. Volte mais tarde para coletar."
                                      
                }],
        eventosColeta = 
            [EventoColeta {
                    requisitosColeta = [],
                    coletado = kitMedico 
                },
                EventoColeta {
                    requisitosColeta = [],
                    coletado = comida 
                },
                EventoColeta {
                    requisitosColeta = [],
                    coletado = combustivel 
                } ] }
