DEF VAR cCidade AS CHARACTER NO-UNDO.
DEF VAR cFilme  AS CHARACTER NO-UNDO.
DEF VAR dTotal  AS DECIMAL   NO-UNDO.

DEF BUFFER bf-alugueis       FOR alugueis.
DEF BUFFER bf-aluguel-filmes FOR aluguel_filmes.
DEF BUFFER bf-clientes       FOR clientes.
DEF BUFFER bf-cidades        FOR cidades.
DEF BUFFER bf-filmes         FOR filmes.

FUNCTION fn-left RETURNS CHARACTER
    (INPUT pcTexto AS CHARACTER, INPUT piTam AS INTEGER):

    pcTexto = IF pcTexto = ? THEN "" ELSE pcTexto.
    RETURN SUBSTRING(pcTexto + FILL(" ", piTam), 1, piTam).
END FUNCTION.

FUNCTION fn-right RETURNS CHARACTER
    (INPUT pcTexto AS CHARACTER, INPUT piTam AS INTEGER):

    pcTexto = IF pcTexto = ? THEN "" ELSE pcTexto.
    pcTexto = FILL(" ", piTam) + pcTexto.
    RETURN SUBSTRING(pcTexto, LENGTH(pcTexto) - piTam + 1, piTam).
END FUNCTION.

FUNCTION fn-data RETURNS CHARACTER
    (INPUT pdData AS DATE):

    IF pdData = ? THEN
        RETURN "".

    RETURN STRING(DAY(pdData), "99")
         + "/"
         + STRING(MONTH(pdData), "99")
         + "/"
         + STRING(YEAR(pdData), "9999").
END FUNCTION.

OUTPUT TO "c:\tmp\relatorio-alugueis.txt".

FOR EACH bf-alugueis NO-LOCK
    BY bf-alugueis.CodCliente
    BY bf-alugueis.CodAluguel:

    FIND FIRST bf-clientes
        WHERE bf-clientes.CodCliente = bf-alugueis.CodCliente
        NO-LOCK NO-ERROR.

    RELEASE bf-cidades.
    IF AVAILABLE bf-clientes THEN DO:
        FIND FIRST bf-cidades
            WHERE bf-cidades.CodCidade = bf-clientes.CodCidade
            NO-LOCK NO-ERROR.
    END.

    cCidade = IF AVAILABLE bf-cidades
              THEN bf-cidades.NomCidade + "-" + bf-cidades.CodUF
              ELSE "".

    PUT UNFORMATTED
        SPACE(29) "Aluguel" SKIP(2)
        SPACE(7) "Aluguel: "
        fn-left(STRING(bf-alugueis.CodAluguel), 5)
        SPACE(38) "Data: "
        fn-data(bf-alugueis.DatAluguel) SKIP(2)
        SPACE(12) "Nome: "
        STRING(bf-alugueis.CodCliente) "-"
        IF AVAILABLE bf-clientes THEN bf-clientes.NomCliente ELSE "" SKIP(2)
        SPACE(7) "Endereco: "
        IF AVAILABLE bf-clientes THEN bf-clientes.Endereco ELSE ""
        " / " cCidade SKIP(2)
        SPACE(6) "Observacao: "
        bf-alugueis.Observacao SKIP(2)
        "Item Filme                        Quantidade      Valor      Total" SKIP
        "----- ---------------------------- ---------- ---------- ----------" SKIP.

    dTotal = 0.

    FOR EACH bf-aluguel-filmes
        WHERE bf-aluguel-filmes.CodAluguel = bf-alugueis.CodAluguel
        NO-LOCK
        BY bf-aluguel-filmes.CodItem:

        FIND FIRST bf-filmes
            WHERE bf-filmes.CodFilme = bf-aluguel-filmes.CodFilme
            NO-LOCK NO-ERROR.

        cFilme = STRING(bf-aluguel-filmes.CodFilme)
               + "-"
               + IF AVAILABLE bf-filmes THEN bf-filmes.NomFilme ELSE "".
        dTotal = dTotal + bf-aluguel-filmes.ValTotal.

        PUT UNFORMATTED
            fn-right(STRING(bf-aluguel-filmes.CodItem), 5) " "
            fn-left(cFilme, 28) " "
            fn-right(STRING(bf-aluguel-filmes.NumQuantidade), 10) " "
            fn-right(STRING(IF AVAILABLE bf-filmes THEN bf-filmes.ValFilme ELSE 0,
                            ">>>>>>>9.99"), 10) " "
            fn-right(STRING(bf-aluguel-filmes.ValTotal, ">>>>>>>9.99"), 10) SKIP.
    END.

    PUT UNFORMATTED
        SKIP
        SPACE(38) "Total Aluguel = "
        fn-right(STRING(dTotal, ">>>>>>>9.99"), 10) SKIP(3).
END.

OUTPUT CLOSE.

OS-COMMAND NO-WAIT VALUE("notepad c:\tmp\relatorio-alugueis.txt").
