module Montanha where 
 import Locais 
 import Itens 
 import Inventario 
  
 montanha = Local{  
           nomeLocal = "Montanha" 
         , inventarioLocal = listaParaInventario [comida, carvao] 
         , eventosInvestigacao =  
             [ 
                 EventoInvestigacao  
                 { -- Paredão com ovos de pássaro 
                     requisitosInvestigacao = [agua] 
                     ,alvoInvestigacao = [comida] 
                     ,mensagemFalha = " Após caminhar pelo terreno rochoso e inclinado, e subir a montanha, você está suado e desidratado. Ofegante, você lamenta ter suspendido seus treinos na academia. Após passar a mão no rosto e tirar o suor que cobre os seus olhos, e escorre até a sua camisa. Se você não estivesse tão desidratado, poderia explorar um pouco mais a área e procurar por recursos por recursos, mas você não um réptil resistente ao calor, você é um ser humano que transpira. Você decide voltar em outro momento mais preparado."
  
                     , mensagemSucesso = "Após subir a montanha novamente, você está suado e ofegante. Você deixa sua bolsa cair no chão, se senta, pega sua garrafa de água, tira a tampa, e bebe desesperadamente, enquanto o vento sopra e seca sua camisa suada. Você se sente refrescado. Ao recuperar o fôlego, você começa a andar pela área e fica impressionado com as formações rochosas, em especial, um paredão. Abrigado em uma cavidade contra o vento e a chuva, você localiza nele um ninho de ovos, que aparentam ser muito saborosos. Mas o ninho é muito frágil para ser carregado e você não trouxe nada para guardá-los e levá-los contigo. Há alguma ferramenta no acampamento que você pode usar para coleta? Você pensa sobre isso enquanto caminha de volta."
                                       
                 }, 
                 EventoInvestigacao  
                 { -- a mensagem do deus das frutas tropicais 
                     requisitosInvestigacao = [agua, lanterna] 
                     , alvoInvestigacao = [carvao] 
                     , mensagemFalha = "Andando pela montanha, você sente-se tonto por causa da sede, e avista uma entrada descendente na área, de algo que parece ser uma caverna. Você se aproxima do local, e para estimar o seu tamanho, você grita 'Sozinho ou Pior'. 3 segundos depois , você escuta o eco reverberando lá dentro: 'sozinho ou pior, sozinho ou pior, sozinho ou…' e conclui que a caverna é grande. Mas você está com sede e não possui nenhuma lanterna nas suas mãos. É muito arriscado entrar lá agora, você pode se perder no escuro e morrer de sede lá dentro. É melhor voltar ao acampamento e trazer água para viagem e uma lanterna." 
  
                     , mensagemSucesso = "Ao voltar para entrada da caverna, você se hidrata e recupera o fôlego após uma longa caminhada. Você entra e acende a lanterna. Você fica encantado com a cena que vislumbra em seguida: Um enorme depósito de carvão mineral. O carvão mineral é encontrado em 4 formas na natureza, por ordem de aumento de teor de carbono: turfa, hulha, linhito e antracito. A julgar pela cor, você conclui que é antracito e pensa em vender, mas sua prioridade agora não é ganhar dinheiro, é sobreviver, e com essas pedras inflamáveis em mãos , você poderá esquentar algo para comer hoje. Você decide voltar para o acampamento e pegar uma ferramenta para quebrar essas pedras, e uma bolsa para carregar."
                                        
                 } 
             
             ] 
         , eventosColeta =  
             [ 
                 EventoColeta  
                 { 
                       requisitosColeta = [agua, bolsa] 
                     , coletado = comida
 
                 }, 
                 EventoColeta  
                 { 
                       requisitosColeta = [mochila, picareta, agua]
                     , coletado = carvao
 
                 }  
             ] 
                    }