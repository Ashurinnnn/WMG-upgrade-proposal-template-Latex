%%
%% wmgupgrade.cls',
%%
%% For WMG student and stuff
%% 
%% Original Author: Changrui Chen <changrui.chen@warwick.ac.uk>
%% 
%% Revision 1.1 07/03/2024
%% 1. The font has been changed to align with the .docx template
%% 2. The package has been changed to avoid a hyperlink issue
%% 3. Provide an example of cite and abbreviations 
%% 4. Add word count on first page
%%
%% Author: Zhi Wang <zhi.wang.1@warwick.ac.uk>

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{wmgupgrade}[2021/06/09 v1.0.0 WMG Upgrade Report Template]
\LoadClassWithOptions{article}
% ===============================================
% PKG

\RequirePackage{times}
\RequirePackage[verbose=true,a4paper,left=3cm,right=3cm,top=3cm,bottom=3cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{sectsty}
%\RequirePackage{hyperref}
% use hyperref in main.tex with hidelinks
% example: \usepackage[hidelinks]{hyperref}
\RequirePackage{booktabs}
\RequirePackage{fancyhdr}
\RequirePackage{xcolor}
\RequirePackage{tabularx}
\RequirePackage{background}
% ===============================================
% Font Style
\linespread{1.5}
\renewcommand{\normalsize}{\fontsize{11pt}{12pt}\selectfont}
\renewcommand{\Huge}{\fontsize{26pt}{30pt}\selectfont}
\renewcommand{\Large}{\fontsize{16pt}{24pt}\selectfont}
\renewcommand{\large}{\fontsize{14pt}{24pt}\selectfont}
\renewcommand{\small}{\fontsize{8pt}{10pt}\selectfont}
\normalsize

% ===============================================
% Define Information

\newcommand*{\id}[1]{
  \def\@id{#1}
}
\newcommand*{\advisor}[1]{
  \def\@advisor{#1}
}

\newcommand{\wordcount}[1]{
    \def\@wordcount{#1}
}

% ===============================================
% Page Structure
\pagestyle{fancyplain}% <- use fancyplain instead fancy
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[L]{\color{gray}\@author}% <- added
\fancyhead[R]{\color{gray} MPhil/PhD Upgrade Report}
\fancyfoot[R]{\color{gray}\thepage}
\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}

\sectionfont{\Large}
\subsectionfont{\large}
\subsubsectionfont{\normalsize}


\newcommand\blankpage{
  \null
  \thispagestyle{empty}
  \addtocounter{page}{-1}
  \newpage
}
\newenvironment{singlepage}{
  \clearpage
  \thispagestyle{empty}
}{\clearpage}


\newcommand\makepreface{
    \begin{singlepage}
        \centering
        \includegraphics[width=0.5\textwidth]{wmg_logo}

        \vspace{30pt}

        {\Large\textbf{MPhil/PhD Upgrade Report}}

        \vspace{50pt}

        {\Huge\textbf\@title}

        \vspace{80pt}

        {\Large\textbf\@author}

        \vspace{10pt}

        {\Large\textbf{(\@id)}}

        {\Large\textbf\@date}

        \vspace{90pt}

        {\Large\textbf{Supervisors}}

        \vspace{10pt}

        {\Large\textbf\@advisor}

        \vfill
        \raggedleft
        {\large\textbf{Word Count: \@wordcount}}
    \end{singlepage}
}

% disable background
\backgroundsetup{
  scale=1,
  color=black,
  opacity=0,
  angle=0,
  position=current page.south east,
  vshift=-2.54cm,
  hshift=-2.54cm - 0.5cm,
  contents={}
}


\AtBeginDocument{
    \NoBgThispage
    \AddEverypageHook{\NoBgThispage}
}

\renewenvironment{abstract}{
  \clearpage
  \section*{Abstract}
  \addcontentsline{toc}{section}{Abstract}
  \pagenumbering{roman}

}{
  \newpage
}

\newcommand\maketoc{
    \addcontentsline{toc}{section}{Table of Contents}
    \tableofcontents
    \newpage
}
\newcommand\makelistoftables{
    \addcontentsline{toc}{section}{List of Tables}
    \listoftables
    \newpage
}
\newcommand\makelistoffigures{
    \addcontentsline{toc}{section}{List of Figures}
    \listoffigures
    \newpage
}
