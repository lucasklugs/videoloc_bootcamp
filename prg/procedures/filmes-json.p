USING PROGRESS.json.ObjectModel.JsonObject.
USING PROGRESS.json.ObjectModel.JsonArray.

DEF VAR oObj  AS JsonObject NO-UNDO.
DEF VAR aList AS JsonArray  NO-UNDO.

DEF VAR cTmp  AS CHAR NO-UNDO.

DEF BUFFER bf-filmes FOR filmes.

aList = NEW JsonArray().
FOR EACH bf-filmes FIELDS(CodFilme nomfilme genero valfilme sinopse) NO-LOCK:
    oObj = NEW JsonObject().
    oObj:ADD("codigo", bf-filmes.CodFilme).
    oObj:ADD("nome filme", bf-filmes.nomfilme ).
    oObj:ADD("genero", bf-filmes.genero).     
    oObj:ADD("valor", bf-filmes.valfilme).
    oObj:ADD("sinopse", bf-filmes.sinopse).
    aList:ADD(oObj).
END.
aList:WriteFile("c:\tmp\filmes.json", YES).
OS-COMMAND NO-WAIT VALUE("notepad c:\tmp\filmes.json").
DELETE OBJECT aList.
