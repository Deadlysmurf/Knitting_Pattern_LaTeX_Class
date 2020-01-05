\ProvidesClass{knitting_pattern}[2020/01/02 My custom CV class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip}       % Remove paragraph indentation
\usepackage{array}                  % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen}                 % Required for ifthenelse statements
\usepackage{datetime}				% Creates Custom Date formatting for the footer
	\newdateformat{mydate}{\monthname[\THEMONTH] \THEYEAR}
    \newdateformat{justtheyear}{\THEYEAR}
\usepackage{fontawesome}			% Adds font awesome symbols - used in footer
\usepackage{hyperref}               % Allows hrefs - used in footers
\usepackage[most]{tcolorbox}        % Required for formatted boxes
\usepackage{enumitem}               % For the fancy list fomatting
\usepackage{fancyhdr}               % For the fancy footnotes
\usepackage[sort=def]{glossaries}   % For the abbreviations glossary




%----------------------------------------------------------------------------------------
%	PAGE FORMATTING: Commands for formatting the page
%----------------------------------------------------------------------------------------

\setlength\topmargin{-60pt}
\setlength\headheight{14pt}
\setlength\headsep{20pt}
\setlength\marginparwidth{-20pt}
\setlength\textwidth{7.0in}
\setlength\textheight{9.5in}
\setlength\oddsidemargin{-30pt}
\setlength\evensidemargin{-30pt}

\pagestyle{fancy}


\makeglossaries
\renewcommand{\glossarysection}[2][]{} %Removes the title from glossary
\loadglsentries{knitting_glossary}


%----------------------------------------------------------------------------------------
%	PATTERN NAME COMMANDS: Commands for printing the pattern name
%----------------------------------------------------------------------------------------

\def \patternname#1{\def\@patternname{#1}} % Defines the \patternname command to set name
\def \@patternname {} % Sets to empty by default

% \printname is used to print the pattern name as a page header
\def \printname {
  \begingroup
    \begin{center}\Huge \@patternname \end{center}
    \noindent\rule{\linewidth}{3pt} \\[-0.75\baselineskip]
    \noindent\rule{\linewidth}{1pt}
  \endgroup
}

%----------------------------------------------------------------------------------------
%	HEADER AND FOOTER: Commands to customise footer and clean up header
%----------------------------------------------------------------------------------------
\def \DesignerName#1{\def\@DesignerName{#1}}
\def \DesignerWebsite#1{\def\@DesignerWebsite{#1}}
\def \DesignerEmail#1{\def\@DesignerEmail{#1}}
\def \DesignerTwitter#1{\def\@DesignerTwitter{#1}}


\lfoot{	\footnotesize
		\textsc{\@patternname \hspace{0.05cm} - \mydate \today}  \\
		\href{\@DesignerWebsite}{\@DesignerWebsite}
	  }
\cfoot{\footnotesize ~\\ Page \thepage}
\rfoot{\footnotesize  \faCopyright \hspace{0.05cm} \justtheyear \today \hspace{0.05cm}  \@DesignerName \\
\faEnvelopeO \href{mailto:\@DesignerEmail}{\@DesignerEmail}
}
\renewcommand{\headrulewidth}{0 pt}	% no bar on top of page
\renewcommand{\footrulewidth}{0.4pt}	% bar on bottom of page

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------
\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
}

%----------------------------------------------------------------------------------------
%	GENERIC TEXT BOXES
%----------------------------------------------------------------------------------------

\newenvironment{OneColumnBox}[2]{ % 2 inputs - name of box + contents of box
    \begin{tcolorbox}[title=\textbf{#1}, center title, colback=white]
    #2
    \end{tcolorbox}
}

\newenvironment{TwoColumnBox}[4]{
    \begin{tcbitemize}[raster columns=2, raster equal height=rows, center title]
    \tcbitem[title=\textbf{#1}, colback=white]
    #2
    \tcbitem[title=\textbf{#3}, colback=white]
    #4
    \end{tcbitemize}
}

\newenvironment{TwoColumnBoxTwo}[4]{
    \begin{tcbitemize}[raster columns=2, raster equal height=rows, center title]
    \tcbitem[title=\textbf{#1}, colback=white]
    #2
    \tcbitem[title=\textbf{#3}, colback=white]
    #4
    \end{tcbitemize}
}

%----------------------------------------------------------------------------------------
%	PHOTO LAYOUT BOXES
%----------------------------------------------------------------------------------------

\newenvironment{TwoPhotoPanelNoBox}[3]{
    \begin{tcolorbox}[colback=white, colframe=white]
    \hfill
    \begin{minipage}[c]{0.495\textwidth}
        \includegraphics[width=\textwidth]{#1}
    \end{minipage}
    \hfill
    \begin{minipage}[c]{0.495\textwidth}
        \includegraphics[width=\textwidth]{#2}
    \end{minipage}
    \hfill
    \end{tcolorbox}
}

\newenvironment{ThreePhotoPanelNoBox}[3]{
    \begin{tcolorbox}[colback=white, colframe=white]
    \begin{minipage}[c]{0.3\textwidth}
        \includegraphics[width=\textwidth]{#1}
    \end{minipage}
    \hfill
    \begin{minipage}[c]{0.3\textwidth}
        \includegraphics[width=\textwidth]{#2}
    \end{minipage}
    \hfill
    \begin{minipage}[c]{0.3\textwidth}
        \includegraphics[width=\textwidth]{#3}
    \end{minipage}
    \end{tcolorbox}
}

%----------------------------------------------------------------------------------------
%	SPECIALLY DEFINED BOXES
%----------------------------------------------------------------------------------------

%% There is for sure a better way to do this. These should be parameters. This has too much copy and paste and room for error.

\newenvironment{PatternAboutFullWidth}[1]{ % 1 input - text for pattern about
    \begin{tcolorbox}[colback=white]
    #1
    \end{tcolorbox}
}

\newenvironment{OneColumnBoxNoTitle}[1]{ % 1 input - text for pattern about
    \begin{tcolorbox}[colback=white]
    #1
    \end{tcolorbox}
}

\newenvironment{PatternAboutLeftPhotoOneBox}[2]{ % 1 input - text for pattern about
    \begin{tcolorbox}[colback=white]
    \hfill
    \begin{minipage}[c]{0.45\textwidth}
        \includegraphics[width=\textwidth]{#1}
    \end{minipage}
    \hfill
    \begin{minipage}[c]{0.45\textwidth}
        #2
    \end{minipage}
    \hfill
    \end{tcolorbox}
}

\newenvironment{PatternAboutRightPhotoOneBox}[2]{ % 1 input - text for pattern about
    \begin{tcolorbox}[colback=white]
    \hfill
    \begin{minipage}[c]{0.45\textwidth}
        #2
    \end{minipage}
    \hfill
    \begin{minipage}[c]{0.45\textwidth}
        \includegraphics[width=\textwidth]{#1}
    \end{minipage}
    \hfill
    \end{tcolorbox}
}

\newenvironment{PatternAboutRightPhotoTwoBoxes}[2]{ % 1 input - text for pattern about
    \begin{tcbitemize}[raster columns=2, raster equal height=rows, center title]
    \tcbitem[colback=white]
        #2
    \tcbitem[colback=white]
        \includegraphics[width=\textwidth]{#1}
    \end{tcbitemize}
}

\newenvironment{PatternAboutLeftPhotoTwoBoxes}[2]{ % 1 input - text for pattern about
    \begin{tcbitemize}[raster columns=2, raster equal height=rows, center title]
    \tcbitem[colback=white]
        \includegraphics[width=\textwidth]{#1}
    \tcbitem[colback=white]
        #2
    \end{tcbitemize}
}

\newenvironment{Instructions}[1]{
    \OneColumnBox{Instructions}{#1}
}

\newenvironment{Abbreviations}[1]{
    \OneColumnBox{Abbreviations}{\printglossary[nonumberlist]}
}

\newenvironment{Chart}[2]{
    \TwoColumnBox{Charted Instructions}{\includegraphics[width=\textwidth]{#1}}{Written Instructions}{#2}
}

% Adding a note here seems to fix something
