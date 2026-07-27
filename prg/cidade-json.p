USING PROGRESS.json.ObjectModel.JsonObject.
USING PROGRESS.json.ObjectModel.JsonArray.

DEF VAR oObj  AS JsonObject NO-UNDO.
DEF VAR aList AS JsonArray  NO-UNDO.

DEF VAR cTmp  AS CHAR NO-UNDO.

DEF BUFFER bfCidades FOR cidades.

aList = NEW JsonArray().
FOR EACH bfCidades FIELDS(CodCidade NomCidade CodUf) NO-LOCK:
    oObj = NEW JsonObject().
    oObj:ADD("codigo", bfCidades.CodCidade).
    oObj:ADD("nome cidade", bfCidades.NomCidade).
    oObj:ADD("uf", bfCidades.CodUf).
    aList:ADD(oObj).
END.
aList:WriteFile("c:\tmp\cidades.json", YES).
OS-COMMAND NO-WAIT VALUE("notepad c:\tmp\cidades.json").
DELETE OBJECT aList.
