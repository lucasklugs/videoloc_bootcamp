USING PROGRESS.json.ObjectModel.JsonObject.
USING PROGRESS.json.ObjectModel.JsonArray.

DEF VAR oObj  AS JsonObject NO-UNDO.
DEF VAR aList AS JsonArray  NO-UNDO.

DEF VAR cTmp  AS CHAR NO-UNDO.

DEF BUFFER bfClientes FOR clientes.

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
OS-COMMAND NO-WAIT VALUE("notepad c:\tmp\clientes.json").
DELETE OBJECT aList.
