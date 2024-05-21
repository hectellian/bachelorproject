\NeedsTeXFormat{LaTeX2e} \ProvidesClass{template}

\RequirePackage{setspace}

\LoadClass[11pt, a4paper]{report}

\oddsidemargin 10truemm \evensidemargin 0truemm
\marginparwidth 40pt \marginparsep 10pt
\topmargin 0truemm \headsep 10truemm
\textheight 224truemm \textwidth 145truemm

\brokenpenalty=10000

\onehalfspacing

\def\degreetitle#1{\gdef\@degreetitle{#1}}
\def\rpttype#1{\gdef\@rpttype{#1}}

\def\principaladviser#1{\gdef\@principaladviser{#1}}
\def\advis@r{Advisor} % default spelling---we are English!
\def\principaladvisor#1{\gdef\@principaladviser{#1}\gdef\advis@r{Advisor}}
\def\firstreader#1{\gdef\@firstreader{#1}}
\def\secondreader#1{\gdef\@secondreader{#1}}
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\copyrightyear#1{\gdef\@copyrightyear{#1}} 
\def\@title{}\def\@author{}\def\@dept{School of Computing}
\def\@principaladviser{}\def\@firstreader{}\def\@secondreader{}
\def\@submitdate{\ifcase\the\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space \number\the\year}

\newif\ifcopyright \newif\iffigurespage \newif\iftablespage \newif\ifalgorithmspage \newif\ifsigpage \copyrightfalse \figurespagetrue \tablespagetrue \algorithmspagefalse  \sigpagefalse

\def\titlep{%
        \thispagestyle{empty}%
        \null\vskip1in%
        \begin{center}
                \large\sc\expandafter{\@title}\\
        \vskip 0.25in
                {\Large \@author}
        \vskip 0.45in
        \includegraphics[height=40mm]{unige-logo}
        \vfill
        \vskip 0.25in
        \end{center}
        \begin{center}
                \sc A report submitted as part of the requirements for the degree\\ of
                \@degreetitle
 \\at the Faculty of Science \\University of Geneva\\ Geneva, Switzerland

        \end{center}
        \vfill
        \vskip 0.5in
        \begin{center}
                \@submitdate
        \end{center}
        \vfill
        \begin{center}
                \normalfont
                Supervisor \@principaladviser\\
        \end{center}\vskip.5in\newpage}

\def\beforeabstract{
        \pagenumbering{roman}
        \pagestyle{plain}
        \titlep
        \ifsigpage\signaturepage\fi


\def\afterabstract{
%%        \newpage

\tableofcontents
        \newpage
        \iftablespage
                \addvspace{10pt}
                \listoftables
                \newpage
        \fi
        \iffigurespage
                \addvspace{10pt}
                \listoffigures
                \newpage
        \fi
    \ifalgorithmspage
                \addvspace{10pt}
                \listofalgorithms
                \newpage
        \fi}

        }

\def\prefacesection#1{%
        \chapter*{#1}
        \addcontentsline{toc}{chapter}{#1}}

\def\afterpreface{\newpage
        \pagestyle{plain}}

\pagestyle{plain}

\def\thebibliography#1{\chapter*{\bibname\@mkboth
  {\uppercase{\bibname}}{\uppercase{\bibname}}}%
  \addcontentsline{toc}{chapter}{\bibname}%
  \list
  {\@biblabel{\arabic{enumiv}}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \def\theenumiv{\arabic{enumiv}}}%
    \def\newblock{\hskip .11em plus.33em minus.07em}%
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=\@m}

\def\endthebibliography{%
  \def\@noitemerr{\@warning{Empty `thebibliography' environment}}%
  \endlist}
