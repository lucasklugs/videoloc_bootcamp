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

DEFINE VARIABLE iCodCliente AS INTEGER NO-UNDO.
DEFINE VARIABLE cOpcao AS CHARACTER NO-UNDO.

DEFINE BUFFER bf-clientes FOR clientes.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Window
&Scoped-define DB-AWARE no

/* Name of designated FRAME-NAME and/or first browse and/or first query */
&Scoped-define FRAME-NAME f-cad

/* Internal Tables (found by Frame, Query & Browse Queries)             */
&Scoped-define INTERNAL-TABLES Cidades

/* Definitions for FRAME f-cad                                          */
&Scoped-define FIELDS-IN-QUERY-f-cad Cidades.NomCidade 
&Scoped-define QUERY-STRING-f-cad FOR EACH Cidades SHARE-LOCK
&Scoped-define OPEN-QUERY-f-cad OPEN QUERY f-cad FOR EACH Cidades SHARE-LOCK.
&Scoped-define TABLES-IN-QUERY-f-cad Cidades
&Scoped-define FIRST-TABLE-IN-QUERY-f-cad Cidades


/* Standard List Definitions                                            */
&Scoped-Define ENABLED-FIELDS Clientes.CodCliente Clientes.NomCliente ~
Clientes.Endereco Clientes.CodCidade Clientes.Observacao 
&Scoped-define ENABLED-TABLES Clientes
&Scoped-define FIRST-ENABLED-TABLE Clientes
&Scoped-Define ENABLED-OBJECTS RECT-5 RECT-6 bt-first bt-prev bt-next ~
bt-last bt-add bt-upd bt-del bt-save bt-cancel bt-export bt-exit 
&Scoped-Define DISPLAYED-FIELDS Clientes.CodCliente Clientes.NomCliente ~
Clientes.Endereco Clientes.CodCidade Cidades.NomCidade Clientes.Observacao 
&Scoped-define DISPLAYED-TABLES Clientes Cidades
&Scoped-define FIRST-DISPLAYED-TABLE Clientes
&Scoped-define SECOND-DISPLAYED-TABLE Cidades


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

DEFINE BUTTON bt-cancel 
     LABEL "Cancelar" 
     SIZE 10.4 BY 1.19
     BGCOLOR 15 FGCOLOR 0 .

DEFINE BUTTON bt-del 
     LABEL "Eliminar" 
     SIZE 10.4 BY 1.19
     BGCOLOR 15 FGCOLOR 0 .

DEFINE BUTTON bt-exit AUTO-END-KEY 
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

DEFINE RECTANGLE RECT-5
     EDGE-PIXELS 2 GRAPHIC-EDGE    ROUNDED 
     SIZE 122 BY 2.38
     BGCOLOR 15 FGCOLOR 15 .

DEFINE RECTANGLE RECT-6
     EDGE-PIXELS 2 GRAPHIC-EDGE    ROUNDED 
     SIZE 122 BY 14.29
     BGCOLOR 15 FGCOLOR 15 .

/* Query definitions                                                    */
&ANALYZE-SUSPEND
DEFINE QUERY f-cad FOR 
      Cidades SCROLLING.
&ANALYZE-RESUME

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
     Clientes.CodCliente AT ROW 6 COL 17 COLON-ALIGNED WIDGET-ID 58
          VIEW-AS FILL-IN 
          SIZE 10.4 BY 1
          BGCOLOR 15 
     Clientes.NomCliente AT ROW 7.19 COL 17 COLON-ALIGNED WIDGET-ID 68
          VIEW-AS FILL-IN 
          SIZE 32 BY 1
          BGCOLOR 15 
     Clientes.Endereco AT ROW 8.38 COL 17 COLON-ALIGNED WIDGET-ID 72
          VIEW-AS FILL-IN 
          SIZE 52 BY 1
          BGCOLOR 15 
     Clientes.CodCidade AT ROW 9.57 COL 17 COLON-ALIGNED NO-LABEL WIDGET-ID 76
          VIEW-AS FILL-IN 
          SIZE 12 BY 1
          BGCOLOR 15 
     Cidades.NomCidade AT ROW 9.57 COL 30 COLON-ALIGNED NO-LABEL WIDGET-ID 78
          VIEW-AS FILL-IN 
          SIZE 22 BY 1
          BGCOLOR 15 
     Clientes.Observacao AT ROW 10.81 COL 17 COLON-ALIGNED WIDGET-ID 80
          VIEW-AS FILL-IN 
          SIZE 66 BY 1
          BGCOLOR 15 
     "Cidade:" VIEW-AS TEXT
          SIZE 7.2 BY 1 AT ROW 9.57 COL 11.4 WIDGET-ID 82
     RECT-5 AT ROW 1.24 COL 2 WIDGET-ID 2
     RECT-6 AT ROW 4.81 COL 2 WIDGET-ID 4
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COLUMN 1 ROW 1
         SIZE 124.4 BY 18.91
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
         TITLE              = "<insert window title>"
         HEIGHT             = 18.91
         WIDTH              = 124.4
         MAX-HEIGHT         = 25.67
         MAX-WIDTH          = 161
         VIRTUAL-HEIGHT     = 25.67
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
/* SETTINGS FOR FILL-IN Cidades.NomCidade IN FRAME f-cad
   NO-ENABLE EXP-LABEL                                                  */
IF SESSION:DISPLAY-TYPE = "GUI":U AND VALID-HANDLE(C-Win)
THEN C-Win:HIDDEN = no.

/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME


/* Setting information for Queries and Browse Widgets fields            */

&ANALYZE-SUSPEND _QUERY-BLOCK FRAME f-cad
/* Query rebuild information for FRAME f-cad
     _TblList          = "videloc.Cidades"
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
   ASSIGN iCodCliente = NEXT-VALUE(SeqCliente).
   CLEAR FRAME f-cad.
   DISP iCodCliente @ Clientes.CodCliente  WITH FRAME f-cad.
   RUN pi-habilita2 (INPUT "add").
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
    MESSAGE "Deseja eliminar o cliente" clientes.NomCliente "?"
            UPDATE lResp
            VIEW-AS ALERT-BOX QUESTION BUTTONS YES-NO
                TITLE "Eliminacao".
    IF  lResp = YES THEN DO:
        FIND FIRST alugueis NO-LOCK 
            WHERE alugueis.CodCliente = Clientes.CodCliente NO-ERROR.
        IF AVAIL alugueis THEN DO:
            MESSAGE "Este cliente tem alugueis ativos!"
                VIEW-AS ALERT-BOX ERROR BUTTONS OK.
            RETURN NO-APPLY.           
        END.
        ELSE DO:
            FIND CURRENT clientes EXCLUSIVE-LOCK NO-ERROR.
            DELETE clientes.
            APPLY "choose" TO bt-prev.            
        END.
    END.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-exit
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-exit C-Win
ON CHOOSE OF bt-exit IN FRAME f-cad /* Sair */
DO:
   APPLY "CLOSE":U TO THIS-PROCEDURE.  
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-export
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-export C-Win
ON CHOOSE OF bt-export IN FRAME f-cad /* Exportar */
DO:
    RUN prg\procedures\clientes-json-csv.p.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-first
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-first C-Win
ON CHOOSE OF bt-first IN FRAME f-cad /* << */
DO:
    RUN pi-posiciona-registro (INPUT "first").
    IF  AVAIL clientes THEN DO:
        DISP clientes WITH FRAME f-cad.
        
    END.
    ELSE
        CLEAR FRAME f-cad.
    IF AVAIL cidades THEN DO:
        DISPLAY cidades.nomcidade WITH FRAME f-cad.
        
    END.
        
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-last
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-last C-Win
ON CHOOSE OF bt-last IN FRAME f-cad /* >> */
DO:
    RUN pi-posiciona-registro (INPUT "last").
    IF  AVAIL clientes THEN DO:
        DISP clientes WITH FRAME f-cad.
    END.
    ELSE
        CLEAR FRAME f-cad.
    IF AVAIL cidades THEN DO:
        DISPLAY cidades.nomcidade WITH FRAME f-cad.
        
    END.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-next
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-next C-Win
ON CHOOSE OF bt-next IN FRAME f-cad /* > */
DO:
    RUN pi-posiciona-registro (INPUT "next").
    IF  AVAIL clientes THEN DO:
        DISP clientes WITH FRAME f-cad.
    END.
    ELSE
       CLEAR FRAME f-cad.
       
    IF AVAIL cidades THEN DO:
        DISPLAY cidades.nomcidade WITH FRAME f-cad.
    END.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-prev
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-prev C-Win
ON CHOOSE OF bt-prev IN FRAME f-cad /* < */
DO:
    RUN pi-posiciona-registro (INPUT "prev").
    IF  AVAIL clientes THEN DO:
        DISP clientes WITH FRAME f-cad.
    END.
    ELSE
       CLEAR FRAME f-cad.
    IF AVAIL cidades THEN DO:
        DISPLAY cidades.nomcidade WITH FRAME f-cad. 
    END.
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


&Scoped-define SELF-NAME Clientes.CodCidade
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL Clientes.CodCidade C-Win
ON LEAVE OF Clientes.CodCidade IN FRAME f-cad /* Código */
DO:
  FIND FIRST cidades
    WHERE cidades.codcidade = INPUT FRAME f-cad clientes.codcidade NO-LOCK NO-ERROR.
  IF AVAIL cidades THEN DO:
    DISPLAY cidades.nomcidade WITH FRAME f-cad.      
  END.
  ELSE
    DISPLAY "" @ cidades.nomcidade WITH FRAME f-cad.
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
  IF AVAILABLE Cidades THEN 
    DISPLAY Cidades.NomCidade 
      WITH FRAME f-cad IN WINDOW C-Win.
  IF AVAILABLE Clientes THEN 
    DISPLAY Clientes.CodCliente Clientes.NomCliente Clientes.Endereco 
          Clientes.CodCidade Clientes.Observacao 
      WITH FRAME f-cad IN WINDOW C-Win.
  ENABLE RECT-5 RECT-6 bt-first bt-prev bt-next bt-last bt-add bt-upd bt-del 
         bt-save bt-cancel bt-export bt-exit Clientes.CodCliente 
         Clientes.NomCliente Clientes.Endereco Clientes.CodCidade 
         Clientes.Observacao 
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
        ENABLE Clientes.CodCliente 
               Clientes.Endereco 
               Clientes.NomCliente 
               Clientes.Observacao 
               Clientes.CodCidade
               WITH FRAME f-cad.
        DISABLE Cidades.Nomcidade WITH FRAME f-cad.
        IF pOpcao = "upd" THEN
            DISABLE Clientes.CodCliente WITH FRAME f-cad.
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

    ASSIGN Clientes.Endereco:SENSITIVE IN FRAME f-cad = lHabilita
           Clientes.NomCliente:SENSITIVE IN FRAME f-cad = lHabilita 
           Clientes.Observacao:SENSITIVE IN FRAME f-cad = lHabilita 
           Clientes.CodCidade:SENSITIVE IN FRAME f-cad = lHabilita. 

    IF  pOpcao = "add" THEN
        ASSIGN Clientes.CodCliente:SENSITIVE IN FRAME f-cad = TRUE.
    ELSE
        ASSIGN Clientes.CodCliente:SENSITIVE IN FRAME f-cad = FALSE.

    IF  cOpcao = "" THEN DO:
        FIND CURRENT clientes NO-LOCK NO-ERROR.
        IF AVAIL clientes THEN DO:
            DISPLAY clientes WITH FRAME f-cad.          
        END.
        ELSE 
            APPLY "choose" TO bt-prev.  
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
            FIND FIRST clientes NO-LOCK NO-ERROR.
        END.
        WHEN "last" THEN DO:
            FIND LAST clientes NO-LOCK NO-ERROR.
        END.
        WHEN "next" THEN DO:
            FIND NEXT clientes NO-LOCK NO-ERROR.
            IF  NOT AVAIL clientes THEN DO:
                APPLY "choose" TO bt-first IN FRAME f-cad.
            END.
        END.
        WHEN "prev" THEN DO:
            FIND PREV clientes NO-LOCK NO-ERROR.             
            IF  NOT AVAIL clientes THEN DO:
                RUN pi-posiciona-registro (INPUT "last").
            END.
        END.
    END CASE.
    
    IF AVAIL clientes THEN
        FIND FIRST cidades 
           WHERE cidade.codcidade = clientes.codcidade NO-LOCK NO-ERROR.

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

    CASE pOpcao:
        WHEN "add" THEN DO WITH FRAME f-cad:
        
            FIND FIRST bf-clientes NO-LOCK
                WHERE bf-clientes.CodCliente = INPUT 
                    FRAME f-cad clientes.CodCliente NO-ERROR.
            IF AVAIL bf-clientes THEN DO:
                MESSAGE "Código de cliente já existente!"
                        VIEW-AS ALERT-BOX ERROR.
                APPLY "entry" TO clientes.CodCliente IN FRAME f-cad.
                RETURN "NOK".
            END.            
        
            FIND FIRST cidades
                WHERE cidades.codcidade = INPUT FRAME f-cad clientes.codcidade NO-ERROR.
            IF NOT AVAIL cidades THEN DO:
                MESSAGE "Cidade não cadastrada!"
                        VIEW-AS ALERT-BOX ERROR.
                APPLY "entry" TO clientes.codcidade IN FRAME f-cad.
                RETURN "NOK".                                
            END.
        
            CREATE clientes.
            ASSIGN clientes.CodCliente = INPUT FRAME f-cad clientes.CodCliente.
            ASSIGN clientes EXCEPT CodCliente.
        END.
        WHEN "upd" THEN DO WITH FRAME f-cad:
            FIND FIRST cidades
                WHERE cidades.codcidade = INPUT FRAME f-cad clientes.codcidade NO-ERROR.
            IF NOT AVAIL cidades THEN DO:
                MESSAGE "Cidade não cadastrada!"
                        VIEW-AS ALERT-BOX ERROR.
                APPLY "entry" TO clientes.codcidade IN FRAME f-cad.
                RETURN "NOK".                                
            END.
            
            FIND CURRENT clientes EXCLUSIVE-LOCK NO-ERROR.
            ASSIGN clientes EXCEPT CodCliente.
        END.
    END CASE.
    
    RETURN "OK".
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

