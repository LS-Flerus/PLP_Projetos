module Floresta where

import Locais
import Itens
import Inventario
import Data.List

floresta = Local { 
        nomeLocal = "floresta",
        inventarioLocal = [madeira, comida, agua],
        eventosInvestigacao = [EventoInvestigacao 
                                {requisitosInvestigacao :: [lanterna],
                                 alvoInvestigacao :: [],
                                 mensagemFalha :: selecionarMensagemFracasso inventarioLocal requisitosInvestigacao,
                                 mensagemSucesso :: "Voce esta preparado agora. Sua mao se fecha ao redor do machado, as juntas brancas com o esforcco, unhas ferindo sua propria carne. Voce encara o feixe de luz da lanterna, e encara ate deixar de tremer, ate os nervos se calarem. Você esta pronto. Voce adentra a floresta. O vento frio arrepia sua nuca, mas voce segue em frente. Os sons da solidao ecoam nessa terra sem sol, mas voce segue em frente. A paranoia cresce, e o que antes eram esquilos e micos se tornam lobos e raposas e... algo pior. Voce anda, segurando um grito na garganta. As sombras danccam ao seu redor, uma valsa lenta e tortuosa com seus maiores medos, o medo de falha, o medo do desconhecido, o medo de que esse bosque sera seu lugar final, largado pela natureza, com sua vida a centenas de quilometros de distancia. Mas você persiste, pois ha algo no fim deste caminho, a sua espera. Tao perto que da para sentir. Sentir o cheiro de vitoria. Sentir... uma respiraccao, profunda e animalesca, de um predador. Antes de entender o que esta acontecendo, voce vira com o machado em mao, uma volta rapida e violenta. Seu ataque desesperado atinge uma massa de pelos, negros como obsidiana. Um uivo animalesco corta o ceu, mas a unica coisa que voce escuta eh o grito de seus nervos: CORRA. Sem olhar para tras, sem parar, o corpo age antes da mente, a eletricidade e adrenalina lhe jogando mundo adentro, entre arvores, entre galhos que cortam seu rosto e gritos que ferem sua alma. Ja nao da para ignorar o barulho de seu perseguidor, derrubando troncos com forcca brutal, com o grunido de uma fera insandecida. Nao olhe para tras, nao olhe para tras, NAO OLHE PARA TRAS! A curiosidade vence, como sempre. So uma espiada, apenas o suficiente para ver as garras cortando seus cilios e o mundo virar de cabeça para baixo, suas costas atingirem o chao e seu corpo rolar clareira abaixo. Quando voce recupera seus sentidos, o monstro nao esta mais la. Voce esta sozinho, encarando o ceu, cambaleando ate... aquilo eh uma cabana? O sangue volta para seu rosto e, em desespero, voce quebra a porta com o machado. A cabana esta abandonada, por decadas muito provavelmente, mas, em um armario solitario, voce encontra Rebimboca da Parafuseta volta pela floresta, seguindo ate o carro, renascido com o fato de estar um passo mais perto de sair daqui."
                                ]
        
        
        eventosColeta = [EventoColeta
                         {requisitosColeta :: [machado],
                         coletado :: RebimbocadaParafuseta
        }
        


selecionarMensagemFracasso :: [Item] -> [Item] -> String
selecionarMensagemFracasso levados necessarios | length (intersect levados necessarios) == 0 = "Mensagem 0"
                                              | length (intersect levados necessarios) == 1 = "Mensagem 1"
