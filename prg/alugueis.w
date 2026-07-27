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
&Scoped-define BROWSE-NAME BROWSE-2

/* Internal Tables (found by Frame, Query & Browse Queries)             */
&Scoped-define INTERNAL-TABLES Clientes Filmes Aluguel_filmes Alugueis

/* Definitions for BROWSE BROWSE-2                                      */
&Scoped-define FIELDS-IN-QUERY-BROWSE-2 Aluguel_filmes.CodItem ~
Aluguel_filmes.CodFilme Aluguel_filmes.NumQuantidade Filmes.ValFilme ~
Aluguel_filmes.ValTotal 
&Scoped-define ENABLED-FIELDS-IN-QUERY-BROWSE-2 
&Scoped-define QUERY-STRING-BROWSE-2 FOR EACH Clientes OF Alugueis NO-LOCK, ~
      EACH Filmes OF Aluguel_filmes NO-LOCK INDEXED-REPOSITION
&Scoped-define OPEN-QUERY-BROWSE-2 OPEN QUERY BROWSE-2 FOR EACH Clientes OF Alugueis NO-LOCK, ~
      EACH Filmes OF Aluguel_filmes NO-LOCK INDEXED-REPOSITION.
&Scoped-define TABLES-IN-QUERY-BROWSE-2 Clientes Filmes
&Scoped-define FIRST-TABLE-IN-QUERY-BROWSE-2 Clientes
&Scoped-define SECOND-TABLE-IN-QUERY-BROWSE-2 Filmes


/* Definitions for FRAME DEFAULT-FRAME                                  */
&Scoped-define FIELDS-IN-QUERY-DEFAULT-FRAME Aluguel_filmes.CodAluguel ~
Alugueis.CodCliente 
&Scoped-define ENABLED-FIELDS-IN-QUERY-DEFAULT-FRAME ~
Aluguel_filmes.CodAluguel Alugueis.CodCliente 
&Scoped-define ENABLED-TABLES-IN-QUERY-DEFAULT-FRAME Aluguel_filmes ~
Alugueis
&Scoped-define FIRST-ENABLED-TABLE-IN-QUERY-DEFAULT-FRAME Aluguel_filmes
&Scoped-define SECOND-ENABLED-TABLE-IN-QUERY-DEFAULT-FRAME Alugueis
&Scoped-define OPEN-BROWSERS-IN-QUERY-DEFAULT-FRAME ~
    ~{&OPEN-QUERY-BROWSE-2}
&Scoped-define QUERY-STRING-DEFAULT-FRAME FOR EACH Aluguel_filmes SHARE-LOCK, ~
      EACH Alugueis OF Aluguel_filmes SHARE-LOCK
&Scoped-define OPEN-QUERY-DEFAULT-FRAME OPEN QUERY DEFAULT-FRAME FOR EACH Aluguel_filmes SHARE-LOCK, ~
      EACH Alugueis OF Aluguel_filmes SHARE-LOCK.
&Scoped-define TABLES-IN-QUERY-DEFAULT-FRAME Aluguel_filmes Alugueis
&Scoped-define FIRST-TABLE-IN-QUERY-DEFAULT-FRAME Aluguel_filmes
&Scoped-define SECOND-TABLE-IN-QUERY-DEFAULT-FRAME Alugueis


/* Standard List Definitions                                            */
&Scoped-Define ENABLED-FIELDS Aluguel_filmes.CodAluguel Alugueis.CodCliente ~
Clientes.NomCliente 
&Scoped-define ENABLED-TABLES Aluguel_filmes Alugueis Clientes
&Scoped-define FIRST-ENABLED-TABLE Aluguel_filmes
&Scoped-define SECOND-ENABLED-TABLE Alugueis
&Scoped-define THIRD-ENABLED-TABLE Clientes
&Scoped-Define ENABLED-OBJECTS RECT-5 RECT-6 RECT-7 bt-first bt-prev ~
bt-next bt-last bt-add bt-upd bt-del bt-save bt-cancel bt-export bt-done ~
FILL-IN-24 FILL-IN-17 FILL-IN-22 FILL-IN-23 FILL-IN-18 BROWSE-2 bt-addfilm ~
bt-updfilm bt-delfilm 
&Scoped-Define DISPLAYED-FIELDS Aluguel_filmes.CodAluguel ~
Alugueis.CodCliente Clientes.NomCliente 
&Scoped-define DISPLAYED-TABLES Aluguel_filmes Alugueis Clientes
&Scoped-define FIRST-DISPLAYED-TABLE Aluguel_filmes
&Scoped-define SECOND-DISPLAYED-TABLE Alugueis
&Scoped-define THIRD-DISPLAYED-TABLE Clientes
&Scoped-Define DISPLAYED-OBJECTS FILL-IN-24 FILL-IN-17 FILL-IN-22 ~
FILL-IN-23 FILL-IN-18 

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

DEFINE BUTTON bt-updfilm 
     LABEL "Modificar" 
     SIZE 13 BY .95
     BGCOLOR 15 .

DEFINE VARIABLE FILL-IN-17 LIKE Clientes.Endereco
     VIEW-AS FILL-IN 
     SIZE 57 BY 1 NO-UNDO.

DEFINE VARIABLE FILL-IN-18 LIKE Clientes.Observacao
     VIEW-AS FILL-IN 
     SIZE 62 BY 1 NO-UNDO.

DEFINE VARIABLE FILL-IN-22 LIKE Cidades.CodCidade
     VIEW-AS FILL-IN 
     SIZE 9 BY 1 NO-UNDO.

DEFINE VARIABLE FILL-IN-23 LIKE Cidades.NomCidade
     VIEW-AS FILL-IN 
     SIZE 32 BY 1 NO-UNDO.

DEFINE VARIABLE FILL-IN-24 LIKE Alugueis.DatAluguel
     VIEW-AS FILL-IN 
     SIZE 16 BY 1 NO-UNDO.

DEFINE RECTANGLE RECT-5
     EDGE-PIXELS 2 GRAPHIC-EDGE    ROUNDED 
     SIZE 122 BY 2.38
     BGCOLOR 15 FGCOLOR 15 .

DEFINE RECTANGLE RECT-6
     EDGE-PIXELS 2 GRAPHIC-EDGE    ROUNDED 
     SIZE 122 BY 20.71
     BGCOLOR 15 FGCOLOR 15 .

DEFINE RECTANGLE RECT-7
     EDGE-PIXELS 2 GRAPHIC-EDGE  NO-FILL   
     SIZE 120 BY 12.62.

/* Query definitions                                                    */
&ANALYZE-SUSPEND
DEFINE QUERY BROWSE-2 FOR 
      Clientes, 
      Filmes SCROLLING.

DEFINE QUERY DEFAULT-FRAME FOR 
      Aluguel_filmes, 
      Alugueis SCROLLING.
&ANALYZE-RESUME

/* Browse definitions                                                   */
DEFINE BROWSE BROWSE-2
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _DISPLAY-FIELDS BROWSE-2 C-Win _STRUCTURED
  QUERY BROWSE-2 NO-LOCK DISPLAY
      Aluguel_filmes.CodItem FORMAT ">>>>9":U
      Aluguel_filmes.CodFilme FORMAT "->>>>9":U
      Aluguel_filmes.NumQuantidade FORMAT "->>>>9":U
      Filmes.ValFilme FORMAT ">>>>>>>9.99":U
      Aluguel_filmes.ValTotal FORMAT ">>>>>>>9.99":U WIDTH 47.2
/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME
    WITH NO-ROW-MARKERS SEPARATORS SIZE 92 BY 9.05
         BGCOLOR 15 FGCOLOR 0  FIT-LAST-COLUMN.


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
     Aluguel_filmes.CodAluguel AT ROW 6.24 COL 14 COLON-ALIGNED WIDGET-ID 82
          VIEW-AS FILL-IN 
          SIZE 11 BY 1.19
     FILL-IN-24 AT ROW 6.24 COL 33 COLON-ALIGNED HELP
          "" WIDGET-ID 100
     Alugueis.CodCliente AT ROW 7.67 COL 14 COLON-ALIGNED WIDGET-ID 92
          VIEW-AS FILL-IN 
          SIZE 11 BY 1.19
     Clientes.NomCliente AT ROW 7.67 COL 33 COLON-ALIGNED WIDGET-ID 94
          VIEW-AS FILL-IN 
          SIZE 38 BY 1.19
     FILL-IN-17 AT ROW 9.1 COL 14 COLON-ALIGNED HELP
          "" WIDGET-ID 86
     FILL-IN-22 AT ROW 10.29 COL 14 COLON-ALIGNED HELP
          "" WIDGET-ID 96
     FILL-IN-23 AT ROW 10.29 COL 33 COLON-ALIGNED HELP
          "" WIDGET-ID 98
     FILL-IN-18 AT ROW 11.48 COL 14 COLON-ALIGNED HELP
          "" WIDGET-ID 88
     BROWSE-2 AT ROW 13.38 COL 8 HELP
          "" WIDGET-ID 200
     bt-addfilm AT ROW 22.67 COL 8 WIDGET-ID 104
     bt-updfilm AT ROW 22.67 COL 23 WIDGET-ID 106
     bt-delfilm AT ROW 22.67 COL 38 WIDGET-ID 108
     RECT-5 AT ROW 1.24 COL 2 WIDGET-ID 2
     RECT-6 AT ROW 4.81 COL 2 WIDGET-ID 4
     RECT-7 AT ROW 12.67 COL 3 WIDGET-ID 102
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COLUMN 1 ROW 1
         SIZE 124.4 BY 25.14
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
         HEIGHT             = 25.14
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
/* BROWSE-TAB BROWSE-2 FILL-IN-18 DEFAULT-FRAME */
ASSIGN 
       BROWSE-2:SEPARATOR-FGCOLOR IN FRAME DEFAULT-FRAME      = 0.

/* SETTINGS FOR FILL-IN FILL-IN-17 IN FRAME DEFAULT-FRAME
   LIKE = videloc.Clientes.Endereco EXP-SIZE                            */
/* SETTINGS FOR FILL-IN FILL-IN-18 IN FRAME DEFAULT-FRAME
   LIKE = videloc.Clientes.Observacao EXP-SIZE                          */
/* SETTINGS FOR FILL-IN FILL-IN-22 IN FRAME DEFAULT-FRAME
   LIKE = videloc.Cidades.CodCidade EXP-SIZE                            */
/* SETTINGS FOR FILL-IN FILL-IN-23 IN FRAME DEFAULT-FRAME
   LIKE = videloc.Cidades.NomCidade EXP-SIZE                            */
/* SETTINGS FOR FILL-IN FILL-IN-24 IN FRAME DEFAULT-FRAME
   LIKE = videloc.Alugueis.DatAluguel EXP-SIZE                          */
IF SESSION:DISPLAY-TYPE = "GUI":U AND VALID-HANDLE(C-Win)
THEN C-Win:HIDDEN = no.

/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME


/* Setting information for Queries and Browse Widgets fields            */

&ANALYZE-SUSPEND _QUERY-BLOCK BROWSE BROWSE-2
/* Query rebuild information for BROWSE BROWSE-2
     _TblList          = "videloc.Clientes OF videloc.Alugueis,videloc.Filmes OF videloc.Aluguel_filmes"
     _Options          = "NO-LOCK INDEXED-REPOSITION"
     _FldNameList[1]   = videloc.Aluguel_filmes.CodItem
     _FldNameList[2]   = videloc.Aluguel_filmes.CodFilme
     _FldNameList[3]   = videloc.Aluguel_filmes.NumQuantidade
     _FldNameList[4]   = videloc.Filmes.ValFilme
     _FldNameList[5]   > videloc.Aluguel_filmes.ValTotal
"Aluguel_filmes.ValTotal" ? ? "integer" ? ? ? ? ? ? no ? no no "47.2" yes no no "U" "" "" "" "" "" "" 0 no 0 no no
     _Query            is OPENED
*/  /* BROWSE BROWSE-2 */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _QUERY-BLOCK FRAME DEFAULT-FRAME
/* Query rebuild information for FRAME DEFAULT-FRAME
     _TblList          = "videloc.Aluguel_filmes,videloc.Alugueis OF videloc.Aluguel_filmes"
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


&Scoped-define BROWSE-NAME BROWSE-2
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
  DISPLAY FILL-IN-24 FILL-IN-17 FILL-IN-22 FILL-IN-23 FILL-IN-18 
      WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
  IF AVAILABLE Alugueis THEN 
    DISPLAY Alugueis.CodCliente 
      WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
  IF AVAILABLE Aluguel_filmes THEN 
    DISPLAY Aluguel_filmes.CodAluguel 
      WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
  IF AVAILABLE Clientes THEN 
    DISPLAY Clientes.NomCliente 
      WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
  ENABLE RECT-5 RECT-6 RECT-7 bt-first bt-prev bt-next bt-last bt-add bt-upd 
         bt-del bt-save bt-cancel bt-export bt-done Aluguel_filmes.CodAluguel 
         FILL-IN-24 Alugueis.CodCliente Clientes.NomCliente FILL-IN-17 
         FILL-IN-22 FILL-IN-23 FILL-IN-18 BROWSE-2 bt-addfilm bt-updfilm 
         bt-delfilm 
      WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
  {&OPEN-BROWSERS-IN-QUERY-DEFAULT-FRAME}
  VIEW C-Win.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

