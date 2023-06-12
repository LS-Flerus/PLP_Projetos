basemilitar(Local) :- 
    Nome = 'BASE MILITAR', 
    Inventario = % [(linha, 200), (bateriaCarro,1), (lanterna, 10)],
        [(11, 200), (6, 1), (13, 1)], 
    EventosColeta = [[[], 11],[[], 13],[[13], 6]],
    EventosInvestigacao = 
                         [
                            [
                                [13],
                                6,
                                'Voce toma coragem para entrar na base militar, mas estah escuro dentro e voce tem medo do escuro. Uma pena mesmo',
                                'Voce entra na base militar. Tem um robo lah, dancando a macarena. Ele diz que lhe da uma bateria de carro se voce for coletar depois.'
                            ]
                         ],
    Local = [Nome, Inventario, EventosColeta, EventosInvestigacao].