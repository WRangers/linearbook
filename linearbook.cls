%% linearbook.cls
%% Copyright 2021 J. Wang
% version 2021/05/01
%
%% Original Copyright 2016 Typesetters.se
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


% 文类定义和选项
%--------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{linearbook}[2021/05/01 A free LaTeX text book template.]

\RequirePackage{xparse}
\RequirePackage{etoolbox}

% 选项
\newbool{custom}            % 自定义中文字体

% 中文字体集选项(参考CTeX文档)
\newcommand\@fontset{windows}
\DeclareOption{adobe}{\renewcommand\@fontset{adobe}}      % Adobe字体
\DeclareOption{ubuntu}{\renewcommand\@fontset{ubuntu}}    % Ubuntu字体
\DeclareOption{mac}{\renewcommand\@fontset{mac}}          % Mac字体
\DeclareOption{windows}{\renewcommand\@fontset{windows}}  % Windows字体
\DeclareOption{fandol}{\renewcommand\@fontset{fandol}}    % Fandol字体
\DeclareOption{custom}{\booltrue{custom}\renewcommand\@fontset{none}}  % 自定义

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\LoadClass[onecolumn,twoside,openany]{book}

% 语言和字体设置
%--------------------------------------------------------------------------
% 基本宏包
\RequirePackage[american]{babel}

\RequirePackage[OT1,T1]{fontenc}
\RequirePackage{inputenc}

% 数学符号
\RequirePackage{amsmath,amsfonts,amssymb,amsthm}
\RequirePackage{extarrows}                          % 特殊箭头
\usepackage[bb=ams,
            frak=boondox,
            scr=boondox,
            cal=pxtx]{mathalpha}

\everymath{\displaystyle}		% 数学公式均为display模式
\allowdisplaybreaks[4]			% 数学公式允许跨页


% 数学字体
%-------------------------------------
\RequirePackage[no-math]{fontspec}
\RequirePackage[math-style=TeX,
                bold-style=ISO]{unicode-math}       % 数学unicode-math宏包
\setmathfont{XITS Math}                             % 数学字体设置为XITS Math
\setmathfont{XITS Math Bold}[version=bold]

% 重设\sum符号
\DeclareSymbolFont{largesymbols}{OMX}{cmex}{m}{n}
\DeclareMathSymbol{\msum}{\mathop}{largesymbols}{"50}
% 重设\pi符号
\DeclareSymbolFont{letters}{OML}{cmm}{m}{it}
\DeclareMathSymbol{\mpi}{\mathord}{letters}{"19}
% 更新符号命令
\renewcommand{\boldsymbol}{\symbf}

% 字号
\newcommand\@lbfontsize{5}

% 配置字体
\RequirePackage[scheme = chinese,
                fontset=\@fontset,
                zihao=\@lbfontsize,
                linespread=1.25,
                heading = true]{ctex}
\ctexset{autoindent=2\ccwd}

\xeCJKsetup{PlainEquation=true}    % 使用$$...$$来输入行间公式
\xeCJKsetup{CJKmath=true}          % 在数学环境中输出CJK字符
\xeCJKsetup{EmboldenFactor=2}      % 伪加粗程度
\xeCJKsetup{CheckSingle=true}      % 避免孤字成行

% 自定义字体
\ifbool{custom}{
  % 中文字体
  \setCJKmainfont[ItalicFont={方正楷体简体}]{Noto Serif CJK SC}
  \setCJKmonofont{方正仿宋简体}
  \setCJKsansfont[AutoFakeBold=true]{方正黑体_GBK}
  % 英文字体
  \setmainfont{XITS}
  \setmonofont{Courier New}
  \setsansfont{Arial}
}


% 插图和表格题注设置
%--------------------------------------------------------------------------
\RequirePackage[font=small,
                labelsep=quad,
                % labelfont={sf},
                position=bottom,
                figurename={图},
                tablename={表}
                ]{caption}
\RequirePackage[labelfont={rm}]{subcaption}
\renewcommand{\thesubfigure}{\alph{subfigure}}

% 交叉引用与书签
%--------------------------------------------------------------------------
\RequirePackage{hyperref}     % 交叉引用
\hypersetup{hidelinks,
            colorlinks=true,
            breaklinks=true}
\RequirePackage{bookmark}     % 书签编号
\bookmarksetup{numbered}

% 页面和边距
%--------------------------------------------------------------------------
\RequirePackage[papersize={8in,10in},
                includemp=true,
                inner=2cm,outer=1.2cm,
                top=2cm,bottom=1.5cm,
                headsep=0.5cm,headheight=0.5cm,
                footskip=0.7cm,
                marginparsep=0.4cm,marginparwidth=4.5cm,
                showframe,                           % for design
                % showcrop                             % for design
                ]{geometry}

% 配色
% 定理等盒子的配色见"盒子环境"部分
%--------------------------------------------------------------------------
\RequirePackage{pagecolor}
\RequirePackage{xcolor}
\definecolor{coverbgcolor}{RGB}{138,1,1}      % 封面背景色
\definecolor{lbdeepblue}{HTML}{118098}
\definecolor{lbblue}{HTML}{00acef}
\definecolor{lbgrayblue}{HTML}{bfd6db}
\definecolor{lbdeepgreen}{HTML}{457d3a}
\definecolor{lbgreen}{HTML}{c7d9b2}
\definecolor{lbred}{HTML}{a3262c}
\definecolor{lbdeepyellow}{HTML}{d18e50}
\definecolor{lbyellow}{HTML}{ce8340}

\definecolor{tssteelblue}{RGB}{70,130,180}
\definecolor{tsorange}{RGB}{255,138,88}
\definecolor{tsblue}{RGB}{23,74,117}
\definecolor{tsforestgreen}{RGB}{21,122,81}
\definecolor{tsyellow}{RGB}{255,185,88}
\definecolor{tsgrey}{RGB}{200,200,200}


% 插图与绘图
%--------------------------------------------------------------------------
\RequirePackage{graphicx}
\graphicspath{{figures/}}

% Tikz
\RequirePackage{tikz}
\usetikzlibrary{datavisualization}
\usetikzlibrary{intersections,angles,quotes}
\usetikzlibrary {arrows.meta}
\usetikzlibrary{datavisualization.formats.functions}
\usetikzlibrary{calc}
\usetikzlibrary{spy}
\usetikzlibrary{patterns,shapes.arrows}
\tikzset{marrow/.style={>={Stealth[round]},shorten >=1pt}}

% Circuitikz
\RequirePackage[siunitx,RPvoltages,european]{circuitikz}

% Pgfplots
\RequirePackage{pgfplots}
\pgfplotsset{compat=newest}
\usepgfplotslibrary{groupplots,dateplot}
% \usepgfplotslibrary{external}

% 背景
%--------------------------------------------------------------------------
\RequirePackage[pages=some]{background}
\backgroundsetup{scale=1,color=black,opacity=1.0,angle=0,contents={}}

% 页眉、页脚和页码
%--------------------------------------------------------------------------
\newcommand{\pplj}{\fontencoding{OT1}\fontfamily{pplj}\fontseries{m}\selectfont}

\RequirePackage{fancyhdr}
\RequirePackage{calc}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headwidth}{\marginparsep}
\addtolength{\headwidth}{\marginparwidth}
\fancyheadoffset[roh,leh]{\marginparwidth + \marginparsep}
\pagestyle{fancy}

\renewcommand{\sectionmark}[1]{\markright{\thesection\quad #1}}%
\renewcommand{\chaptermark}[1]{\markboth{第 \thechapter 章\quad #1}{}}

\fancypagestyle{other}{
  \fancyhf{}
  \fancyhead[RO]{\small \headfont \leftmark \qquad \textbf{\pplj \roman{page}}}
  \fancyhead[LE]{\small \headfont \textbf{\pplj \roman{page}} \qquad \leftmark}
}

\fancypagestyle{content}{
  \fancyhf{}
  \fancyhead[RO]{\small \headfont \rightmark \qquad \textbf{\pplj \thepage}}
  \fancyhead[LE]{\small \headfont \textbf{\pplj \thepage} \qquad \leftmark}
}

\fancypagestyle{chapter-O}{
  \fancyhf{}
  \fancyfootoffset[r]{\marginparwidth + \marginparsep}
  \fancyfoot[R]{\textbf{\pplj \thepage}}
}

\fancypagestyle{chapter-E}{
  \fancyhf{}
  \fancyfootoffset[l]{\marginparwidth + \marginparsep}
  \fancyfoot[L]{\textbf{\pplj \thepage}}
}

\RequirePackage{ifoddpage}
% Chapter样式
%--------------------------------------------------------------------------
\renewcommand{\@makechapterhead}[1]{
  \checkoddpage
  \@ifoddpage{ % 奇数页
    \begin{tikzpicture}[remember picture,overlay]
      \node at (current page.north west)
        {
          \begin{tikzpicture}[remember picture,overlay]
            \draw[fill=lbdeepblue,draw opacity=0]
              ++(0,-2cm) rectangle ++(\paperwidth,-4pt);
            \node[color=lbdeepgreen,inner sep=12pt,below left] (chapter)
              at  +(\paperwidth-1.2cm,-2cm) {\fontsize{40pt}{1pt}\selectfont\pplj \thechapter};
            \draw[line width=2pt,color=lbgreen]
              ++(\paperwidth-1.2cm,0) |- ($(chapter.south west)+(0,4pt)$);
            \node[color=lbdeepblue,left,outer sep=2pt] at (chapter.south west)
              {
                \parbox[c][][c]{10cm}
                {\flushright\Huge\titlefont   #1}
              };
          \end{tikzpicture}
        };
    \end{tikzpicture}
    \vspace{7cm}
    % 页面样式
    \thispagestyle{chapter-O}
  }{ % 偶数页
    \begin{tikzpicture}[remember picture,overlay]
      \node at (current page.north west)
        {
          \begin{tikzpicture}[remember picture,overlay]
            \draw[fill=lbdeepblue,draw opacity=0]
              ++(0,-2cm) rectangle ++(\paperwidth,-4pt);
            \node[color=lbdeepgreen,inner sep=12pt,below right] (chapter)
              at  +(1.2cm,-2cm) {\fontsize{40pt}{1pt}\selectfont\pplj \thechapter};
            \draw[line width=2pt,color=lbgreen]
              ++(1.2cm,0) |- ($(chapter.south east)+(0,4pt)$);
            \node[color=lbdeepblue,right,outer sep=2pt] at (chapter.south east)
              {
                \parbox[c][][c]{10cm}
                {\flushleft\Huge\titlefont   #1}
              };
          \end{tikzpicture}
        };
    \end{tikzpicture}
    \vspace{7cm}
    % 页面样式
    \thispagestyle{chapter-E}
  }
}

% Chapter 导言
%--------------------------------------------------------------------------
\newcommand{\introhead}[2][7cm]{
  \checkoddpage
  \@ifoddpage{ % 奇数页
    \begin{tikzpicture}[remember picture,overlay]
      \node at (current page.north west)
        {
          \begin{tikzpicture}[remember picture,overlay]
            \node[below right,inner sep=12pt] (text) at ++(2cm,-5cm)
              {
                \parbox[c][][c]{#1}
                {\small #2}
              };
            \draw[line width=2pt,color=lbgreen]
              ++(2cm,-2cm-4pt) |- (text.south east);
          \end{tikzpicture}
        };
    \end{tikzpicture}
    \vspace{2cm}
  }{ % 偶数页
    \begin{tikzpicture}[remember picture,overlay]
      \node at (current page.north west)
        {
          \begin{tikzpicture}[remember picture,overlay]
            \node[below left,inner sep=12pt] (text) at ++(\paperwidth-2cm,-5cm)
              {
                \parbox[c][][c]{#1}
                {\small #2}
              };
            \draw[line width=2pt,color=lbgreen]
              ++(\paperwidth-2cm,-2cm-4pt) |- (text.south west);
          \end{tikzpicture}
        };
    \end{tikzpicture}
    \vspace{2cm}
  }
}

% Section等样式
%--------------------------------------------------------------------------
\ctexset{
  section={
    format+=\normalfont\raggedright\bfseries\color{lbdeepblue},
    numberformat=\pplj\color{lbdeepyellow},
    aftertitle = \color{lbdeepyellow!50}\par\medskip\nointerlineskip\rule{\linewidth}{1pt}\par
  },
  subsection={
    format+=\normalfont\color{lbdeepblue},
    numberformat=\pplj\color{lbdeepyellow}
  },
  subsubsection={
    format+=\normalfont\blackheavy\color{lbdeepblue}
  }
}

% 分割线
%--------------------------------------------------------------------------
\newcommand{\lbline}{
  \checkoddpage
  \@ifoddpage{\par
    \tikz[remember picture,overlay] \draw[fill=lbdeepblue,draw opacity=0]
    (-2.74cm,0) rectangle ++(\paperwidth,-4pt);\par
    \vspace*{1em}\par
  }{\par
    \tikz[remember picture,overlay] \draw[fill=lbdeepblue,draw opacity=0]
    (-6.84cm,0) rectangle ++(\paperwidth,-4pt);\par
    \vspace*{1em}\par
  }
}

% 目录样式
%--------------------------------------------------------------------------


% 盒子环境
%--------------------------------------------------------------------------
% 颜色配置
\definecolor{lbdefcolor}{HTML}{008194}  % 定义颜色
\definecolor{lbthecolor}{HTML}{ffb94c}  % 定理颜色
\definecolor{lblemcolor}{HTML}{a8a8a8}  % 引理颜色
\definecolor{lbremcolor}{HTML}{9ab685}  % 标注颜色
\definecolor{lbexacolor}{HTML}{a62b31}  % 例子颜色

\RequirePackage[many]{tcolorbox}
\newtheoremstyle{lbstyle}%
  {}%
  {}%
  {}%
  {}%
  {\sffamily\bfseries}%
  {}%
  {.5em}%
  {}%

\renewenvironment{proof}{{\sffamily\bfseries\,证明 }\setlength{\parindent}{2\ccwd}}{\hfill $\color{lbthecolor}\blacksquare$}

\theoremstyle{lbstyle}{
  \newtheorem*{remark}{\,注}
}

\theoremstyle{lbstyle}{
  \newtheorem{definition}{定义}[section]
}
\renewcommand{\thedefinition}{\thechapter.\arabic{section}.\arabic{definition}}

\theoremstyle{lbstyle}{
  \newtheorem{theorem}{定理}[section]
}
\renewcommand{\thetheorem}{\thechapter.\arabic{section}.\arabic{theorem}}

\theoremstyle{lbstyle}{
  \newtheorem{lemma}{\,引理}[section]
}
\renewcommand{\thelemma}{\thechapter.\arabic{section}.\arabic{lemma}}

\theoremstyle{lbstyle}{
  \newtheorem{example}{\,例}[chapter]
}
\renewcommand{\theexample}{\arabic{chapter}.\arabic{example}}

% \theoremstyle{lbstyle}{
%     \newtheorem{exercise}{}[chapter]
% }

% 解答环境
\newcommand*{\sed}[1][$\color{lbexacolor}\blacksquare$]{%
\leavevmode\unskip\penalty9999 \hbox{}\nobreak\hfill
    \quad\hbox{#1}%
}
\newenvironment{solution}[1][解]{\setlength{\parindent}{2\ccwd}
  \pushQED{\sed}%
  % \normalfont \topsep6\p@\@plus6\p@\relax
  % \trivlist
  % \item[\sffamily\bfseries
  %   \,#1\hspace{.5em}]\ignorespaces
  \par\noindent\,{\sffamily\bfseries #1}\hspace{.5em}\ignorespaces
}{\popQED\@endpefalse\par}

% 盒子设置
\tcolorboxenvironment{definition}{
  boxrule=0pt,
  boxsep=2pt,
  colback={white!90!lbdefcolor},
  enhanced jigsaw,
  borderline west={2pt}{-7pt}{lbdefcolor},
  sharp corners,
  before skip=10pt,
  after skip=10pt,
  left=0pt,
  right=0pt,
  breakable,
}

\tcolorboxenvironment{theorem}{
  boxrule=0pt,
  boxsep=2pt,
  colback={white!90!lbthecolor},
  enhanced jigsaw,
  borderline west={2pt}{-7pt}{lbthecolor},
  sharp corners,
  before skip=10pt,
  after skip=10pt,
  left=0pt,
  right=0pt,
  breakable,
}

\tcolorboxenvironment{lemma}{
  boxrule=0pt,
  boxsep=2pt,
  blanker,
  borderline west={2pt}{-7pt}{lblemcolor},
  before skip=10pt,
  after skip=10pt,
  sharp corners,
  left=0pt,
  right=0pt,
  breakable,
}

\tcolorboxenvironment{proof}{
  boxrule=0pt,
  boxsep=2pt,
  blanker,
  before skip=10pt,
  after skip=10pt,
  left=0pt,
  right=0pt,
  breakable,
}

\tcolorboxenvironment{remark}{
  boxrule=0pt,
  boxsep=2pt,
  blanker,
  borderline west={2pt}{-7pt}{lbremcolor},
  before skip=10pt,
  after skip=10pt,
  left=0pt,
  right=0pt,
  breakable,
}

\tcolorboxenvironment{remark}{
  boxrule=0pt,
  boxsep=2pt,
  blanker,
  before skip=10pt,
  after skip=10pt,
  left=0pt,
  right=0pt,
  breakable,
}

\tcolorboxenvironment{example}{
  boxrule=0pt,
  boxsep=2pt,
  blanker,
  borderline west={2pt}{-7pt}{lbexacolor},
  sharp corners,
  before skip=10pt,
  after skip=10pt,
  left=0pt,
  right=0pt,
  breakable,
}

% 环境
%--------------------------------------------------------------------------
\newcounter{fullwidthlinewidth}
\newenvironment{fullwidth}[1][2]
    { \checkoddpage
      \setcounter{fullwidthlinewidth}{#1}
      \par\vspace*{5mm}\noindent
      \@ifoddpage{\hspace{-2pt}}{\hspace{-\marginparwidth-\marginparsep-3pt}}
      \begin{minipage}{\textwidth+\marginparwidth+\marginparsep}
      {\color{lbgreen}\hrule height #1pt}\medskip
    }
    {
      \medskip{\color{lbgreen}\hrule height \value{fullwidthlinewidth}pt}
      \end{minipage}\vspace*{5mm}
    }
% \newenvironment{fullwidth}[1][2]
%     { \checkoddpage
%       \setcounter{fullwidthlinewidth}{#1}
%       \par\vspace*{5mm}
%       \@ifoddpage{
%         \begin{adjustwidth}{0em}{-\marginparwidth-\marginparsep}\sj
%       }{
%         \begin{adjustwidth}{-\marginparwidth-\marginparsep}{0em}\sj
%       }
%       {\color{lbgreen}\hrule height #1pt}\medskip
%     }
%     {
%       \medskip{\color{lbgreen}\hrule height \value{fullwidthlinewidth}pt}
%       % \end{minipage}\vspace*{5mm}
%       \end{adjustwidth}\vspace*{5mm}
%     }

% 旁注
%--------------------------------------------------------------------------
\RequirePackage{marginnote,sidenotes}
\renewcommand*{\raggedleftmarginnote}{\noindent}
\renewcommand*{\raggedrightmarginnote}{\noindent}
\newcommand{\mnn}[1]{\textsuperscript{\thesidenote}{}\marginnote{\textsuperscript{\thesidenote}{}~\small #1}\refstepcounter{sidenote}}
% 在定理,定义等环境中使用,有标号,不会重叠
\newcommand{\mn}[1]{\marginnote{\small #1}} % 无标号,会重叠
\newcommand{\snn}[1]{\sidenote{\small #1}}  % 有标号,不会重叠,定义定理等环境中无法使用

%% TODO 每个chapter后面把旁注编号计数器清零

% 参考文献
%--------------------------------------------------------------------------
\RequirePackage[backend=biber,
            style=gb7714-2015ms,  % 同一文献表中不同语言区分著录格式的样式 (gb7714-2015ms)
            gbstyle=false,
            hyperref=true,
            % backref=true,
            ]{biblatex}
\addbibresource{bibliography.bib}

% 索引
%--------------------------------------------------------------------------
% \RequirePackage{makeidx}
% \makeindex

% 其他宏包
%--------------------------------------------------------------------------
\RequirePackage{blindtext}          % 无厘头文字
\RequirePackage{booktabs}           % 表格线
\RequirePackage{makecell}           % 表格格式组织
\RequirePackage{multirow}           % 表格行列格式
\RequirePackage{url}                % 超链接
\RequirePackage{hologo}	            % TeX系列标识
\RequirePackage{siunitx}            % 标准单位宏包
\RequirePackage{xfrac}              % 优化行内斜分数 \sfrac{1}{2}
\RequirePackage{ragged2e}           % 断词宏包
\RequirePackage{wrapfig}            % 图文绕排
\RequirePackage{multicol}           % 多栏
\RequirePackage{paralist}	          % 列表宏包
\RequirePackage{floatrow}           % 图表浮动组
\RequirePackage{physics}            % 物理宏包
\RequirePackage{fix-cm}             % 调整字号
\RequirePackage{pdfpages}           % 插入pdf页面
\RequirePackage{romanbar}           % 罗马数字
\RequirePackage{tabularx}           % 表格宏包
\RequirePackage{pifont}             % 符号宏包
\RequirePackage{changepage}         % 改变页面边距

% 自定义命令
%--------------------------------------------------------------------------
\newcommand{\sj}[1][2]{\hspace{#1\ccwd}}     % 手动缩进命令:\sj[<数字>自定义距离],默认为两个字宽.
\newcommand{\hc}[1]{\textbf{\blackheavy #1}} % 黑体加粗,用于第一次出现的名词概念和版权页部分内容.
\newcommand{\LBK}{L\kern-.255em\raise.5ex\hbox{B}\kern-.125em\lower.1em \hbox{K}}
\endinput