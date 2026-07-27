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


DEFINE VARIABLE iCodCidade AS INTEGER NO-UNDO.
DEFINE VARIABLE cOpcao AS CHARACTER NO-UNDO.

DEFINE BUFFER bf-cidades FOR cidades.

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
&Scoped-define FIELDS-IN-QUERY-f-cad Cidades.CodCidade Cidades.NomCidade ~
Cidades.CodUF 
&Scoped-define ENABLED-FIELDS-IN-QUERY-f-cad Cidades.CodCidade ~
Cidades.NomCidade Cidades.CodUF 
&Scoped-define ENABLED-TABLES-IN-QUERY-f-cad Cidades
&Scoped-define FIRST-ENABLED-TABLE-IN-QUERY-f-cad Cidades
&Scoped-define QUERY-STRING-f-cad FOR EACH Cidades SHARE-LOCK
&Scoped-define OPEN-QUERY-f-cad OPEN QUERY f-cad FOR EACH Cidades SHARE-LOCK.
&Scoped-define TABLES-IN-QUERY-f-cad Cidades
&Scoped-define FIRST-TABLE-IN-QUERY-f-cad Cidades


/* Standard List Definitions                                            */
&Scoped-Define ENABLED-FIELDS Cidades.CodCidade Cidades.NomCidade ~
Cidades.CodUF 
&Scoped-define ENABLED-TABLES Cidades
&Scoped-define FIRST-ENABLED-TABLE Cidades
&Scoped-Define ENABLED-OBJECTS RECT-5 RECT-6 bt-first bt-prev bt-next ~
bt-last bt-add bt-upd bt-del bt-save bt-cancel bt-export bt-exit 
&Scoped-Define DISPLAYED-FIELDS Cidades.CodCidade Cidades.NomCidade ~
Cidades.CodUF 
&Scoped-define DISPLAYED-TABLES Cidades
&Scoped-define FIRST-DISPLAYED-TABLE Cidades


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
     Cidades.CodCidade AT ROW 5.76 COL 12 COLON-ALIGNED WIDGET-ID 56
          VIEW-AS FILL-IN 
          SIZE 6 BY 1
     Cidades.NomCidade AT ROW 7.43 COL 12 COLON-ALIGNED WIDGET-ID 46
          VIEW-AS FILL-IN 
          SIZE 26 BY 1
     Cidades.CodUF AT ROW 9.1 COL 12 COLON-ALIGNED WIDGET-ID 54
          VIEW-AS FILL-IN 
          SIZE 6.4 BY 1
     RECT-5 AT ROW 1.24 COL 2 WIDGET-ID 2
     RECT-6 AT ROW 4.81 COL 3 WIDGET-ID 4
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
   ASSIGN iCodCidade = NEXT-VALUE(SeqCidade).
   CLEAR FRAME f-cad.
   DISP iCodCidade @ cidades.CodCidade WITH FRAME f-cad.
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
    MESSAGE "Deseja eliminar a cidade" cidades.NomCidade "?"
            UPDATE lResp
            VIEW-AS ALERT-BOX QUESTION BUTTONS YES-NO
                TITLE "Eliminacao".
    IF  lResp = YES THEN DO:
        FIND FIRST clientes NO-LOCK 
            WHERE clientes.CodCidade = cidades.CodCidade NO-ERROR.
        IF AVAIL clientes THEN DO:
            MESSAGE "Cidade em uso por cliente."
                VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
            RETURN NO-APPLY.           
        END.
        ELSE DO:
            FIND CURRENT cidades EXCLUSIVE-LOCK NO-ERROR.
            DELETE cidades.
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
    APPLY "close".
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-export
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-export C-Win
ON CHOOSE OF bt-export IN FRAME f-cad /* Exportar */
DO:
   RUN prg\procedures\cidade-json.p.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-first
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-first C-Win
ON CHOOSE OF bt-first IN FRAME f-cad /* << */
DO:                                             
    RUN pi-posiciona-registro (INPUT "first").
    IF  AVAIL cidades THEN DO:
        DISP cidades WITH FRAME f-cad.
    END.
    ELSE
        CLEAR FRAME f-cad.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-last
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-last C-Win
ON CHOOSE OF bt-last IN FRAME f-cad /* >> */
DO:
    RUN pi-posiciona-registro (INPUT "last").
    IF  AVAIL cidades THEN DO:
        DISP cidades WITH FRAME f-cad.
    END.
    ELSE
        CLEAR FRAME f-cad.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-next
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-next C-Win
ON CHOOSE OF bt-next IN FRAME f-cad /* > */
DO:
    RUN pi-posiciona-registro (INPUT "next").
    IF  AVAIL cidades THEN DO:
        DISP cidades WITH FRAME f-cad.
    END.
    ELSE
       CLEAR FRAME f-cad.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-prev
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-prev C-Win
ON CHOOSE OF bt-prev IN FRAME f-cad /* < */
DO:
    RUN pi-posiciona-registro (INPUT "prev").
    IF  AVAIL cidades THEN DO:
        DISP cidades WITH FRAME f-cad.
    END.
    ELSE
       CLEAR FRAME f-cad.
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
    DISPLAY Cidades.CodCidade Cidades.NomCidade Cidades.CodUF 
      WITH FRAME f-cad IN WINDOW C-Win.
  ENABLE RECT-5 RECT-6 bt-first bt-prev bt-next bt-last bt-add bt-upd bt-del 
         bt-save bt-cancel bt-export bt-exit Cidades.CodCidade 
         Cidades.NomCidade Cidades.CodUF 
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
        ENABLE Cidades.CodCidade
               Cidades.NomCidade 
               Cidades.CodUF                
               WITH FRAME f-cad.
        IF pOpcao = "upd" THEN
            DISABLE Cidades.CodCidade WITH FRAME f-cad.
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

    ASSIGN Cidades.NomCidade:SENSITIVE IN FRAME f-cad = lHabilita 
           Cidades.CodUF:SENSITIVE IN FRAME f-cad = lHabilita.

    IF  pOpcao = "add" THEN
        ASSIGN Cidades.CodCidade:SENSITIVE IN FRAME f-cad = TRUE.
    ELSE
        ASSIGN Cidades.CodCidade:SENSITIVE IN FRAME f-cad = FALSE.

    IF  cOpcao = "" THEN DO:
        FIND CURRENT cidades NO-LOCK NO-ERROR.
        IF AVAIL cidades THEN DO:
            DISPLAY cidades WITH FRAME f-cad.          
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
            FIND FIRST cidades NO-LOCK NO-ERROR.
        END.
        WHEN "last" THEN DO:
            FIND LAST cidades NO-LOCK NO-ERROR.
        END.
        WHEN "next" THEN DO:
            FIND NEXT cidades NO-LOCK NO-ERROR.
            IF  NOT AVAIL cidades THEN DO:
                APPLY "choose" TO bt-first IN FRAME f-cad.
            END.
        END.
        WHEN "prev" THEN DO:
            FIND PREV cidades NO-LOCK NO-ERROR.
            IF  NOT AVAIL cidades THEN DO:
                RUN pi-posiciona-registro (INPUT "last").
            END.
        END.
    END CASE.
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
        
            FIND FIRST bf-cidades NO-LOCK
                WHERE bf-cidades.CodCidade = INPUT FRAME f-cad cidades.CodCidade NO-ERROR.
            IF AVAIL bf-cidades THEN DO:
                MESSAGE "Código de cidade já existente!"
                        VIEW-AS ALERT-BOX.
                APPLY "entry" TO cidades.CodCidade IN FRAME f-cad.
                RETURN "NOK".
            END.            
        
            CREATE cidades.
            ASSIGN cidades.CodCidade = INPUT FRAME f-cad cidades.CodCidade.
            ASSIGN Cidades EXCEPT CodCidade.
        END.
        WHEN "upd" THEN DO WITH FRAME f-cad:
            FIND CURRENT Cidades EXCLUSIVE-LOCK NO-ERROR.
            ASSIGN Cidades EXCEPT CodCidade.
        END.
    END CASE.
    
    RETURN "OK".
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

