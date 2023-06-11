montanha(Local) :- 
    Nome = 'MONTANHA', 
    Inventario = % [(pedra, 200), (bussola, 1)]
        [[10, 200], [14, 1]], 
    EventosColeta = 
               [
                [[], 10],
                [[19, 16], 14]
               ],
    EventosInvestigacao = 
                         [
                            [
                                [19, 16],
                                14,
                                'A montanha lhe chama, e voce ignora. Nao hah como enfrentar a altura desafiadora ou a dureza das pedras em seu estado atual. Na proxima vez, voce virah preparado.',
                                'Escalar uma montanha com uma picareta nao foi tao simples quanto voce tinha imaginado, mas voce faz funcionar. Com esforco e dedicaccao, sua picareta de pedra desfaz o buraco com preciccao. Dentro, na caverna, voce encontra os resquicios de um acampamento, a muito tempo abandonado. Porem, antes que voce consiga investigar, um ruido metalico se aproxima. Voce guarda suas coisas rapidamente e corre, sem querer correr mais riscos. Na proxima vez, venha com menos coisas para COLETAR mais rapidamente.'
                            ],
                            [
                                [19],
                                14,
                                'Boa sorte quebrando rocha solida com a mao. Aqui não eh Minecraft.',
                                'Boa sorte escalando uma montanha sem uma corda. Aqui nao eh Celeste.'
                            ],
                            [
                                [16],
                                7,
                                'Boa sorte escalando uma montanha sem uma corda. Aqui nao eh Celeste.',
                                'Voce fez algumas aulas de alpinismo no ensino medio, apenas o suficiente para lembrar o basico. Por isso, usando sua corda, algumas pedras e sua copia de bolso do livro ''como fazer um gancho de alpinismo improvisado usando apenas uma corda, algumas pedras e um livro de bolso'', voce faz um gancho de alpinismo improvisado. Voce escala ateh onde pode, quando o ar rarefeito queima seus pulmoes, e se depara com uma grande pedra, tapando uma caverna misteriosa.'
                            ]
                         ],
    Local = [Nome, Inventario, EventosColeta, EventosInvestigacao].