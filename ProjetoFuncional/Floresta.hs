module Floresta where

import Locais
import Itens
import Inventario
import Data.List

floresta = Local{ 
        nomeLocal = "Floresta"
      , inventarioLocal = [(madeira, 200), (comida, 200), (rebimbocaDaParafuseta, 1)]
      , eventosInvestigacao = 
          [
              EventoInvestigacao 
              { -- Evento de 1/3 Sucesso
                  requisitosInvestigacao = [machado]
                  ,alvoInvestigacao = [rebimbocaDaParafuseta]
                  , mensagemFalha = "Os sons da florestas, uma cacofonia de sussuros e rosnados, lhe invadem a mente, despertam medos profundos. Sua mao se fecha, tremula na falta de uma arma para se defender"
                  , mensagemSucesso = "Os sons da florestas, uma cacofonia de sussuros e rosnados, lhe invadem a mente, despertam medos profundos. Mas sua mao se fecha no cabo do machado, pronta para se defender."               
                                    
              },
              EventoInvestigacao 
              { -- Evento de 1/3 Sucesso
                  requisitosInvestigacao = [bussola]
                  ,alvoInvestigacao = [rebimbocaDaParafuseta]
                  , mensagemFalha = "O caminho, entre sua voltas e curvas, tenta lhe sequestrar. Em alguns segundos, o norte nao passa de um palpite desesperado"
                  , mensagemSucesso = "O caminho, entre sua voltas e curvas, tenta lhe sequestrar. Mas a bussola lhe dah sabedoria"               
                                    
              },
              EventoInvestigacao 
              { -- Evento de 1/3 Sucesso
                  requisitosInvestigacao = [lanterna]
                  ,alvoInvestigacao = [rebimbocaDaParafuseta]
                  , mensagemFalha = "As arvores, altas e grossas, bloqueiam qualquer luz do ceu. Sua busca eh infrutifera"
                  , mensagemSucesso = "As arvores, altas e grossas, bloqueiam qualquer luz do ceu. Mas voce tem a lanterna para te guiar"               
                                    
              },
              EventoInvestigacao 
              { -- Evento de Sucesso
                  requisitosInvestigacao = [machado, lanterna, bussola]
                  ,alvoInvestigacao = [rebimbocaDaParafuseta]
                  , mensagemFalha = "Sua forcca esta em suas ferramente, mas nao sao suficiente desta vez. Na proxima vez, voce virah preparado."
                  , mensagemSucesso = "Voce esta preparado agora. Sua mao se fecha ao redor do machado, as juntas brancas com o esforço, unhas ferindo sua propria carne. Voce encara o feixe de luz da lanterna, e encara ate deixar de tremer, ate os nervos se calarem. Você esta pronto. Voce adentra a floresta. O vento frio arrepia sua nuca, mas voce segue em frente. Os sons da solidao ecoam nessa terra sem sol, mas voce segue em frente. A paranoia cresce, e o que antes eram esquilos e micos se tornam lobos e raposas e... algo pior. Você anda, segurando um grito na garganta. As sombras dançam ao seu redor, uma valsa lenta e tortuosa com seus maiores medos, o medo de falha, o medo do desconhecido, o medo de que esse bosque será seu lugar final, largado pela natureza, com sua vida a centenas de quilometros de distancia. Mas você persiste, pois ha algo no fim deste caminho, a sua espera. Tao perto que da para sentir. Sentir o cheiro de vitoria. Sentir... uma respiracao, profunda e animalesca, de um predador. Antes de entender o que esta acontecendo, voce vira com o machado em mao, uma volta rapida e violenta. Seu ataque desesperado atinge uma massa de pelos, negros como obsidiana. Um uivo animalesco corta o ceu, mas a unica coisa que voce escuta eh o grito de seus nervos: CORRA. Sem olhar para tras, sem parar, o corpo age antes da mente, a eletricidade e adrenalina lhe jogando mundo adentro, entre arvores, entre galhos que cortam seu rosto e gritos que ferem sua alma. Ja nao da para ignorar o barulho de seu perseguidor, derrubando troncos com força brutal, com o grunido de uma fera insandecida. Nao olhe para tras, nao olhe para tras, NAO OLHE PARA TRAS! A curiosidade vence, como sempre. So uma espiada, apenas o suficiente para ver as garras cortando seus cilios e o mundo virar de cabeça para baixo, suas costas atingirem o chao e seu corpo rolar clareira abaixo. Quando voce recupera seus sentidos, o monstro nao esta mais la. Voce esta sozinho, encarando o ceu, cambaleando ate... aquilo eh uma cabana? O sangue volta para seu rosto e, em desespero, voce quebra a porta com o machado. A cabana esta abandonada, por decadas muito provavelmente, mas, em um armario solitario, voce ve algo: a REBIMBOCA DA PARAFUSETA. Você volta pela floresta, seguindo ate o carro, renascido com o fato de estar um passo mais perto de sair daqui. Volte para coletar mais tarde"
                                    
              }
          ]
      , eventosColeta = 
        [EventoColeta {
                requisitosColeta = [],
                coletado = madeira 
            },
            EventoColeta {
                requisitosColeta = [machado],
                coletado = comida 
            },
            EventoColeta {
                requisitosColeta = [machado, lanterna, bussola],
                coletado =  rebimbocaDaParafuseta
            } ] }