DEF VAR cCidade AS CHARACTER NO-UNDO.

DEF BUFFER bf-clientes FOR clientes.
DEF BUFFER bf-cidades  FOR cidades.

OUTPUT TO "c:\tmp\relatorio-clientes.txt".

PUT UNFORMATTED
    SPACE(29) "Relatorio de Clientes" SKIP(2)
    "Codigo Nome                           Endereco                 Cidade               Observacao" SKIP
    "------ ------------------------------ ------------------------ -------------------- ------------------------------------------------------------" SKIP(1).

FOR EACH bf-clientes NO-LOCK BY bf-clientes.CodCliente:
    FIND FIRST bf-cidades
        WHERE bf-cidades.CodCidade = bf-clientes.CodCidade
        NO-LOCK NO-ERROR.

    cCidade = STRING(bf-clientes.CodCidade) + "-"
            + IF AVAILABLE bf-cidades THEN bf-cidades.NomCidade ELSE "".

    PUT UNFORMATTED
        bf-clientes.CodCliente FORMAT ">>>>9" " "
        bf-clientes.NomCliente FORMAT "x(30)" " "
        bf-clientes.Endereco FORMAT "x(24)" " "
        cCidade FORMAT "x(20)" " "
        bf-clientes.Observacao FORMAT "x(60)" SKIP(1).
END.

OUTPUT CLOSE.

OS-COMMAND NO-WAIT VALUE("notepad c:\tmp\relatorio-clientes.txt").
