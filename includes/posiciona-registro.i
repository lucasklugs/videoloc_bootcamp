PROCEDURE pi-posiciona-registro:
    DEF INPUT PARAM pNavega AS CHAR NO-UNDO.
    
    CASE pNavega:
        WHEN "first" THEN DO:
            FIND FIRST {&1} NO-LOCK NO-ERROR.
        END.
       /* WHEN "last" THEN DO:
            FIND LAST {&1} NO-LOCK NO-ERROR.
        END.
        WHEN "next" THEN DO:
            FIND NEXT {&1} NO-LOCK NO-ERROR.
            IF  NOT AVAIL {&1} THEN DO:
                APPLY "choose" TO bt-first IN FRAME {&2}.
            END.
        END.
        WHEN "prev" THEN DO:
            FIND PREV {&1} NO-LOCK NO-ERROR.
            IF  NOT AVAIL {&1} THEN DO:
                RUN pi-posiciona-registro (INPUT "last").
            END.
        END.*/
    END CASE.
END PROCEDURE.
