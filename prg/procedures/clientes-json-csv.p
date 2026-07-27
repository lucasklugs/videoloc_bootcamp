USING PROGRESS.json.ObjectModel.JsonObject.
USING PROGRESS.json.ObjectModel.JsonArray.

DEF VAR oObj  AS JsonObject NO-UNDO.
DEF VAR aList AS JsonArray  NO-UNDO.

DEF VAR cTmp  AS CHAR NO-UNDO.

DEF BUFFER bfClientes FOR clientes.

FUNCTION fn-csv RETURNS CHARACTER (INPUT pcValue AS CHARACTER):
    RETURN '"' + REPLACE(pcValue, '"', '""') + '"'.
END FUNCTION.

aList = NEW JsonArray().
FOR EACH bfClientes 
    FIELDS(CodCliente NomCliente Endereco CodCidade Observacao) NO-LOCK:
    oObj = NEW JsonObject().
    oObj:ADD("codigo", bfClientes.CodCliente).
    oObj:ADD("nome cliente", bfClientes.NomCliente).
    oObj:ADD("endereco", bfClientes.Endereco).
    oObj:ADD("cidade", bfClientes.CodCidade).
    oObj:ADD("observacao", bfClientes.Observacao).
    aList:ADD(oObj).
END.
aList:WriteFile("c:\tmp\clientes.json", YES).

OUTPUT TO "c:\tmp\clientes.csv".
PUT UNFORMATTED
    fn-csv("codigo") ";"
    fn-csv("nome cliente") ";"
    fn-csv("endereco") ";"
    fn-csv("cidade") ";"
    fn-csv("observacao")
    SKIP.

FOR EACH bfClientes
    FIELDS(CodCliente NomCliente Endereco CodCidade Observacao) NO-LOCK:
    PUT UNFORMATTED
        bfClientes.CodCliente ";"
        fn-csv(bfClientes.NomCliente) ";"
        fn-csv(bfClientes.Endereco) ";"
        bfClientes.CodCidade ";"
        fn-csv(bfClientes.Observacao)
        SKIP.
END.
OUTPUT CLOSE.

OS-COMMAND NO-WAIT VALUE("notepad c:\tmp\clientes.json").
OS-COMMAND NO-WAIT VALUE("notepad c:\tmp\clientes.csv").
DELETE OBJECT aList.
