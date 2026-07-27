USING PROGRESS.json.ObjectModel.JsonObject.
USING PROGRESS.json.ObjectModel.JsonArray.

DEF VAR oAluguel AS JsonObject NO-UNDO.
DEF VAR oFilme   AS JsonObject NO-UNDO.
DEF VAR aList    AS JsonArray  NO-UNDO.
DEF VAR aFilmes  AS JsonArray  NO-UNDO.

DEF BUFFER bf-alugueis        FOR alugueis.
DEF BUFFER bf-aluguel-filmes  FOR aluguel_filmes.
DEF BUFFER bf-filmes          FOR filmes.
DEF BUFFER bf-clientes        FOR clientes.

aList = NEW JsonArray().

FOR EACH bf-alugueis
    FIELDS(CodAluguel DatAluguel CodCliente ValAluguel Observacao) NO-LOCK:

    oAluguel = NEW JsonObject().
    aFilmes  = NEW JsonArray().

    FIND FIRST bf-clientes
        WHERE bf-clientes.CodCliente = bf-alugueis.CodCliente
        NO-LOCK NO-ERROR.

    oAluguel:ADD("codigo", bf-alugueis.CodAluguel).
    oAluguel:ADD("data aluguel", STRING(bf-alugueis.DatAluguel, "99/99/9999")).
    oAluguel:ADD("codigo cliente", bf-alugueis.CodCliente).
    oAluguel:ADD("nome cliente", IF AVAILABLE bf-clientes THEN bf-clientes.NomCliente ELSE "").
    oAluguel:ADD("valor aluguel", bf-alugueis.ValAluguel).
    oAluguel:ADD("observacao", bf-alugueis.Observacao).

    FOR EACH bf-aluguel-filmes
        FIELDS(CodAluguel CodItem CodFilme NumQuantidade ValTotal)
        WHERE bf-aluguel-filmes.CodAluguel = bf-alugueis.CodAluguel
        NO-LOCK:

        FIND FIRST bf-filmes
            WHERE bf-filmes.CodFilme = bf-aluguel-filmes.CodFilme
            NO-LOCK NO-ERROR.

        oFilme = NEW JsonObject().
        oFilme:ADD("codigo aluguel", bf-aluguel-filmes.CodAluguel).
        oFilme:ADD("item", bf-aluguel-filmes.CodItem).
        oFilme:ADD("codigo filme", bf-aluguel-filmes.CodFilme).
        oFilme:ADD("nome filme", IF AVAILABLE bf-filmes THEN bf-filmes.NomFilme ELSE "").
        oFilme:ADD("quantidade", bf-aluguel-filmes.NumQuantidade).
        oFilme:ADD("valor filme", IF AVAILABLE bf-filmes THEN bf-filmes.ValFilme ELSE 0).
        oFilme:ADD("valor total", bf-aluguel-filmes.ValTotal).

        aFilmes:ADD(oFilme).
    END.

    oAluguel:ADD("filmes", aFilmes).
    aList:ADD(oAluguel).
END.

aList:WriteFile("c:\tmp\alugueis.json", YES).
OS-COMMAND NO-WAIT VALUE("notepad c:\tmp\alugueis.json").
DELETE OBJECT aList.
