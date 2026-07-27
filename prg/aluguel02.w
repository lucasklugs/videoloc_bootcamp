&ANALYZE-SUSPEND _VERSION-NUMBER AB_v10r12 GUI
&ANALYZE-RESUME
/* Connected Databases 
          videloc          PROGRESS
*/
&Scoped-define WINDOW-NAME C-Win
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS C-Win 
/*------------------------------------------------------------------------

  File: 

  Description: 

  Input Parameters:
      <none>

  Output Parameters:
      <none>

  Author: 

  Created: 

------------------------------------------------------------------------*/
/*          This .W file was created with the Progress AppBuilder.      */
/*----------------------------------------------------------------------*/

/* Create an unnamed pool to store all the widgets created 
     by this procedure. This is a good default which assures
     that this procedure's triggers and internal procedures 
     will execute in this procedure's storage, and that proper
     cleanup will occur on deletion of the procedure. */

CREATE WIDGET-POOL.

/* ***************************  Definitions  ************************** */

/* Parameters Definitions ---                                           */

DEF INPUT PARAM r-aluguel AS ROWID NO-UNDO.
DEF INPUT PARAM r-filme AS ROWID NO-UNDO.
DEF INPUT PARAM pOpcao AS CHAR NO-UNDO.

/* Local Variable Definitions ---                                       */

DEFINE VARIABLE iseqitem    AS INTEGER NO-UNDO.
DEFINE VARIABLE dValorfilme AS DECIMAL INITIAL 0 NO-UNDO.

DEFINE BUFFER bf-alugueis FOR alugueis.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Window
&Scoped-define DB-AWARE no

/* Name of designated FRAME-NAME and/or first browse and/or first query */
&Scoped-define FRAME-NAME f-cad

/* Internal Tables (found by Frame, Query & Browse Queries)             */
&Scoped-define INTERNAL-TABLES Aluguel_filmes Filmes

/* Definitions for FRAME f-cad                                          */
&Scoped-define FIELDS-IN-QUERY-f-cad Aluguel_filmes.CodFilme ~
Filmes.NomFilme Aluguel_filmes.NumQuantidade Aluguel_filmes.ValTotal 
&Scoped-define ENABLED-FIELDS-IN-QUERY-f-cad Aluguel_filmes.CodFilme ~
Filmes.NomFilme Aluguel_filmes.NumQuantidade Aluguel_filmes.ValTotal 
&Scoped-define ENABLED-TABLES-IN-QUERY-f-cad Aluguel_filmes Filmes
&Scoped-define FIRST-ENABLED-TABLE-IN-QUERY-f-cad Aluguel_filmes
&Scoped-define SECOND-ENABLED-TABLE-IN-QUERY-f-cad Filmes
&Scoped-define QUERY-STRING-f-cad FOR EACH Aluguel_filmes SHARE-LOCK, ~
      EACH Filmes OF Aluguel_filmes SHARE-LOCK
&Scoped-define OPEN-QUERY-f-cad OPEN QUERY f-cad FOR EACH Aluguel_filmes SHARE-LOCK, ~
      EACH Filmes OF Aluguel_filmes SHARE-LOCK.
&Scoped-define TABLES-IN-QUERY-f-cad Aluguel_filmes Filmes
&Scoped-define FIRST-TABLE-IN-QUERY-f-cad Aluguel_filmes
&Scoped-define SECOND-TABLE-IN-QUERY-f-cad Filmes


/* Standard List Definitions                                            */
&Scoped-Define ENABLED-FIELDS Aluguel_filmes.CodFilme Filmes.NomFilme ~
Aluguel_filmes.NumQuantidade Aluguel_filmes.ValTotal 
&Scoped-define ENABLED-TABLES Aluguel_filmes Filmes
&Scoped-define FIRST-ENABLED-TABLE Aluguel_filmes
&Scoped-define SECOND-ENABLED-TABLE Filmes
&Scoped-Define ENABLED-OBJECTS bt-save-movie bt-cancel-movie 
&Scoped-Define DISPLAYED-FIELDS Aluguel_filmes.CodFilme Filmes.NomFilme ~
Aluguel_filmes.NumQuantidade Aluguel_filmes.ValTotal 
&Scoped-define DISPLAYED-TABLES Aluguel_filmes Filmes
&Scoped-define FIRST-DISPLAYED-TABLE Aluguel_filmes
&Scoped-define SECOND-DISPLAYED-TABLE Filmes


/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME



/* ***********************  Control Definitions  ********************** */

/* Define the widget handle for the window                              */
DEFINE VARIABLE C-Win AS WIDGET-HANDLE NO-UNDO.

/* Definitions of the field level widgets                               */
DEFINE BUTTON bt-cancel-movie 
     LABEL "Cancelar" 
     SIZE 15 BY 1.

DEFINE BUTTON bt-save-movie 
     LABEL "Salvar" 
     SIZE 14 BY 1.

/* Query definitions                                                    */
&ANALYZE-SUSPEND
DEFINE QUERY f-cad FOR 
      Aluguel_filmes, 
      Filmes SCROLLING.
&ANALYZE-RESUME

/* ************************  Frame Definitions  *********************** */

DEFINE FRAME f-cad
     Aluguel_filmes.CodFilme AT ROW 1.71 COL 13 COLON-ALIGNED WIDGET-ID 2
          LABEL "Filme"
          VIEW-AS FILL-IN 
          SIZE 12 BY 1
     Filmes.NomFilme AT ROW 1.71 COL 25.6 COLON-ALIGNED NO-LABEL WIDGET-ID 8
          VIEW-AS FILL-IN 
          SIZE 49.6 BY 1
     Aluguel_filmes.NumQuantidade AT ROW 2.91 COL 13 COLON-ALIGNED WIDGET-ID 4
          VIEW-AS FILL-IN 
          SIZE 12 BY 1
     Aluguel_filmes.ValTotal AT ROW 4.1 COL 13 COLON-ALIGNED WIDGET-ID 6
          VIEW-AS FILL-IN 
          SIZE 12 BY 1
     bt-save-movie AT ROW 6 COL 14 WIDGET-ID 10
     bt-cancel-movie AT ROW 6 COL 29 WIDGET-ID 12
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COLUMN 1 ROW 1
         SIZE 97.4 BY 10.67 WIDGET-ID 100.


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: Window
   Allow: Basic,Browse,DB-Fields,Window,Query
   Other Settings: COMPILE
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

/* *************************  Create Window  ************************** */

&ANALYZE-SUSPEND _CREATE-WINDOW
IF SESSION:DISPLAY-TYPE = "GUI":U THEN
  CREATE WINDOW C-Win ASSIGN
         HIDDEN             = YES
         TITLE              = "Filmes a Alugar"
         HEIGHT             = 10.67
         WIDTH              = 97.4
         MAX-HEIGHT         = 48.05
         MAX-WIDTH          = 384
         VIRTUAL-HEIGHT     = 48.05
         VIRTUAL-WIDTH      = 384
         RESIZE             = yes
         SCROLL-BARS        = no
         STATUS-AREA        = no
         BGCOLOR            = ?
         FGCOLOR            = ?
         KEEP-FRAME-Z-ORDER = yes
         THREE-D            = yes
         MESSAGE-AREA       = no
         SENSITIVE          = yes.
ELSE {&WINDOW-NAME} = CURRENT-WINDOW.
/* END WINDOW DEFINITION                                                */
&ANALYZE-RESUME



/* ***********  Runtime Attributes and AppBuilder Settings  *********** */

&ANALYZE-SUSPEND _RUN-TIME-ATTRIBUTES
/* SETTINGS FOR WINDOW C-Win
  VISIBLE,,RUN-PERSISTENT                                               */
/* SETTINGS FOR FRAME f-cad
   FRAME-NAME                                                           */
/* SETTINGS FOR FILL-IN Aluguel_filmes.CodFilme IN FRAME f-cad
   EXP-LABEL                                                            */
/* SETTINGS FOR FILL-IN Filmes.NomFilme IN FRAME f-cad
   EXP-LABEL                                                            */
IF SESSION:DISPLAY-TYPE = "GUI":U AND VALID-HANDLE(C-Win)
THEN C-Win:HIDDEN = no.

/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME


/* Setting information for Queries and Browse Widgets fields            */

&ANALYZE-SUSPEND _QUERY-BLOCK FRAME f-cad
/* Query rebuild information for FRAME f-cad
     _TblList          = "videloc.Aluguel_filmes,videloc.Filmes OF videloc.Aluguel_filmes"
     _Query            is OPENED
*/  /* FRAME f-cad */
&ANALYZE-RESUME

 



/* ************************  Control Triggers  ************************ */

&Scoped-define SELF-NAME C-Win
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL C-Win C-Win
ON END-ERROR OF C-Win /* <insert window title> */
OR ENDKEY OF {&WINDOW-NAME} ANYWHERE DO:
  /* This case occurs when the user presses the "Esc" key.
     In a persistently run window, just ignore this.  If we did not, the
     application would exit. */
  IF THIS-PROCEDURE:PERSISTENT THEN RETURN NO-APPLY.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL C-Win C-Win
ON WINDOW-CLOSE OF C-Win /* <insert window title> */
DO:
  /* This event will close the window and terminate the procedure.  */
  APPLY "CLOSE":U TO THIS-PROCEDURE.
  RETURN NO-APPLY.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-cancel-movie
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-cancel-movie C-Win
ON CHOOSE OF bt-cancel-movie IN FRAME f-cad /* Cancelar */
DO:
    APPLY "CLOSE":U TO THIS-PROCEDURE.
    RETURN NO-APPLY.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-save-movie
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-save-movie C-Win
ON CHOOSE OF bt-save-movie IN FRAME f-cad /* Salvar */
DO:
    RUN pi-save.
    IF RETURN-VALUE = "NOK" THEN DO:
        RETURN NO-APPLY.         
    END.
    APPLY "CLOSE":U TO THIS-PROCEDURE.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME Aluguel_filmes.CodFilme
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL Aluguel_filmes.CodFilme C-Win
ON LEAVE OF Aluguel_filmes.CodFilme IN FRAME f-cad /* Filme */
DO:
    FIND FIRST filmes NO-LOCK
        WHERE filmes.codfilme = INPUT FRAME f-cad aluguel_filmes.codfilme NO-ERROR.
    IF AVAIL filmes THEN DO:
        DISPLAY filmes.nomfilme 
                WITH FRAME f-cad.      
    END.
    ELSE
       DISPLAY "" @ filmes.nomfilme WITH FRAME f-cad.
       
     APPLY "leave" TO aluguel_filmes.NumQuantidade IN FRAME f-cad.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME Aluguel_filmes.NumQuantidade
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL Aluguel_filmes.NumQuantidade C-Win
ON LEAVE OF Aluguel_filmes.NumQuantidade IN FRAME f-cad /* Quantidade */
DO:
    IF AVAIL filmes THEN DO:
        ASSIGN dValorfilme = filmes.valfilme * INPUT FRAME f-cad aluguel_filmes.NumQuantidade.                
    END.
    DISPLAY dValorfilme @ aluguel_filmes.valtotal WITH FRAME f-cad.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&UNDEFINE SELF-NAME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK C-Win 


/* ***************************  Main Block  *************************** */

/* Set CURRENT-WINDOW: this will parent dialog-boxes and frames.        */
ASSIGN CURRENT-WINDOW                = {&WINDOW-NAME} 
       THIS-PROCEDURE:CURRENT-WINDOW = {&WINDOW-NAME}.

/* The CLOSE event can be used from inside or outside the procedure to  */
/* terminate it.                                                        */
ON CLOSE OF THIS-PROCEDURE 
   RUN disable_UI.

/* Best default for GUI applications is...                              */
PAUSE 0 BEFORE-HIDE.

/* Now enable the interface and wait for the exit condition.            */
/* (NOTE: handle ERROR and END-KEY so cleanup code will always fire.    */
MAIN-BLOCK:
DO ON ERROR   UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK
   ON END-KEY UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK:
  RUN enable_UI.
  
  RUN pi-mostra-dados.
  
  IF NOT THIS-PROCEDURE:PERSISTENT THEN
    WAIT-FOR CLOSE OF THIS-PROCEDURE.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE disable_UI C-Win  _DEFAULT-DISABLE
PROCEDURE disable_UI :
/*------------------------------------------------------------------------------
  Purpose:     DISABLE the User Interface
  Parameters:  <none>
  Notes:       Here we clean-up the user-interface by deleting
               dynamic widgets we have created and/or hide 
               frames.  This procedure is usually called when
               we are ready to "clean-up" after running.
------------------------------------------------------------------------------*/
  /* Delete the WINDOW we created */
  IF SESSION:DISPLAY-TYPE = "GUI":U AND VALID-HANDLE(C-Win)
  THEN DELETE WIDGET C-Win.
  IF THIS-PROCEDURE:PERSISTENT THEN DELETE PROCEDURE THIS-PROCEDURE.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE enable_UI C-Win  _DEFAULT-ENABLE
PROCEDURE enable_UI :
/*------------------------------------------------------------------------------
  Purpose:     ENABLE the User Interface
  Parameters:  <none>
  Notes:       Here we display/view/enable the widgets in the
               user-interface.  In addition, OPEN all queries
               associated with each FRAME and BROWSE.
               These statements here are based on the "Other 
               Settings" section of the widget Property Sheets.
------------------------------------------------------------------------------*/

  {&OPEN-QUERY-f-cad}
  GET FIRST f-cad.
  IF AVAILABLE Aluguel_filmes THEN 
    DISPLAY Aluguel_filmes.CodFilme Aluguel_filmes.NumQuantidade 
          Aluguel_filmes.ValTotal 
      WITH FRAME f-cad IN WINDOW C-Win.
  IF AVAILABLE Filmes THEN 
    DISPLAY Filmes.NomFilme 
      WITH FRAME f-cad IN WINDOW C-Win.
  ENABLE Aluguel_filmes.CodFilme Filmes.NomFilme Aluguel_filmes.NumQuantidade 
         Aluguel_filmes.ValTotal bt-save-movie bt-cancel-movie 
      WITH FRAME f-cad IN WINDOW C-Win.
  {&OPEN-BROWSERS-IN-QUERY-f-cad}
  VIEW C-Win.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE pi-mostra-dados C-Win 
PROCEDURE pi-mostra-dados :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/

    DISABLE filmes.NomFilme
            aluguel_filmes.ValTotal
            WITH FRAME f-cad.

    RUN pi-posiciona-registro.
    
    IF  pOpcao = "upd"
    AND AVAIL aluguel_filmes THEN DO:
        DISPLAY aluguel_filmes.codfilme
                aluguel_filmes.NumQuantidade
                aluguel_filmes.ValTotal
                WITH FRAME f-cad.
        APPLY "leave" TO aluguel_filmes.codfilme IN FRAME f-cad.                         
    END.
    ELSE
        CLEAR FRAME f-cad.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE pi-posiciona-registro C-Win 
PROCEDURE pi-posiciona-registro :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/

    FIND FIRST alugueis
        WHERE ROWID(alugueis) = r-aluguel NO-LOCK NO-ERROR.
    IF pOpcao = "upd" THEN DO:
        FIND FIRST aluguel_filmes
            WHERE ROWID(aluguel_filme) = r-filme NO-LOCK NO-ERROR.
    END.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE pi-save C-Win 
PROCEDURE pi-save :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
    DEFINE VARIABLE dValAluguel AS DECIMAL NO-UNDO.
    
    FIND FIRST filmes
        WHERE filmes.codfilme = INPUT FRAME f-cad aluguel_filmes.codfilme NO-LOCK NO-ERROR.
    IF NOT AVAIL filmes THEN DO:
        MESSAGE "Código de filme não encontrado!"
                VIEW-AS ALERT-BOX ERROR.
        APPLY "entry" TO aluguel_filmes.codfilme IN FRAME f-cad.
        RETURN "NOK".
    END.
    
    IF pOpcao = "add" THEN DO:
        ASSIGN iseqitem = NEXT-VALUE(SeqItem).
        CREATE aluguel_filmes.
        ASSIGN aluguel_filmes.coditem = iseqitem
               aluguel_filmes.codaluguel = alugueis.codaluguel
               aluguel_filmes.codfilme = INPUT FRAME f-cad aluguel_filmes.codfilme
               aluguel_filmes.numquantidade = INPUT FRAME f-cad aluguel_filmes.numquantidade
               aluguel_filmes.valtotal = INPUT FRAME f-cad aluguel_filmes.valtotal.
               
    END.
    ELSE DO:
       FIND CURRENT aluguel_filmes EXCLUSIVE-LOCK NO-ERROR.
       ASSIGN aluguel_filmes.coditem = iseqitem
              aluguel_filmes.numquantidade = INPUT FRAME f-cad aluguel_filmes.numquantidade
              aluguel_filmes.valtotal = INPUT FRAME f-cad aluguel_filmes.valtotal.
    END.    
    
    ASSIGN dValAluguel = 0.
    FOR EACH aluguel_filmes
        WHERE aluguel_filmes.codaluguel = alugueis.codaluguel NO-LOCK:
        ASSIGN dValAluguel = dValAluguel + aluguel_filmes.valtotal.
    END.
    FIND FIRST bf-alugueis EXCLUSIVE-LOCK
        WHERE bf-alugueis.codaluguel = alugueis.codaluguel NO-ERROR.
    IF AVAIL bf-alugueis THEN DO:
        ASSIGN bf-alugueis.valAluguel = dValAluguel. 
    END.
    
    RETURN "OK".

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

