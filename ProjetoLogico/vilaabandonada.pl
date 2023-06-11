vilaabandonada(Local) :- 
    Nome = 'VILA ABANDONADA', 
    Inventario = % [(kitMedico, 7), (comida, 10), (combustivel, 1)]
        [[3, 7], [2, 10], [5, 1]], 
    EventosColeta = 
               [
                [[], 3],
                [[], 2],
                [[], 5]
               ],
    EventosInvestigacao = 
                         [
                            [
                                [],
                                5,
                                'Voce encontra uma vila abandonada, uma cidade fantasma. As casas foram abandonadas as pressas, comida largada (comida que voce pode aproveitar), lares partidos.... talvez a farmacia ainda tenha alguns kits de primeiros socorros.',
                                'Hoje voce resolve ir atras do posto de gasolina. Uma contruccao triste, isolada, com quase nada de util.... Quase. Ainda hah alguns litros de gasolina esperando para serem usados. Volte mais tarde para coletar.'
                            ]
                         ],
    Local = [Nome, Inventario, EventosColeta, EventosInvestigacao].