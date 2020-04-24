%% tstextbook.cls
%% Copyright 2016 Typesetters.se
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This is a free LaTeX text book template from Typesetters.se.
% See tstextbook.tex for an example of how to use this class.
%--------------------------------------------------------------------------


% Class Definition and Parameters
%--------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{linearbook}[2020/04/20 Free LaTeX text book template.]

% Bool Values
% \RequirePackage{xparse}
\RequirePackage{etoolbox}
\newbool{CJK} 
\newbool{Palatino}

\DeclareOption{cjk}{\booltrue{CJK}}
\DeclareOption{palatino}{\booltrue{Palatino}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptions\relax

\LoadClass[onecolumn,titlepage,twoside,openany]{book}


% Language and Fonts
%--------------------------------------------------------------------------
\RequirePackage[american]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[OT1,T1]{fontenc}
\ifbool{Palatino}{%
  \RequirePackage{mathpazo}
}{%
  \RequirePackage{times}
}
\ifbool{CJK}{%
  \RequirePackage{xeCJK}
  \setCJKmainfont[ItalicFont={楷体}]{Noto Serif CJK SC}
                                                  % 正体为思源宋体,斜体为楷体
  \setCJKmonofont{Courier}
  \setCJKsansfont{黑体}
  \setmainfont{Palatino-Roman}
  % \setmonofont{}
  % \setsansfont{}
  \newCJKfontfamily[kx]\kxzdt{TypeLand KhangXi Dict Demo}
                                                  % 康熙字典體                                                  
  % \xeCJKsetup{CJKmath=true}                       % 在数学环境中输出CJK字符                                                  
  \xeCJKsetup{CheckSingle=true}                   % 避免最后一个字单独成行                                                
  \xeCJKsetup{PlainEquation=true}                 % 使用$$...$$来输入行间公式   
  \xeCJKsetup{PunctStyle=quanjiao}                % 设置中文标点符号为全角式
  % 可以设置为'banjiao'(半角),'kaiming'(开明)                         
}

\newcommand{\ppl}{\fontencoding{OT1}\fontfamily{ppl}\fontseries{m}\selectfont}
\newcommand{\pplj}{\fontencoding{OT1}\fontfamily{pplj}\fontseries{m}\selectfont}


% Chinese line space
%--------------------------------------------------------------------------
\ifbool{CJK}{
  % \RequirePackage{setspace}
  \RequirePackage{indentfirst}
  \setlength\parindent{2em}
  \linespread{1.25}

  % TODO 题注和表注的字体、大小、行距
  % \renewcommand{\captionfont}{\linespread{1}\normalsize}
}


% Hyperref
%--------------------------------------------------------------------------
\RequirePackage[bookmarksnumbered]{hyperref}
\hypersetup{hidelinks}


% Main Geometry
%--------------------------------------------------------------------------
\RequirePackage[includemp=true,
                inner=2cm,outer=1.2cm,
                top=2cm,bottom=1.5cm,
                headsep=0.7cm,headheight=0.5cm,
                marginparsep=0.4cm,marginparwidth=4.5cm]{geometry}           


% Colors
%--------------------------------------------------------------------------
\RequirePackage{xcolor}
\definecolor{lbdeepblue}{HTML}{118098}
\definecolor{lbblue}{HTML}{00acef}
\definecolor{lbgrayblue}{HTML}{bfd6db}
\definecolor{lbdeepgreen}{HTML}{457d3a}
\definecolor{lbgreen}{HTML}{c7d9b2}
\definecolor{lbred}{HTML}{a3262c}

\definecolor{tssteelblue}{RGB}{70,130,180}
\definecolor{tsorange}{RGB}{255,138,88}
\definecolor{tsblue}{RGB}{23,74,117}
\definecolor{tsforestgreen}{RGB}{21,122,81}
\definecolor{tsyellow}{RGB}{255,185,88}
\definecolor{tsgrey}{RGB}{200,200,200}


% Graphics
%--------------------------------------------------------------------------
\RequirePackage{graphicx}
\graphicspath{{images/}}

% Tikz
\RequirePackage{tikz}
\usetikzlibrary{calc}

% Circuitikz
\RequirePackage[siunitx,RPvoltages,european]{circuitikz}

% Pgfplots
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.17}
\usepgfplotslibrary{external}

\RequirePackage[pages=some]{background}
\backgroundsetup{scale=1,color=black,opacity=1.0,angle=0,
contents={\includegraphics[width=\paperwidth,height=\paperheight]{cover}}}


% Header and footer styling
%--------------------------------------------------------------------------
\RequirePackage{fancyhdr}
\setlength{\headheight}{15.0pt}
\fancyhf{}
\fancyhead[LE,RO]{\bfseries\thepage}
\fancyhead[RE]{\it\sf\nouppercase{\rightmark}}
\fancyhead[LO]{\it\sf\nouppercase{\leftmark}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}


% Section styling
%--------------------------------------------------------------------------
\RequirePackage{sectsty}
\sectionfont{\sf\color{tssteelblue}\sectionrule{0ex}{0pt}{-1ex}{1pt}}


% Chapter styling
%--------------------------------------------------------------------------
\RequirePackage{ifoddpage}
\makeatletter

% Cut-off line
% \newcommand{\lb\line}{\tikz[remember picture,overlay] \draw[fill=lbdeepblue,draw opacity=0]
% (current page.north west)++(0,-2cm) rectangle ++(\paperwidth,-4pt);}

% Numbered chapters
\renewcommand{\@makechapterhead}[2][Summary]{
  \checkoddpage
  \@ifoddpage{
    \begin{tikzpicture}[remember picture,overlay]
      \node at (current page.north west)
        {
          \begin{tikzpicture}[remember picture,overlay]
            \draw[fill=lbdeepblue,draw opacity=0]
              ++(0,-2cm) rectangle ++(\paperwidth,-4pt);
            \node[color=lbdeepgreen,inner sep=12pt,below left] (chapter)
              at  +(\paperwidth-1.2cm,-2cm) {\fontsize{40pt}{1pt}\selectfont\pplj\thechapter};
            \draw[line width=2pt,color=lbgreen] 
              ++(\paperwidth-1.2cm,0) |- ($(chapter.south west)+(0,4pt)$);
            \node[color=lbdeepblue,left,outer sep=2pt] at (chapter.south west)
              {
                \parbox[c][][c]{10cm}
                {\flushright\Huge\ppl #2}
              };

            % 预留设计,图片或者导言
            \node[below right,inner sep=12pt] (text) at ++(2cm,-5cm)
              {
                \parbox[c][][c]{5.5cm}
                {\small\ppl #1}
              };
            \draw[line width=2pt,color=lbgreen]
              ++(2cm,-2cm-4pt) |- (text.south east);
            %

          \end{tikzpicture}
        };
    \end{tikzpicture}
    \vspace{7cm}
  }{
    \begin{tikzpicture}[remember picture,overlay]
      \node at (current page.north west)
        {
          \begin{tikzpicture}[remember picture,overlay]
            \draw[fill=lbdeepblue,draw opacity=0]
              ++(0,-2cm) rectangle ++(\paperwidth,-4pt);
            \node[color=lbdeepgreen,inner sep=12pt,below right] (chapter)
              at  +(1.2cm,-2cm) {\fontsize{40pt}{1pt}\selectfont\pplj\thechapter};
            \draw[line width=2pt,color=lbgreen] 
              ++(1.2cm,0) |- ($(chapter.south east)+(0,4pt)$);
            \node[color=lbdeepblue,right,outer sep=2pt] at (chapter.south east)
              {
                \parbox[c][][c]{10cm}
                {\flushleft\Huge\ppl #2}
              };

            % 预留设计,图片或者导言
            \node[below left,inner sep=12pt] (text) at ++(\paperwidth-2cm,-5cm)
              {
                \parbox[c][][c]{5.5cm}
                {\small\ppl #1}
              };
            \draw[line width=2pt,color=lbgreen]
              ++(\paperwidth-2cm,-2cm-4pt) |- (text.south west);
            %

          \end{tikzpicture}
        };
    \end{tikzpicture}
    \vspace{7cm}
  }
}

% Unnumbered chapters
\renewcommand{\@makeschapterhead}[1]{
  \checkoddpage
  \@ifoddpage{
    \begin{tikzpicture}[remember picture,overlay]
      \node at (current page.north west)
        {
          \begin{tikzpicture}[remember picture,overlay]
            \draw[fill=lbdeepblue,draw opacity=0]
              ++(0,-2cm) rectangle ++(\paperwidth,-4pt);
            \node[color=lbdeepblue,inner sep=12pt,below left] (text)
              at  +(\paperwidth-6.1cm,-2cm) {\Huge\ppl #1};
            \draw[line width=2pt,color=lbgreen]
              ++(\paperwidth-6.1cm,0) |- ($(text.south west)+(0,4pt)$); 
          \end{tikzpicture}
        };
    \end{tikzpicture}
    \vspace{2cm}
  }{
    \begin{tikzpicture}[remember picture,overlay]
      \node at (current page.north west)
        {
          \begin{tikzpicture}[remember picture,overlay]
            \draw[fill=lbdeepblue,draw opacity=0]
              ++(0,-2cm) rectangle ++(\paperwidth,-4pt);
            \node[color=lbdeepblue,inner sep=12pt,below right] (text)
              at  +(6.1cm,-2cm) {\Huge\ppl #1};
            \draw[line width=2pt,color=lbgreen]
              ++(6.1cm,0) |- ($(text.south east)+(0,4pt)$); 
          \end{tikzpicture}
        };
    \end{tikzpicture}
    \vspace{2cm}
  }
}


% Table of contents styling
%--------------------------------------------------------------------------
\RequirePackage{titletoc}
\setcounter{tocdepth}{2}

\titlecontents{chapter}[0cm]
{\addvspace{14pt}\large\sffamily\bfseries}
{\color{tssteelblue}\contentslabel[\Large\thecontentslabel]{1.25cm}}{}
{\color{tssteelblue}\normalsize\sffamily\bfseries
 \;\titlerule*[.5pc]{.}\;\thecontentspage}

\titlecontents{section}[0cm]
{\addvspace{6pt}\sffamily\bfseries}
{\contentslabel[\thecontentslabel]{1.25cm}}{}
{\sffamily\hfill\color{black}\thecontentspage}[]


% Front matter
%--------------------------------------------------------------------------
\newcommand{\tsbook}[9]{    % TODO 把这里的命令改掉ts改掉

\pagestyle{empty}

\def\@tstitle{#1}
\def\@tsauthor{#2}
\def\@tscoverdesign{#3}
\def\@tsyear{#4}
\def\@tsartno{#5}
\def\@tsisbn{#6}
\def\@tsedition{#7}
\def\@tspublished{#8}
\def\@tsprinted{#9}


% Title page
\newgeometry{left=2cm,right=2cm,top=2cm,bottom=2cm}

% \BgThispage % setting the background
\begin{center}
  \null
  \smallskip

  \color{white}
  \sffamily

  \Huge
  \textsc{\@tstitle}

  \bigskip
  \smallskip

  \LARGE
  \textsc{\@tsauthor} \\[1em]
  \Large
  \textsc{\@tspublished}
\end{center}

\pagebreak

\pagenumbering{roman}

% Copyright page
\null
\vfill
\begin{flushleft}
  Copyright \copyright \ \@tsyear \ \@tsauthor \\
  \vspace{5mm}
  \textbf{Copying prohibited} \\
  \vspace{5mm}
  All rights reserved. No part of this publication may be reproduced
  or transmitted in any form or by any means, electronic or
  mechanical, including photocopying and recording, or by any
  information storage or retrieval system, without the prior written
  permission of the publisher. \\
  \vspace{5mm}
  Art. No \@tsartno \\
  ISBN \@tsisbn \\
  Edition \@tsedition \\
  \vspace{5mm}
  Cover design by \@tscoverdesign \\
  \vspace{5mm}
  Published by \@tspublished \\
  Printed in \@tsprinted
\end{flushleft}

\savegeometry{beforepreface}

% Table of contents
% \newgeometry{twoside=false,
%             includemp=true,
%             reversemp=true,
%             left=2cm,right=1.2cm,
%             top=2cm,bottom=1.5cm,
%             headsep=0.7cm,headheight=0.5cm,
%             marginparsep=0.4cm,marginparwidth=4.5cm} 
\restoregeometry

\tableofcontents

% Preface (and others)  TODO:重新设计宏命令
{\chapter*{Preface}
\noindent textsc  % TODO:重新设计
}
\restoregeometry

\cleardoublepage
\pagestyle{fancy}
\thispagestyle{empty}
}


% Boxes for theorems
%--------------------------------------------------------------------------
\newenvironment{boxtheorem}
{\begin{tcolorbox}
[enhanced jigsaw,breakable,pad at break*=1mm,
 colback=black!5,colframe=tsorange]}
{\end{tcolorbox}}

\newenvironment{boxdefinition}
{\begin{tcolorbox}
[enhanced jigsaw,breakable,pad at break*=1mm,
 colback=yellow!10!white,boxrule=0pt,frame hidden,
 borderline west={1.5mm}{-2mm}{tsforestgreen}]}
{\end{tcolorbox}}

\newenvironment{boxexercise}
{\begin{tcolorbox}
[enhanced jigsaw,breakable,pad at break*=1mm,
 colback=tsyellow!20,boxrule=0pt,frame hidden]}
{\end{tcolorbox}}

\newenvironment{boxproblem}
{\begin{tcolorbox}
[enhanced jigsaw,breakable,pad at break*=1mm,
 colback=tsorange!25,boxrule=0pt,frame hidden]}
{\end{tcolorbox}}

\newenvironment{boxprogramming}
{\begin{tcolorbox}
[enhanced jigsaw,breakable,pad at break*=1mm,
 colback=tsblue!10,boxrule=0pt,frame hidden]}
{\end{tcolorbox}}

\newenvironment{boxexample}
{\begin{tcolorbox}
[enhanced jigsaw,breakable,pad at break*=1mm,
 colback=tsgrey!20,boxrule=0pt,frame hidden]}
{\end{tcolorbox}}


% Styling of theorems
%--------------------------------------------------------------------------
\RequirePackage{amsthm}

\newtheoremstyle{styletheorem}
{0pt}{0pt}{\normalfont}{0pt}{\small\bf\sffamily\color{tsorange}}{\;}{0.25em}
{\small\sffamily\color{tsorange}\thmname{#1}
 \nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}
 \thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries\color{black} (#3)}}

\newtheoremstyle{styledefinition}
{0pt}{0pt}{\normalfont}{0pt}{\small\bf\sffamily\color{black}}{\;}{0.25em}
{\small\sffamily\color{tsforestgreen}\thmname{#1}
 \nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}
 \thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries\color{black} (#3)}}

\newtheoremstyle{styleexercise}
{0pt}{0pt}{\normalfont}{0pt}{\small\bf\sffamily\color{black}}{\;}{0.25em}
{\small\sffamily\color{black}\thmname{#1}
 \nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}
 \thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries\color{black} (#3)}}

\theoremstyle{styledefinition}
\newtheorem{envdefinition}{Definition}[chapter]
\theoremstyle{styletheorem}
\newtheorem{envtheorem}{Theorem}[chapter]
\newtheorem{envlemma}{Lemma}[chapter]
\theoremstyle{styleexercise}
\newtheorem{envexercise}{Exercise}[chapter]
\newtheorem{envproblem}{Problem}[chapter]
\newtheorem{envprogramming}{Computer exercise}[chapter]
\newtheorem{envexample}{Exempel}[chapter]


% Environments for theorems
%--------------------------------------------------------------------------
\newenvironment{definition}
               {\begin{boxdefinition}\begin{envdefinition}}
               {\end{envdefinition}\end{boxdefinition}}

\newenvironment{theorem}
               {\begin{boxtheorem}\begin{envtheorem}}
               {\end{envtheorem}\end{boxtheorem}}

\newenvironment{corollary}
               {\begin{boxtheorem}\begin{envtheorem}}
               {\end{envtheorem}\end{boxtheorem}}

\newenvironment{lemma}
               {\begin{boxtheorem}\begin{envlemma}}
               {\end{envlemma}\end{boxtheorem}}

\newenvironment{exercise}
               {\begin{boxexercise}\begin{envexercise}}
               {\end{envexercise}\end{boxexercise}}

\newenvironment{problem}
               {\begin{boxproblem}\begin{envproblem}}
               {\end{envproblem}\end{boxproblem}}

\newenvironment{programming}
               {\begin{boxprogramming}\begin{envprogramming}}
               {\end{envprogramming}\end{boxprogramming}}

\newenvironment{example}
               {\begin{boxexample}\begin{envexample}}
               {\end{envexample}\end{boxexample}}


% Other environments
%--------------------------------------------------------------------------
\newenvironment{summary}
{\hspace{10pt}\par\small\it
 \begin{list}{}{\leftmargin=35pt\rightmargin=25pt}
 \item\ignorespaces\advance\baselineskip -1pt}
{\end{list}\vspace{-0.5cm}}

\newenvironment{remark}
{\vspace{0.5cm}\noindent\small\it
 \marginpar{\vspace{-3mm}\includegraphics[width=1.0cm]{idea}}}
{\vspace{0.5cm}}


% Bibliography
%--------------------------------------------------------------------------
\RequirePackage[backend=biber,style=authoryear]{biblatex}
\RequirePackage[autostyle=true]{csquotes} 
% Required to generate language-dependent quotes in the bibliography

\addbibresource{bibliography.bib}


% Index
%--------------------------------------------------------------------------
\RequirePackage{makeidx}
\makeindex


% Packages for mathematics and algorithms
%--------------------------------------------------------------------------
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{xfrac}
\RequirePackage{mathtools}
\RequirePackage{wasysym}
\RequirePackage{siunitx}
\newcommand\bmmax{2}
\RequirePackage{bm}
\RequirePackage{amsmath}
\RequirePackage{amssymb}


% Other useful packages
%--------------------------------------------------------------------------
\RequirePackage{blindtext}
\RequirePackage[most]{tcolorbox}
\RequirePackage{booktabs}
\RequirePackage{url}
