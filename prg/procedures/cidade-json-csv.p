USING PROGRESS.json.ObjectModel.JsonObject.
USING PROGRESS.json.ObjectModel.JsonArray.

DEF VAR oObj  AS JsonObject NO-UNDO.
DEF VAR aList AS JsonArray  NO-UNDO.

DEF VAR cTmp  AS CHAR NO-UNDO.

DEF BUFFER bfCidades FOR cidades.

FUNCTION fn-csv RETURNS CHARACTER (INPUT pcValue AS CHARACTER):
    RETURN '"' + REPLACE(pcValue, '"', '""') + '"'.
END FUNCTION.

aList = NEW JsonArray().
FOR EACH bfCidades FIELDS(CodCidade NomCidade CodUf) NO-LOCK:
    oObj = NEW JsonObject().
    oObj:ADD("codigo", bfCidades.CodCidade).
    oObj:ADD("nome cidade", bfCidades.NomCidade).
    oObj:ADD("uf", bfCidades.CodUf).
    aList:ADD(oObj).
END.
aList:WriteFile("c:\tmp\cidades.json", YES).

OUTPUT TO "c:\tmp\cidades.csv".
PUT UNFORMATTED
    fn-csv("codigo") ";"
    fn-csv("nome cidade") ";"
    fn-csv("uf")
    SKIP.

FOR EACH bfCidades FIELDS(CodCidade NomCidade CodUf) NO-LOCK:
    PUT UNFORMATTED
        bfCidades.CodCidade ";"
        fn-csv(bfCidades.NomCidade) ";"
        fn-csv(bfCidades.CodUf)
        SKIP.
END.
OUTPUT CLOSE.

OS-COMMAND NO-WAIT VALUE("notepad c:\tmp\cidades.json").
OS-COMMAND NO-WAIT VALUE("notepad c:\tmp\cidades.csv").
DELETE OBJECT aList.
