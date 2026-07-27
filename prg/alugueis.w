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

/* Local Variable Definitions ---                                       */

DEFINE VARIABLE iCodAluguel AS INTEGER NO-UNDO.
DEFINE VARIABLE cOpcao AS CHARACTER NO-UNDO.

DEFINE BUFFER bf-alugueis FOR alugueis.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Window
&Scoped-define DB-AWARE no

/* Name of designated FRAME-NAME and/or first browse and/or first query */
&Scoped-define FRAME-NAME f-cad
&Scoped-define BROWSE-NAME br-filme

/* Internal Tables (found by Frame, Query & Browse Queries)             */
&Scoped-define INTERNAL-TABLES Aluguel_filmes Filmes Alugueis Clientes Cidades

/* Definitions for BROWSE br-filme                                      */
&Scoped-define FIELDS-IN-QUERY-br-filme Aluguel_filmes.CodItem Aluguel_filmes.CodFilme Aluguel_filmes.NumQuantidade Filmes.ValFilme Aluguel_filmes.ValTotal   
&Scoped-define ENABLED-FIELDS-IN-QUERY-br-filme   
&Scoped-define SELF-NAME br-filme
&Scoped-define QUERY-STRING-br-filme FOR EACH Aluguel_filmes NO-LOCK         WHERE AVAILABLE Alugueis AND Aluguel_filmes.CodAluguel = Alugueis.CodAluguel, ~
               EACH Filmes NO-LOCK WHERE Filmes.CodFilme = Aluguel_filmes.CodFilme INDEXED-REPOSITION
&Scoped-define OPEN-QUERY-br-filme OPEN QUERY {&SELF-NAME}     FOR EACH Aluguel_filmes NO-LOCK         WHERE AVAILABLE Alugueis AND Aluguel_filmes.CodAluguel = Alugueis.CodAluguel, ~
               EACH Filmes NO-LOCK WHERE Filmes.CodFilme = Aluguel_filmes.CodFilme INDEXED-REPOSITION.
&Scoped-define TABLES-IN-QUERY-br-filme Aluguel_filmes Filmes
&Scoped-define FIRST-TABLE-IN-QUERY-br-filme Aluguel_filmes
&Scoped-define SECOND-TABLE-IN-QUERY-br-filme Filmes


/* Definitions for FRAME f-cad                                          */
&Scoped-define FIELDS-IN-QUERY-f-cad Alugueis.CodAluguel ~
Alugueis.DatAluguel Alugueis.CodCliente Alugueis.Observacao 
&Scoped-define ENABLED-FIELDS-IN-QUERY-f-cad Alugueis.CodAluguel ~
Alugueis.DatAluguel Alugueis.CodCliente Alugueis.Observacao 
&Scoped-define ENABLED-TABLES-IN-QUERY-f-cad Alugueis
&Scoped-define FIRST-ENABLED-TABLE-IN-QUERY-f-cad Alugueis
&Scoped-define OPEN-BROWSERS-IN-QUERY-f-cad ~
    ~{&OPEN-QUERY-br-filme}
&Scoped-define QUERY-STRING-f-cad FOR EACH Alugueis SHARE-LOCK
&Scoped-define OPEN-QUERY-f-cad OPEN QUERY f-cad FOR EACH Alugueis SHARE-LOCK.
&Scoped-define TABLES-IN-QUERY-f-cad Alugueis
&Scoped-define FIRST-TABLE-IN-QUERY-f-cad Alugueis


/* Standard List Definitions                                            */
&Scoped-Define ENABLED-FIELDS Alugueis.CodAluguel Alugueis.DatAluguel ~
Alugueis.CodCliente Alugueis.Observacao 
&Scoped-define ENABLED-TABLES Alugueis
&Scoped-define FIRST-ENABLED-TABLE Alugueis
&Scoped-Define ENABLED-OBJECTS RECT-5 RECT-6 RECT-7 bt-first bt-prev ~
bt-next bt-last bt-add bt-upd bt-del bt-save bt-cancel bt-export bt-exit ~
br-filme bt-addfilm bt-updfilm bt-delfilm 
&Scoped-Define DISPLAYED-FIELDS Alugueis.CodAluguel Alugueis.DatAluguel ~
Alugueis.CodCliente Clientes.NomCliente Clientes.Endereco ~
Clientes.CodCidade Cidades.NomCidade Alugueis.Observacao 
&Scoped-define DISPLAYED-TABLES Alugueis Clientes Cidades
&Scoped-define FIRST-DISPLAYED-TABLE Alugueis
&Scoped-define SECOND-DISPLAYED-TABLE Clientes
&Scoped-define THIRD-DISPLAYED-TABLE Cidades


/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME



/* ***********************  Control Definitions  ********************** */

/* Define the widget handle for the window                              */
DEFINE VARIABLE C-Win AS WIDGET-HANDLE NO-UNDO.

/* Definitions of the field level widgets                               */
DEFINE BUTTON bt-add 
     LABEL "Adicionar" 
     SIZE 10.4 BY 1.19
     BGCOLOR 15 FGCOLOR 0 .

DEFINE BUTTON bt-addfilm 
     LABEL "Adicionar" 
     SIZE 13 BY .95
     BGCOLOR 15 .

DEFINE BUTTON bt-cancel 
     LABEL "Cancelar" 
     SIZE 10.4 BY 1.19
     BGCOLOR 15 FGCOLOR 0 .

DEFINE BUTTON bt-del 
     LABEL "Eliminar" 
     SIZE 10.4 BY 1.19
     BGCOLOR 15 FGCOLOR 0 .

DEFINE BUTTON bt-delfilm 
     LABEL "Eliminar" 
     SIZE 13 BY .95
     BGCOLOR 15 .

DEFINE BUTTON bt-exit 
     LABEL "Sair" 
     SIZE 10.4 BY 1.19
     BGCOLOR 15 FGCOLOR 0 .

DEFINE BUTTON bt-export 
     LABEL "Exportar" 
     SIZE 10.4 BY 1.19
     BGCOLOR 15 FGCOLOR 0 .

DEFINE BUTTON bt-first 
     LABEL "<<" 
     SIZE 5 BY 1.19
     BGCOLOR 15 FGCOLOR 0 .

DEFINE BUTTON bt-last 
     LABEL ">>" 
     SIZE 5 BY 1.19
     BGCOLOR 15 FGCOLOR 0 .

DEFINE BUTTON bt-next 
     LABEL ">" 
     SIZE 5 BY 1.19
     BGCOLOR 15 FGCOLOR 0 .

DEFINE BUTTON bt-prev 
     LABEL "<" 
     SIZE 5 BY 1.19
     BGCOLOR 15 FGCOLOR 0 .

DEFINE BUTTON bt-save 
     LABEL "Salvar" 
     SIZE 10.4 BY 1.19
     BGCOLOR 15 FGCOLOR 0 .

DEFINE BUTTON bt-upd 
     LABEL "Modificar" 
     SIZE 10.4 BY 1.19
     BGCOLOR 15 FGCOLOR 0 .

DEFINE BUTTON bt-updfilm 
     LABEL "Modificar" 
     SIZE 13 BY .95
     BGCOLOR 15 .

DEFINE RECTANGLE RECT-5
     EDGE-PIXELS 2 GRAPHIC-EDGE    ROUNDED 
     SIZE 122 BY 2.38
     BGCOLOR 15 FGCOLOR 15 .

DEFINE RECTANGLE RECT-6
     EDGE-PIXELS 2 GRAPHIC-EDGE    ROUNDED 
     SIZE 120 BY 19.76
     BGCOLOR 15 FGCOLOR 15 .

DEFINE RECTANGLE RECT-7
     EDGE-PIXELS 2 GRAPHIC-EDGE  NO-FILL   
     SIZE 117 BY 11.91.

/* Query definitions                                                    */
&ANALYZE-SUSPEND
DEFINE QUERY br-filme FOR 
      Aluguel_filmes, 
      Filmes SCROLLING.

DEFINE QUERY f-cad FOR 
      Alugueis SCROLLING.
&ANALYZE-RESUME

/* Browse definitions                                                   */
DEFINE BROWSE br-filme
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _DISPLAY-FIELDS br-filme C-Win _FREEFORM
  QUERY br-filme NO-LOCK DISPLAY
      Aluguel_filmes.CodItem FORMAT ">>>>9":U
      Aluguel_filmes.CodFilme FORMAT "->>>>9":U
      Aluguel_filmes.NumQuantidade FORMAT "->>>>9":U
      Filmes.ValFilme FORMAT ">>>>>>>9.99":U
      Aluguel_filmes.ValTotal FORMAT ">>>>>>>9.99":U WIDTH 20
/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME
    WITH NO-ROW-MARKERS SEPARATORS SIZE 110 BY 9.05
         BGCOLOR 15 FGCOLOR 0  FIT-LAST-COLUMN.


/* ************************  Frame Definitions  *********************** */

DEFINE FRAME f-cad
     bt-first AT ROW 1.81 COL 3.4 WIDGET-ID 6
     bt-prev AT ROW 1.81 COL 9 WIDGET-ID 20
     bt-next AT ROW 1.81 COL 14.4 WIDGET-ID 22
     bt-last AT ROW 1.81 COL 20 WIDGET-ID 24
     bt-add AT ROW 1.81 COL 26.6 WIDGET-ID 26
     bt-upd AT ROW 1.81 COL 37 WIDGET-ID 28
     bt-del AT ROW 1.81 COL 47.4 WIDGET-ID 30
     bt-save AT ROW 1.81 COL 61 WIDGET-ID 32
     bt-cancel AT ROW 1.81 COL 71.8 WIDGET-ID 34
     bt-export AT ROW 1.81 COL 83.6 WIDGET-ID 36
     bt-exit AT ROW 1.81 COL 111 WIDGET-ID 40
     Alugueis.CodAluguel AT ROW 6.24 COL 18.8 COLON-ALIGNED WIDGET-ID 120
          LABEL "Aluguel"
          VIEW-AS FILL-IN 
          SIZE 11 BY 1
     Alugueis.DatAluguel AT ROW 6.24 COL 36.4 COLON-ALIGNED WIDGET-ID 124
          VIEW-AS FILL-IN 
          SIZE 19 BY 1
     Alugueis.CodCliente AT ROW 7.38 COL 18.8 COLON-ALIGNED NO-LABEL WIDGET-ID 92
          VIEW-AS FILL-IN 
          SIZE 11 BY 1
     Clientes.NomCliente AT ROW 7.38 COL 30.6 COLON-ALIGNED NO-LABEL WIDGET-ID 94
          VIEW-AS FILL-IN 
          SIZE 38 BY 1
     Clientes.Endereco AT ROW 8.57 COL 18.8 COLON-ALIGNED WIDGET-ID 116
          VIEW-AS FILL-IN 
          SIZE 51 BY 1
     Clientes.CodCidade AT ROW 9.76 COL 18.8 COLON-ALIGNED WIDGET-ID 122
          LABEL "Cidade"
          VIEW-AS FILL-IN 
          SIZE 11 BY 1
     Cidades.NomCidade AT ROW 9.76 COL 30.4 COLON-ALIGNED NO-LABEL WIDGET-ID 110
          VIEW-AS FILL-IN 
          SIZE 39 BY 1
     Alugueis.Observacao AT ROW 11 COL 18.8 COLON-ALIGNED WIDGET-ID 126
          VIEW-AS FILL-IN 
          SIZE 52 BY 1
     br-filme AT ROW 13.62 COL 8 WIDGET-ID 200
     bt-addfilm AT ROW 22.67 COL 8 WIDGET-ID 104
     bt-updfilm AT ROW 22.67 COL 21.4 WIDGET-ID 106
     bt-delfilm AT ROW 22.67 COL 34.8 WIDGET-ID 108
     "Cliente:" VIEW-AS TEXT
          SIZE 7 BY 1 AT ROW 7.38 COL 13.2 WIDGET-ID 112
     RECT-5 AT ROW 1.24 COL 2 WIDGET-ID 2
     RECT-6 AT ROW 5.05 COL 3 WIDGET-ID 4
     RECT-7 AT ROW 12.67 COL 5 WIDGET-ID 102
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COLUMN 1 ROW 1
         SIZE 124 BY 24.1
         BGCOLOR 8  WIDGET-ID 100.


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
         TITLE              = "Cadastro de Aluguéis e Filmes Alugados"
         HEIGHT             = 24.48
         WIDTH              = 125.4
         MAX-HEIGHT         = 26.05
         MAX-WIDTH          = 161
         VIRTUAL-HEIGHT     = 26.05
         VIRTUAL-WIDTH      = 161
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
/* BROWSE-TAB br-filme Observacao f-cad */
ASSIGN 
       br-filme:SEPARATOR-FGCOLOR IN FRAME f-cad      = 0.

/* SETTINGS FOR FILL-IN Alugueis.CodAluguel IN FRAME f-cad
   EXP-LABEL                                                            */
/* SETTINGS FOR FILL-IN Clientes.CodCidade IN FRAME f-cad
   NO-ENABLE EXP-LABEL                                                  */
/* SETTINGS FOR FILL-IN Clientes.Endereco IN FRAME f-cad
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN Cidades.NomCidade IN FRAME f-cad
   NO-ENABLE                                                            */
/* SETTINGS FOR FILL-IN Clientes.NomCliente IN FRAME f-cad
   NO-ENABLE                                                            */
IF SESSION:DISPLAY-TYPE = "GUI":U AND VALID-HANDLE(C-Win)
THEN C-Win:HIDDEN = no.

/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME


/* Setting information for Queries and Browse Widgets fields            */

&ANALYZE-SUSPEND _QUERY-BLOCK BROWSE br-filme
/* Query rebuild information for BROWSE br-filme
     _START_FREEFORM
OPEN QUERY {&SELF-NAME}
    FOR EACH Aluguel_filmes NO-LOCK
        WHERE AVAILABLE Alugueis AND Aluguel_filmes.CodAluguel = Alugueis.CodAluguel,
        EACH Filmes NO-LOCK WHERE Filmes.CodFilme = Aluguel_filmes.CodFilme INDEXED-REPOSITION.
     _END_FREEFORM
     _Options          = "NO-LOCK INDEXED-REPOSITION"
     _Query            is OPENED
*/  /* BROWSE br-filme */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _QUERY-BLOCK FRAME f-cad
/* Query rebuild information for FRAME f-cad
     _TblList          = "videloc.Alugueis"
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


&Scoped-define SELF-NAME bt-add
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-add C-Win
ON CHOOSE OF bt-add IN FRAME f-cad /* Adicionar */
DO:
   ASSIGN iCodAluguel = NEXT-VALUE(SeqAluguel).
   CLEAR FRAME f-cad.
   DISP iCodAluguel @ Alugueis.CodAluguel  WITH FRAME f-cad.
   RUN pi-habilita2 (INPUT "add").
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-addfilm
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-addfilm C-Win
ON CHOOSE OF bt-addfilm IN FRAME f-cad /* Adicionar */
DO:
    RUN prg\aluguel02.w (INPUT ROWID(alugueis),
                         INPUT IF AVAIL aluguel_filmes THEN ROWID(aluguel_filmes) ELSE ?,
                         INPUT "add").    
    RUN pi-open-query-filme.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-cancel
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-cancel C-Win
ON CHOOSE OF bt-cancel IN FRAME f-cad /* Cancelar */
DO:
    RUN pi-habilita2 ("").
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-del
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-del C-Win
ON CHOOSE OF bt-del IN FRAME f-cad /* Eliminar */
DO:
    DEF VAR lResp AS LOGICAL NO-UNDO INITIAL NO.
    MESSAGE "Deseja eliminar o aluguel" alugueis.codaluguel "?"
            UPDATE lResp
            VIEW-AS ALERT-BOX QUESTION BUTTONS YES-NO
                TITLE "Eliminacao".
    IF  lResp = YES THEN DO:    
        FIND CURRENT alugueis EXCLUSIVE-LOCK NO-ERROR.
        
        FOR EACH aluguel_filmes 
            WHERE aluguel_filmes.codaluguel = alugueis.codaluguel EXCLUSIVE-LOCK:
            DELETE aluguel_filmes.
        END.
        
        DELETE alugueis.
        APPLY "choose" TO bt-prev.
    END.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-delfilm
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-delfilm C-Win
ON CHOOSE OF bt-delfilm IN FRAME f-cad /* Eliminar */
DO:
    DEF VAR lResp AS LOGICAL NO-UNDO INITIAL NO.
    MESSAGE "Deseja eliminar o filme" filmes.NomFilme "?"
            UPDATE lResp
            VIEW-AS ALERT-BOX QUESTION BUTTONS YES-NO
                TITLE "Eliminacao".
    IF  lResp = YES THEN DO:
        FIND CURRENT aluguel_filmes EXCLUSIVE-LOCK NO-ERROR.
        DELETE aluguel_filmes.
        RUN pi-open-query-filme.            
    END.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-exit
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-exit C-Win
ON CHOOSE OF bt-exit IN FRAME f-cad /* Sair */
DO:
   APPLY "close".  
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-first
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-first C-Win
ON CHOOSE OF bt-first IN FRAME f-cad /* << */
DO:
    RUN pi-posiciona-registro (INPUT "first").
    RUN pi-mostra-dados.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-last
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-last C-Win
ON CHOOSE OF bt-last IN FRAME f-cad /* >> */
DO:
    RUN pi-posiciona-registro (INPUT "last").
    RUN pi-mostra-dados.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-next
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-next C-Win
ON CHOOSE OF bt-next IN FRAME f-cad /* > */
DO:
    RUN pi-posiciona-registro (INPUT "next").
    RUN pi-mostra-dados.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-prev
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-prev C-Win
ON CHOOSE OF bt-prev IN FRAME f-cad /* < */
DO:
    RUN pi-posiciona-registro (INPUT "prev").
    RUN pi-mostra-dados.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-save
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-save C-Win
ON CHOOSE OF bt-save IN FRAME f-cad /* Salvar */
DO:
   RUN pi-save (cOpcao).
   
   IF RETURN-VALUE = "NOK" THEN DO:
       RETURN NO-APPLY.
   END.
   
   RUN pi-habilita2 ("").
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-upd
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-upd C-Win
ON CHOOSE OF bt-upd IN FRAME f-cad /* Modificar */
DO:
  RUN pi-habilita2 ("upd").
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-updfilm
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-updfilm C-Win
ON CHOOSE OF bt-updfilm IN FRAME f-cad /* Modificar */
DO:
    RUN prg\aluguel02.w (INPUT ROWID(alugueis),
                         INPUT IF AVAIL aluguel_filmes THEN ROWID(aluguel_filmes) ELSE ?,
                         INPUT "upd").    
    RUN pi-open-query-filme.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME Alugueis.CodCliente
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL Alugueis.CodCliente C-Win
ON LEAVE OF Alugueis.CodCliente IN FRAME f-cad /* Código */
DO:
    FIND FIRST clientes
        WHERE clientes.codcliente = INPUT FRAME f-cad alugueis.codcliente NO-ERROR.
    IF AVAIL clientes THEN DO:    
        FIND FIRST cidades
            WHERE cidades.codcidade = clientes.codcidade NO-LOCK NO-ERROR.            
    END. 
    
    RUN pi-mostra-dados-cliente.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define BROWSE-NAME br-filme
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
  
  RUN pi-habilita2 ("").
  APPLY "choose" TO bt-first.
  
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
  IF AVAILABLE Alugueis THEN 
    DISPLAY Alugueis.CodAluguel Alugueis.DatAluguel Alugueis.CodCliente 
          Alugueis.Observacao 
      WITH FRAME f-cad IN WINDOW C-Win.
  IF AVAILABLE Cidades THEN 
    DISPLAY Cidades.NomCidade 
      WITH FRAME f-cad IN WINDOW C-Win.
  IF AVAILABLE Clientes THEN 
    DISPLAY Clientes.NomCliente Clientes.Endereco Clientes.CodCidade 
      WITH FRAME f-cad IN WINDOW C-Win.
  ENABLE RECT-5 RECT-6 RECT-7 bt-first bt-prev bt-next bt-last bt-add bt-upd 
         bt-del bt-save bt-cancel bt-export bt-exit Alugueis.CodAluguel 
         Alugueis.DatAluguel Alugueis.CodCliente Alugueis.Observacao br-filme 
         bt-addfilm bt-updfilm bt-delfilm 
      WITH FRAME f-cad IN WINDOW C-Win.
  {&OPEN-BROWSERS-IN-QUERY-f-cad}
  VIEW C-Win.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE pi-habilita C-Win 
PROCEDURE pi-habilita :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
    DEF INPUT PARAM pOpcao AS CHAR NO-UNDO.

    ASSIGN cOpcao = pOpcao.
    
    IF  pOpcao = "add" 
    OR  pOpcao = "upd" THEN DO:
        DISABLE bt-first bt-prev bt-next bt-last
                bt-add bt-upd bt-del bt-export bt-exit
                WITH FRAME f-cad.
        ENABLE bt-save bt-cancel WITH FRAME f-cad.
        ENABLE Alugueis.CodAluguel 
               Alugueis.DatAluguel
               Alugueis.CodCliente
               Alugueis.Observacao WITH FRAME f-cad.
        IF pOpcao = "upd" THEN
            DISABLE Alugueis.CodAluguel WITH FRAME f-cad.
    END.
    ELSE DO:
        DISABLE ALL WITH FRAME f-cad.
        ENABLE bt-first bt-prev bt-next bt-last
               bt-add bt-upd bt-del bt-export bt-exit 
               WITH FRAME f-cad.
    END.


END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE pi-habilita2 C-Win 
PROCEDURE pi-habilita2 :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/

DEF INPUT PARAM pOpcao AS CHAR NO-UNDO.

    DEF VAR lHabilita AS LOGICAL NO-UNDO INITIAL FALSE.

    ASSIGN cOpcao = pOpcao.

    IF  pOpcao = "add" 
    OR  pOpcao = "upd" THEN DO:
        ASSIGN lHabilita = TRUE.
    END.
    
    ASSIGN bt-first:SENSITIVE IN FRAME f-cad = NOT lHabilita
           bt-prev:SENSITIVE IN FRAME f-cad = NOT lHabilita
           bt-next:SENSITIVE IN FRAME f-cad = NOT lHabilita
           bt-last:SENSITIVE IN FRAME f-cad = NOT lHabilita
           bt-add:SENSITIVE IN FRAME f-cad = NOT lHabilita
           bt-upd:SENSITIVE IN FRAME f-cad = NOT lHabilita
           bt-del:SENSITIVE IN FRAME f-cad = NOT lHabilita
           bt-export:SENSITIVE IN FRAME f-cad = NOT lHabilita
           bt-exit:SENSITIVE IN FRAME f-cad = NOT lHabilita.
           
    ASSIGN bt-save:SENSITIVE IN FRAME f-cad = lHabilita
           bt-cancel:SENSITIVE IN FRAME f-cad = lHabilita.

    ASSIGN  Alugueis.CodAluguel:SENSITIVE IN FRAME f-cad = lHabilita 
            Alugueis.CodCliente:SENSITIVE IN FRAME f-cad = lHabilita  
            Alugueis.DatAluguel:SENSITIVE IN FRAME f-cad = lHabilita  
            Alugueis.Observacao:SENSITIVE IN FRAME f-cad = lHabilita.

    IF  pOpcao = "add" THEN
        ASSIGN Alugueis.CodAluguel:SENSITIVE IN FRAME f-cad = TRUE.
    ELSE
        ASSIGN Alugueis.CodAluguel:SENSITIVE IN FRAME f-cad = FALSE.

    IF  cOpcao = "" THEN DO:
        FIND CURRENT alugueis NO-LOCK NO-ERROR.
        IF AVAIL alugueis THEN DO:
            DISPLAY alugueis WITH FRAME f-cad.          
        END.
        ELSE 
            APPLY "choose" TO bt-prev.  
    END.
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

    IF  AVAIL alugueis THEN DO:
        DISP alugueis WITH FRAME f-cad.        
    END.
    ELSE
        CLEAR FRAME f-cad.

    RUN pi-mostra-dados-cliente.
    RUN pi-open-query-filme.
    
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE pi-mostra-dados-cliente C-Win 
PROCEDURE pi-mostra-dados-cliente :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
    IF AVAIL clientes THEN DO:
        DISPLAY clientes.nomcliente
                clientes.endereco
                clientes.codCidade
                WITH FRAME f-cad.
                
        IF AVAIL cidades THEN
            DISPLAY cidades.nomcidade WITH FRAME f-cad.
    END.
    ELSE
        DISPLAY "" @ clientes.nomcliente
                "" @ clientes.endereco
                "" @ clientes.codCidade
                "" @ cidades.nomcidade
                WITH FRAME f-cad.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE pi-open-query-filme C-Win 
PROCEDURE pi-open-query-filme :
/*------------------------------------------------------------------------------
  Purpose: Reabre o browse de filmes conforme o aluguel corrente da tela.
------------------------------------------------------------------------------*/
    IF AVAILABLE Alugueis THEN DO:
        OPEN QUERY br-filme
            FOR EACH Aluguel_filmes NO-LOCK
                WHERE Aluguel_filmes.CodAluguel = Alugueis.CodAluguel,
                EACH Filmes NO-LOCK
                    WHERE Filmes.CodFilme = Aluguel_filmes.CodFilme
                    INDEXED-REPOSITION.
    END.
    ELSE DO:
        OPEN QUERY br-filme
            FOR EACH Aluguel_filmes NO-LOCK
                WHERE Aluguel_filmes.CodAluguel = -1,
                EACH Filmes NO-LOCK
                    WHERE Filmes.CodFilme = Aluguel_filmes.CodFilme
                    INDEXED-REPOSITION.
    END.
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

    DEF INPUT PARAM pNavega AS CHAR NO-UNDO.
    
    CASE pNavega:
        WHEN "first" THEN DO:
            FIND FIRST alugueis NO-LOCK NO-ERROR.
        END.
        WHEN "last" THEN DO:
            FIND LAST alugueis NO-LOCK NO-ERROR.
        END.
        WHEN "next" THEN DO:
            FIND NEXT alugueis NO-LOCK NO-ERROR.
            IF  NOT AVAIL alugueis THEN DO:
                APPLY "choose" TO bt-first IN FRAME f-cad.
            END.
        END.
        WHEN "prev" THEN DO:
            FIND PREV alugueis NO-LOCK NO-ERROR.
            IF  NOT AVAIL alugueis THEN DO:
                RUN pi-posiciona-registro (INPUT "last").
            END.
        END.
    END CASE.
    IF AVAIL alugueis THEN DO:
        FIND FIRST clientes 
            WHERE clientes.codcliente = alugueis.codcliente NO-LOCK  NO-ERROR.
        IF AVAIL clientes THEN DO:    
            FIND FIRST cidades
                WHERE cidades.codcidade = clientes.codcidade NO-LOCK NO-ERROR.            
        END.        
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

    DEF INPUT PARAM pOpcao AS CHAR NO-UNDO.

    IF pOpcao = "add" THEN DO:        
        FIND FIRST bf-alugueis NO-LOCK
            WHERE bf-alugueis.codAluguel = INPUT FRAME f-cad alugueis.codAluguel NO-ERROR.
        IF AVAIL bf-alugueis THEN DO:
            MESSAGE "Código de aluguel já existente!"
                    VIEW-AS ALERT-BOX ERROR.
            APPLY "entry" TO alugueis.codAluguel IN FRAME f-cad.
            RETURN "NOK".
        END.            
    END.
    
    FIND FIRST clientes
        WHERE clientes.codcliente = INPUT FRAME f-cad alugueis.codcliente NO-ERROR.
    IF NOT AVAIL clientes THEN DO:
        MESSAGE "Cliente não cadastrado!"
                VIEW-AS ALERT-BOX ERROR.
        APPLY "entry" TO alugueis.codcliente IN FRAME f-cad.
        RETURN "NOK".                                
    END.

    FIND FIRST alugueis EXCLUSIVE-LOCK
        WHERE alugueis.codAluguel = INPUT FRAME f-cad alugueis.codAluguel NO-ERROR.
    IF NOT AVAIL alugueis THEN DO:
        CREATE alugueis.
        ASSIGN alugueis.codaluguel = INPUT FRAME f-cad alugueis.codaluguel.
    END.

    ASSIGN alugueis.dataluguel = INPUT FRAME f-cad alugueis.dataluguel
           alugueis.codcliente = INPUT FRAME f-cad alugueis.codcliente
           alugueis.observacao = INPUT FRAME f-cad alugueis.observacao.
    
/*    
    CASE pOpcao:
        WHEN "add" THEN DO WITH FRAME f-cad:
        
            FIND FIRST bf-alugueis NO-LOCK
                WHERE bf-alugueis.codAluguel = INPUT 
                    FRAME f-cad alugueis.codAluguel NO-ERROR.
            IF AVAIL bf-alugueis THEN DO:
                MESSAGE "Código de aluguel já existente!"
                        VIEW-AS ALERT-BOX ERROR.
                APPLY "entry" TO alugueis.codAluguel IN FRAME f-cad.
                RETURN "NOK".
            END.            
        
            FIND FIRST clientes
                WHERE clientes.codcliente = 
                    INPUT FRAME f-cad alugueis.codcliente NO-ERROR.
            IF NOT AVAIL clientes THEN DO:
                MESSAGE "Cliente não cadastrado!"
                        VIEW-AS ALERT-BOX ERROR.
                APPLY "entry" TO alugueis.codcliente IN FRAME f-cad.
                RETURN "NOK".                                
            END.
        
            CREATE alugueis.
            ASSIGN alugueis.codaluguel = INPUT FRAME f-cad alugueis.codaluguel
                   alugueis.dataluguel = INPUT FRAME f-cad alugueis.dataluguel
                   alugueis.codcliente = INPUT FRAME f-cad alugueis.codcliente
                   alugueis.observacao = INPUT FRAME f-cad alugueis.observacao.                   
        END.
        WHEN "upd" THEN DO WITH FRAME f-cad:
            FIND CURRENT alugueis EXCLUSIVE-LOCK NO-ERROR.
            ASSIGN alugueis.dataluguel = INPUT FRAME f-cad alugueis.dataluguel
                   alugueis.codcliente = INPUT FRAME f-cad alugueis.codcliente
                   alugueis.observacao = INPUT FRAME f-cad alugueis.observacao.        END.
    END CASE.
*/    
    RETURN "OK".
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

