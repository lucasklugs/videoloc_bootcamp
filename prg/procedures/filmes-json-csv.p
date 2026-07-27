USING PROGRESS.json.ObjectModel.JsonObject.
USING PROGRESS.json.ObjectModel.JsonArray.

DEF VAR oObj  AS JsonObject NO-UNDO.
DEF VAR aList AS JsonArray  NO-UNDO.

DEF VAR cTmp  AS CHAR NO-UNDO.

DEF BUFFER bf-filmes FOR filmes.

FUNCTION fn-csv RETURNS CHARACTER (INPUT pcValue AS CHARACTER):
    RETURN '"' + REPLACE(pcValue, '"', '""') + '"'.
END FUNCTION.

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

OUTPUT TO "c:\tmp\filmes.csv".
PUT UNFORMATTED
    fn-csv("codigo") ";"
    fn-csv("nome filme") ";"
    fn-csv("genero") ";"
    fn-csv("valor") ";"
    fn-csv("sinopse")
    SKIP.

FOR EACH bf-filmes FIELDS(CodFilme nomfilme genero valfilme sinopse) NO-LOCK:
    PUT UNFORMATTED
        bf-filmes.CodFilme ";"
        fn-csv(bf-filmes.NomFilme) ";"
        fn-csv(bf-filmes.Genero) ";"
        STRING(bf-filmes.ValFilme) ";"
        fn-csv(bf-filmes.Sinopse)
        SKIP.
END.
OUTPUT CLOSE.

OS-COMMAND NO-WAIT VALUE("notepad c:\tmp\filmes.json").
OS-COMMAND NO-WAIT VALUE("notepad c:\tmp\filmes.csv").
DELETE OBJECT aList.
