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

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Window
&Scoped-define DB-AWARE no

/* Name of designated FRAME-NAME and/or first browse and/or first query */
&Scoped-define FRAME-NAME DEFAULT-FRAME

/* Internal Tables (found by Frame, Query & Browse Queries)             */
&Scoped-define INTERNAL-TABLES Cidades

/* Definitions for FRAME DEFAULT-FRAME                                  */
&Scoped-define FIELDS-IN-QUERY-DEFAULT-FRAME Cidades.NomCidade 
&Scoped-define ENABLED-FIELDS-IN-QUERY-DEFAULT-FRAME Cidades.NomCidade 
&Scoped-define ENABLED-TABLES-IN-QUERY-DEFAULT-FRAME Cidades
&Scoped-define FIRST-ENABLED-TABLE-IN-QUERY-DEFAULT-FRAME Cidades
&Scoped-define QUERY-STRING-DEFAULT-FRAME FOR EACH Cidades SHARE-LOCK
&Scoped-define OPEN-QUERY-DEFAULT-FRAME OPEN QUERY DEFAULT-FRAME FOR EACH Cidades SHARE-LOCK.
&Scoped-define TABLES-IN-QUERY-DEFAULT-FRAME Cidades
&Scoped-define FIRST-TABLE-IN-QUERY-DEFAULT-FRAME Cidades


/* Standard List Definitions                                            */
&Scoped-Define ENABLED-FIELDS Clientes.CodCidade Cidades.NomCidade ~
Clientes.Observacao 
&Scoped-define ENABLED-TABLES Clientes Cidades
&Scoped-define FIRST-ENABLED-TABLE Clientes
&Scoped-define SECOND-ENABLED-TABLE Cidades
&Scoped-Define ENABLED-OBJECTS RECT-5 RECT-6 bt-first bt-prev bt-next ~
bt-last bt-add bt-upd bt-del bt-save bt-cancel bt-export bt-done FILL-IN-7 ~
FILL-IN-12 FILL-IN-14 
&Scoped-Define DISPLAYED-FIELDS Clientes.CodCidade Cidades.NomCidade ~
Clientes.Observacao 
&Scoped-define DISPLAYED-TABLES Clientes Cidades
&Scoped-define FIRST-DISPLAYED-TABLE Clientes
&Scoped-define SECOND-DISPLAYED-TABLE Cidades
&Scoped-Define DISPLAYED-OBJECTS FILL-IN-7 FILL-IN-12 FILL-IN-14 

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

DEFINE BUTTON bt-done 
     LABEL "Sair" 
     SIZE 10.4 BY 1.19
     BGCOLOR 15 FGCOLOR 0 .

DEFINE BUTTON bt-export 
     LABEL "Exportar" 
     SIZE 10.4 BY 1.19
     BGCOLOR 15 FGCOLOR 0 .

DEFINE BUTTON bt-first 
     LABEL "<" 
     SIZE 5 BY 1.19
     BGCOLOR 15 FGCOLOR 0 .

DEFINE BUTTON bt-last 
     LABEL ">" 
     SIZE 5 BY 1.19
     BGCOLOR 15 FGCOLOR 0 .

DEFINE BUTTON bt-next 
     LABEL ">>" 
     SIZE 5 BY 1.19
     BGCOLOR 15 FGCOLOR 0 .

DEFINE BUTTON bt-prev 
     LABEL "<<" 
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

DEFINE VARIABLE FILL-IN-12 LIKE Clientes.NomCliente
     VIEW-AS FILL-IN 
     SIZE 32 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE FILL-IN-14 LIKE Clientes.Endereco
     VIEW-AS FILL-IN 
     SIZE 52 BY 1
     BGCOLOR 15  NO-UNDO.

DEFINE VARIABLE FILL-IN-7 LIKE Clientes.CodCliente
     VIEW-AS FILL-IN 
     SIZE 10.4 BY 1
     BGCOLOR 15  NO-UNDO.

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
DEFINE QUERY DEFAULT-FRAME FOR 
      Cidades SCROLLING.
&ANALYZE-RESUME

/* ************************  Frame Definitions  *********************** */

DEFINE FRAME DEFAULT-FRAME
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
     bt-done AT ROW 1.81 COL 111 WIDGET-ID 40
     FILL-IN-7 AT ROW 6 COL 17 COLON-ALIGNED HELP
          "" WIDGET-ID 58
          BGCOLOR 15 
     FILL-IN-12 AT ROW 7.19 COL 17 COLON-ALIGNED HELP
          "" WIDGET-ID 68
          BGCOLOR 15 
     FILL-IN-14 AT ROW 8.38 COL 17 COLON-ALIGNED HELP
          "" WIDGET-ID 72
          BGCOLOR 15 
     Clientes.CodCidade AT ROW 9.57 COL 17 COLON-ALIGNED WIDGET-ID 76
          LABEL "Cidade"
          VIEW-AS FILL-IN 
          SIZE 12 BY 1.19
          BGCOLOR 15 
     Cidades.NomCidade AT ROW 9.57 COL 30 COLON-ALIGNED NO-LABEL WIDGET-ID 78
          VIEW-AS FILL-IN 
          SIZE 22 BY 1.19
          BGCOLOR 15 
     Clientes.Observacao AT ROW 11 COL 16 COLON-ALIGNED WIDGET-ID 80
          VIEW-AS FILL-IN 
          SIZE 66 BY 1.19
          BGCOLOR 15 
     RECT-5 AT ROW 1.24 COL 2 WIDGET-ID 2
     RECT-6 AT ROW 4.81 COL 2 WIDGET-ID 4
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COLUMN 1 ROW 1
         SIZE 124.4 BY 18.91
         BGCOLOR 7  WIDGET-ID 100.


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
/* SETTINGS FOR FRAME DEFAULT-FRAME
   FRAME-NAME                                                           */
/* SETTINGS FOR FILL-IN Clientes.CodCidade IN FRAME DEFAULT-FRAME
   EXP-LABEL                                                            */
/* SETTINGS FOR FILL-IN FILL-IN-12 IN FRAME DEFAULT-FRAME
   LIKE = videloc.Clientes.NomCliente                                   */
/* SETTINGS FOR FILL-IN FILL-IN-14 IN FRAME DEFAULT-FRAME
   LIKE = videloc.Clientes.Endereco EXP-SIZE                            */
/* SETTINGS FOR FILL-IN FILL-IN-7 IN FRAME DEFAULT-FRAME
   LIKE = videloc.Clientes.CodCliente EXP-SIZE                          */
/* SETTINGS FOR FILL-IN Cidades.NomCidade IN FRAME DEFAULT-FRAME
   EXP-LABEL                                                            */
IF SESSION:DISPLAY-TYPE = "GUI":U AND VALID-HANDLE(C-Win)
THEN C-Win:HIDDEN = no.

/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME


/* Setting information for Queries and Browse Widgets fields            */

&ANALYZE-SUSPEND _QUERY-BLOCK FRAME DEFAULT-FRAME
/* Query rebuild information for FRAME DEFAULT-FRAME
     _TblList          = "videloc.Cidades"
     _Query            is OPENED
*/  /* FRAME DEFAULT-FRAME */
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

  {&OPEN-QUERY-DEFAULT-FRAME}
  GET FIRST DEFAULT-FRAME.
  DISPLAY FILL-IN-7 FILL-IN-12 FILL-IN-14 
      WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
  IF AVAILABLE Cidades THEN 
    DISPLAY Cidades.NomCidade 
      WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
  IF AVAILABLE Clientes THEN 
    DISPLAY Clientes.CodCidade Clientes.Observacao 
      WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
  ENABLE RECT-5 RECT-6 bt-first bt-prev bt-next bt-last bt-add bt-upd bt-del 
         bt-save bt-cancel bt-export bt-done FILL-IN-7 FILL-IN-12 FILL-IN-14 
         Clientes.CodCidade Cidades.NomCidade Clientes.Observacao 
      WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
  {&OPEN-BROWSERS-IN-QUERY-DEFAULT-FRAME}
  VIEW C-Win.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

