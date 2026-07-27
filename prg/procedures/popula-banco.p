/* Carga inicial de dados para testar o sistema da videolocadora. */

DEFINE VARIABLE iCidadeJoinville AS INT64 NO-UNDO.
DEFINE VARIABLE iCidadeFlorianopolis AS INT64 NO-UNDO.
DEFINE VARIABLE iCidadeBlumenau AS INT64 NO-UNDO.
DEFINE VARIABLE iClienteAna AS INTEGER NO-UNDO.
DEFINE VARIABLE iClienteBruno AS INTEGER NO-UNDO.
DEFINE VARIABLE iClienteCarla AS INTEGER NO-UNDO.
DEFINE VARIABLE iFilmeMatrix AS INTEGER NO-UNDO.
DEFINE VARIABLE iFilmeInterestelar AS INTEGER NO-UNDO.
DEFINE VARIABLE iFilmeCentral AS INTEGER NO-UNDO.
DEFINE VARIABLE iAluguel AS INTEGER NO-UNDO.
DEFINE VARIABLE iCont AS INTEGER NO-UNDO.
DEFINE VARIABLE iCidadeCarga AS INT64 NO-UNDO.
DEFINE VARIABLE iClienteCarga AS INTEGER NO-UNDO.
DEFINE VARIABLE iFilmeCarga AS INTEGER NO-UNDO.
DEFINE VARIABLE cCidade AS CHARACTER NO-UNDO.
DEFINE VARIABLE cUF AS CHARACTER NO-UNDO.
DEFINE VARIABLE cCliente AS CHARACTER NO-UNDO.
DEFINE VARIABLE cEndereco AS CHARACTER NO-UNDO.
DEFINE VARIABLE cObsCliente AS CHARACTER NO-UNDO.
DEFINE VARIABLE cFilme AS CHARACTER NO-UNDO.
DEFINE VARIABLE cGenero AS CHARACTER NO-UNDO.
DEFINE VARIABLE cSinopse AS CHARACTER NO-UNDO.
DEFINE VARIABLE iValor AS INTEGER NO-UNDO.
DEFINE VARIABLE iQuantidade AS INTEGER NO-UNDO.

PROCEDURE criaCidade:
    DEFINE INPUT PARAMETER pcNome AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pcUF AS CHARACTER NO-UNDO.
    DEFINE OUTPUT PARAMETER piCodigo AS INT64 NO-UNDO.

    FIND FIRST Cidades
        WHERE Cidades.NomCidade = pcNome
        NO-ERROR.

    IF NOT AVAILABLE Cidades THEN DO:
        CREATE Cidades.
        ASSIGN
            Cidades.CodCidade = NEXT-VALUE(SeqCidade)
            Cidades.NomCidade = pcNome
            Cidades.CodUF = pcUF.
    END.

    piCodigo = Cidades.CodCidade.
END PROCEDURE.

PROCEDURE criaCliente:
    DEFINE INPUT PARAMETER pcNome AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pcEndereco AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER piCidade AS INT64 NO-UNDO.
    DEFINE INPUT PARAMETER pcObs AS CHARACTER NO-UNDO.
    DEFINE OUTPUT PARAMETER piCodigo AS INTEGER NO-UNDO.

    FIND FIRST Clientes
        WHERE Clientes.NomCliente = pcNome
        NO-ERROR.

    IF NOT AVAILABLE Clientes THEN DO:
        CREATE Clientes.
        ASSIGN
            Clientes.CodCliente = NEXT-VALUE(SeqCliente)
            Clientes.NomCliente = pcNome
            Clientes.Endereco = pcEndereco
            Clientes.CodCidade = piCidade
            Clientes.Observacao = pcObs.
    END.

    piCodigo = Clientes.CodCliente.
END PROCEDURE.

PROCEDURE criaFilme:
    DEFINE INPUT PARAMETER pcNome AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER pcGenero AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER piValor AS INTEGER NO-UNDO.
    DEFINE INPUT PARAMETER pcSinopse AS CHARACTER NO-UNDO.
    DEFINE OUTPUT PARAMETER piCodigo AS INTEGER NO-UNDO.

    FIND FIRST Filmes
        WHERE Filmes.NomFilme = pcNome
        NO-ERROR.

    IF NOT AVAILABLE Filmes THEN DO:
        CREATE Filmes.
        ASSIGN
            Filmes.CodFilme = NEXT-VALUE(SeqFilme)
            Filmes.NomFilme = pcNome
            Filmes.Genero = pcGenero
            Filmes.ValFilme = piValor
            Filmes.Sinopse = pcSinopse.
    END.

    piCodigo = Filmes.CodFilme.
END PROCEDURE.

PROCEDURE criaAluguel:
    DEFINE INPUT PARAMETER piCliente AS INTEGER NO-UNDO.
    DEFINE INPUT PARAMETER piFilme AS INTEGER NO-UNDO.
    DEFINE INPUT PARAMETER piItem AS INTEGER NO-UNDO.
    DEFINE INPUT PARAMETER piQuantidade AS INTEGER NO-UNDO.
    DEFINE INPUT PARAMETER pcObs AS CHARACTER NO-UNDO.

    DEFINE VARIABLE iValorFilme AS INTEGER NO-UNDO.

    FIND FIRST Alugueis
        WHERE Alugueis.Observacao = pcObs
        NO-ERROR.

    IF AVAILABLE Alugueis THEN
        RETURN.

    FIND FIRST Filmes
        WHERE Filmes.CodFilme = piFilme
        NO-ERROR.

    IF NOT AVAILABLE Filmes THEN
        RETURN.

    ASSIGN
        iValorFilme = Filmes.ValFilme
        iAluguel = NEXT-VALUE(SeqAluguel).

    CREATE Alugueis.
    ASSIGN
        Alugueis.CodAluguel = iAluguel
        Alugueis.CodCliente = piCliente
        Alugueis.DatAluguel = TODAY
        Alugueis.ValAluguel = iValorFilme * piQuantidade
        Alugueis.Observacao = pcObs.

    CREATE Aluguel_filmes.
    ASSIGN
        Aluguel_filmes.CodAluguel = iAluguel
        Aluguel_filmes.CodItem = piItem
        Aluguel_filmes.CodFilme = piFilme
        Aluguel_filmes.NumQuantidade = piQuantidade
        Aluguel_filmes.ValTotal = iValorFilme * piQuantidade.
END PROCEDURE.

RUN criaCidade ("Joinville", "SC", OUTPUT iCidadeJoinville).
RUN criaCidade ("Florianopolis", "SC", OUTPUT iCidadeFlorianopolis).
RUN criaCidade ("Blumenau", "SC", OUTPUT iCidadeBlumenau).

RUN criaCliente ("Ana Souza", "Rua das Palmeiras, 120", iCidadeJoinville, "Cliente frequente", OUTPUT iClienteAna).
RUN criaCliente ("Bruno Lima", "Av. Beira Mar, 450", iCidadeFlorianopolis, "Prefere filmes de ficcao", OUTPUT iClienteBruno).
RUN criaCliente ("Carla Mendes", "Rua XV de Novembro, 88", iCidadeBlumenau, "Cadastro de teste", OUTPUT iClienteCarla).

RUN criaFilme ("Matrix", "Ficcao", 12, "Programador descobre a realidade por tras do mundo.", OUTPUT iFilmeMatrix).
RUN criaFilme ("Interestelar", "Ficcao", 15, "Missao espacial em busca de um novo lar para a humanidade.", OUTPUT iFilmeInterestelar).
RUN criaFilme ("Central do Brasil", "Drama", 10, "Uma mulher ajuda um garoto a encontrar seu pai.", OUTPUT iFilmeCentral).

RUN criaAluguel (iClienteAna, iFilmeMatrix, 1, 1, "Carga inicial aluguel 001").
RUN criaAluguel (iClienteBruno, iFilmeInterestelar, 2, 2, "Carga inicial aluguel 002").
RUN criaAluguel (iClienteCarla, iFilmeCentral, 3, 1, "Carga inicial aluguel 003").

DO iCont = 1 TO 10:
    CASE iCont:
        WHEN 1 THEN ASSIGN
            cCidade = "Sao Jose"
            cUF = "SC"
            cCliente = "Diego Martins"
            cEndereco = "Rua Italia, 45"
            cObsCliente = "Carga extra cliente 001"
            cFilme = "O Auto da Compadecida"
            cGenero = "Comedia"
            iValor = 9
            cSinopse = "Dois amigos vivem aventuras no sertao nordestino."
            iQuantidade = 1.
        WHEN 2 THEN ASSIGN
            cCidade = "Itajai"
            cUF = "SC"
            cCliente = "Eduarda Rocha"
            cEndereco = "Rua Hercilio Luz, 210"
            cObsCliente = "Carga extra cliente 002"
            cFilme = "Cidade de Deus"
            cGenero = "Drama"
            iValor = 11
            cSinopse = "Retrato de jovens em uma comunidade do Rio de Janeiro."
            iQuantidade = 1.
        WHEN 3 THEN ASSIGN
            cCidade = "Chapeco"
            cUF = "SC"
            cCliente = "Felipe Costa"
            cEndereco = "Av. Getulio Vargas, 930"
            cObsCliente = "Carga extra cliente 003"
            cFilme = "Tropa de Elite"
            cGenero = "Acao"
            iValor = 13
            cSinopse = "Operacoes policiais em meio a conflitos urbanos."
            iQuantidade = 2.
        WHEN 4 THEN ASSIGN
            cCidade = "Criciuma"
            cUF = "SC"
            cCliente = "Gabriela Nunes"
            cEndereco = "Rua Anita Garibaldi, 300"
            cObsCliente = "Carga extra cliente 004"
            cFilme = "A Origem"
            cGenero = "Ficcao"
            iValor = 14
            cSinopse = "Ladroes especializados invadem sonhos para roubar ideias."
            iQuantidade = 1.
        WHEN 5 THEN ASSIGN
            cCidade = "Lages"
            cUF = "SC"
            cCliente = "Henrique Alves"
            cEndereco = "Rua Correia Pinto, 87"
            cObsCliente = "Carga extra cliente 005"
            cFilme = "O Poderoso Chefao"
            cGenero = "Drama"
            iValor = 16
            cSinopse = "A historia de uma familia ligada ao crime organizado."
            iQuantidade = 1.
        WHEN 6 THEN ASSIGN
            cCidade = "Jaragua do Sul"
            cUF = "SC"
            cCliente = "Isabela Freitas"
            cEndereco = "Rua Reinoldo Rau, 140"
            cObsCliente = "Carga extra cliente 006"
            cFilme = "Toy Story"
            cGenero = "Animacao"
            iValor = 8
            cSinopse = "Brinquedos ganham vida quando humanos nao estao por perto."
            iQuantidade = 3.
        WHEN 7 THEN ASSIGN
            cCidade = "Balneario Camboriu"
            cUF = "SC"
            cCliente = "Joao Pereira"
            cEndereco = "Av. Brasil, 1500"
            cObsCliente = "Carga extra cliente 007"
            cFilme = "Jurassic Park"
            cGenero = "Aventura"
            iValor = 12
            cSinopse = "Dinossauros recriados geneticamente escapam em um parque."
            iQuantidade = 1.
        WHEN 8 THEN ASSIGN
            cCidade = "Tubarao"
            cUF = "SC"
            cCliente = "Laura Fernandes"
            cEndereco = "Rua Sao Manuel, 57"
            cObsCliente = "Carga extra cliente 008"
            cFilme = "Forrest Gump"
            cGenero = "Drama"
            iValor = 10
            cSinopse = "Um homem simples participa de momentos marcantes da historia."
            iQuantidade = 2.
        WHEN 9 THEN ASSIGN
            cCidade = "Brusque"
            cUF = "SC"
            cCliente = "Marcos Oliveira"
            cEndereco = "Rua Azambuja, 432"
            cObsCliente = "Carga extra cliente 009"
            cFilme = "De Volta para o Futuro"
            cGenero = "Aventura"
            iValor = 12
            cSinopse = "Um jovem viaja no tempo em um carro modificado."
            iQuantidade = 1.
        WHEN 10 THEN ASSIGN
            cCidade = "Palhoca"
            cUF = "SC"
            cCliente = "Natalia Ribeiro"
            cEndereco = "Rua Pedra Branca, 75"
            cObsCliente = "Carga extra cliente 010"
            cFilme = "O Senhor dos Aneis"
            cGenero = "Fantasia"
            iValor = 15
            cSinopse = "Uma jornada para destruir um anel de grande poder."
            iQuantidade = 2.
    END CASE.

    RUN criaCidade (cCidade, cUF, OUTPUT iCidadeCarga).
    RUN criaCliente (cCliente, cEndereco, iCidadeCarga, cObsCliente, OUTPUT iClienteCarga).
    RUN criaFilme (cFilme, cGenero, iValor, cSinopse, OUTPUT iFilmeCarga).
    RUN criaAluguel (iClienteCarga, iFilmeCarga, iCont + 3, iQuantidade, "Carga extra aluguel " + STRING(iCont, "999")).
END.

MESSAGE "Carga inicial concluida." VIEW-AS ALERT-BOX INFORMATION.
