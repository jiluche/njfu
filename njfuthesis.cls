\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{njfuthesis}[2021/05/11 NJFU thesis class]

\newif\ifcover\coverfalse
\DeclareOption{cover}{\covertrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
% Handle non-implemented options
\LoadClass[zihao=-4]{ctexbook}[2015/03/15]

%%%%%%%%%%%%%%%%%%%%%%%%%%% Required packages %%%%%%%%%%%%%%%%%%%%%
%% for chinese numbers
\RequirePackage{zhnumber}
\zhnumsetup{time=Chinese}

%% To include font for @lable@thesis
\RequirePackage{fontspec}

%% other common packages
\ifcover
	\RequirePackage[paperwidth=44cm, paperheight=29.7cm,bottom=0cm]{geometry}
\else
	\RequirePackage[left=2.4cm, right=2.3cm, top=2.3cm, bottom=2.0cm]{geometry} % paper layout
\fi
\RequirePackage{mathtools, amsthm, amsfonts, amssymb, bm}  % math
\RequirePackage{fancyhdr} % page styles
\RequirePackage[xetex]{hyperref} % hyperrefs
%% captions
\RequirePackage[margin=0pt,justification=centering, labelsep=space, belowskip=-5pt]{caption} % left right margin=0center captions
\RequirePackage{bicaption}  % bicaption for tables and figures
%% figure
\RequirePackage{graphicx} % import image
%% table
\RequirePackage{booktabs,multirow} % table config
\RequirePackage{threeparttable} % table with comments
%% prevent floats move across sections
\RequirePackage[section]{placeins}



%%%%%%%%%%%%%%%%%%%%%%%%%%% Configurations %%%%%%%%%%%%%%%%%%%%%
%% font setting
\setmainfont{Times New Roman}
%\setCJKmainfont{宋体}  % optional
\setCJKfamilyfont{fdbsjw}{fdbsjw.ttf}[AutoFakeBold=1.5]
\newcommand*\fdbsjw{\CJKfamily{fdbsjw}}
%% ensong
\newfontfamily\ensong{SimSun}


%% citation
\RequirePackage[square,comma,super,sort&compress]{natbib}  %cite format sup/not sup
\bibliographystyle{bib/GBT7714-2005NLang/GBT7714-2005_NJFU}  % bib style
\setcounter{secnumdepth}{3}  % section depth
\setcounter{tocdepth}{3}	% toc depth
\renewcommand*\contentsname{目\hspace{1em}录} % TOC title
\hypersetup{% set hyperlinks.
    %pdftitle={},% title
    %pdfauthor={},% author
    %pdfsubject={},% subject
    %pdfkeywords={keyword1}{key2} {key3},% list of keywords, and uncomment this line if desired
    %pdftoolbar=true,% show Acrobat’s toolbar?
    %pdfmenubar=true,% show Acrobat’s menu?
    pdffitwindow=false,% window fit to page when opened
    pdfstartview={FitH},% fits the width of the page to the window
    %pdfnewwindow=true,% links in new window
    colorlinks=true,% false: boxed links; true: colored links
    linkcolor=black,% color of internal links
    citecolor=black,% color of links to bibliography
    filecolor=blue,% color of file links
    urlcolor=blue% color of external links
    %hidelinks% remove link color and border.
}

%% caption setting
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}} % set Fig 2-1 default 2.1
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\captionsetup[figure][bi-first]{font=small,textfont=bf}  % chinese setting
\captionsetup[table][bi-first]{font=small,textfont=bf}	
\captionsetup[figure][bi-second]{font=small,name=Fig.,textfont=normalsize} % english setting
\captionsetup[table][bi-second]{font=small,name=Tab.,textfont=normalsize}

%% equation related
\setlength\abovedisplayskip{0pt}% set display skip between equations and main words
\setlength\belowdisplayskip{0pt}



%%%%%%%%%%%%%%%%%%%%%%%%%%% labels in chinese %%%%%%%%%%%%%%%%%%%%%%
%% cover page
\def\NJFU@label@classification{分类号}
\def\NJFU@label@UDC{U\hspace{2pt} D\hspace{2pt} C}
\def\NJFU@label@confidential{密\quad 级}
\def\NJFU@label@degreecode{学位代码}
\def\NJFU@label@schoolcode{学校代码}
\def\NJFU@label@studentid{学\quad\quad 号}
\def\NJFU@label@thesis{博\hspace{10pt}士\hspace{11pt}学\hspace{11pt}位\hspace{11pt}论\hspace{11pt}文}

%% title, author, major, area, advisor, date
\def\NJFU@label@title{论文题目:}
\def\NJFU@label@author{作\hspace{30pt}者:}
\def\NJFU@label@major{专\hspace{30pt}业:}
\def\NJFU@label@area{研究方向:}
\def\NJFU@label@advisor{指导教师:}

%% statements
\def\NJFU@label@statement{学位论文原创性声明}
\def\NJFU@label@singature{学位论文作者（本人签名）:}
\def\NJFU@label@sigdate{年月日}
\def\NJFU@label@accredit{学位论文出版授权书}
\def\NJFU@label@remuneration{稿酬领取通知}

%% thanks
\def\NJFU@label@thanks{致\hspace{1em}谢}

%% abstract
\def\NJFU@label@abstract{摘\hspace{1em}要}
\def\NJFU@label@keywords{关键词:}
\def\NJFU@label@englishabstract{Abstract}
\def\NJFU@label@englishkeywords{Keywords:}

%% publication
\def\NJFU@label@publication{攻读学位期间发表的学术论文}

%% table and figures
\def\NJFU@listoffiguresandtables{图表目录}


%%%%%%%%%%%%%%%%%%%%%%%%%%% values in chinese %%%%%%%%%%%%%%%%%%%%%%
%% cover page
\def\NJFU@value@title{}
\def\NJFU@value@author{}
\def\NJFU@value@major{}
\def\NJFU@value@area{}
\def\NJFU@value@advisor{}
\def\NJFU@value@englishtitle{}
\def\NJFU@value@coverdate{\zhdigits{20}\hspace{20pt}年\hspace{20pt}月}

%% backbone
\def\NJFU@value@titleBackbone{论\\文\\题\\目\\}
\def\NJFU@value@authorBackbone{姓\\名\\}
\def\NJFU@value@schoolBackbone{南\\京\\林\\业\\大\\学}


%%%%%%%%%%%%%%%%%%%%%%%%%%% helpful definitions %%%%%%%%%%%%%%%%%%%%%%
%% space marco
\newcommand\NJFUspace{\protect\quad\protect\quad}
%% empty space without actual line
\def\NJFU@underline[#1]#2{%
	\hbox to #1 {\hfill #2 \hfill}
}

%% actual underline not seem to be working now
\def\NJFUunderline[#1]#2{\@ifnextchar[\underline{\hbox to #1 {\hfill #2 \hfill}}\underline}


%%%%%%%%%%%%%%% commands to set values in chinese %%%%%%%%%%%%%%%%%%%%%
%% cover page
\newcommand\classification[1]{\def\NJFU@value@classification{#1}}
\newcommand\degreecode[1]{\def\NJFU@value@degreecode{#1}}
\newcommand\UDC[1]{\def\NJFU@value@UDC{#1}}
\newcommand\schoolcode[1]{\def\NJFU@value@schoolcode{#1}}
\newcommand\confidential[1]{\def\NJFU@value@confidential{#1}}
\newcommand\studentid[1]{\def\NJFU@value@studentid{#1}}
\renewcommand\title[1]{\def\NJFU@value@title{#1}}
\newcommand\englishtitle[1]{\def\NJFU@value@englishtitle{#1}}
\renewcommand\author[1]{\def\NJFU@value@author{#1}}
\newcommand\major[1]{\def\NJFU@value@major{#1}}
\newcommand\area[1]{\def\NJFU@value@area{#1}}
\newcommand\advisor[1]{\def\NJFU@value@advisor{#1}}
\newcommand\coadvisor[1]{\def\NJFU@value@coadvisor{#1}}
\newcommand\coverdate[2]{\def\NJFU@value@coverdate{\zhdigits{#1}年\zhnumber{#2}月}}
\newcommand\titleBackbone[1]{\def\NJFU@value@titleBackbone{#1}}
\newcommand\authorBackbone[1]{\def\NJFU@value@authorBackbone{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% page layout %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% set line spacing
\newcommand\linespacing[1]{\setlength{\baselineskip}{#1}}

%% not sure what this does
\oddsidemargin 0 true cm
\if@twoside
  \evensidemargin 0 true cm
\else
  \evensidemargin 0 true cm
\fi

%% function to clear double page
\def\cleardoublepage{%
  \clearpage%
  \if@twoside%
    \ifodd\c@page%
      % do nothing
    \else%
      \thispagestyle{empty}%
      \hbox{}%
      \newpage%
      \if@twocolumn%
        \hbox{}%
        \newpage%
      \fi%
    \fi%
  \fi}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% set page style%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% counter for frontmatter roman | Roman | numbering
%\renewcommand\frontmatter{\pagenumbering{roman}}

%% clear header and set page numbering in page middle foot
\pagestyle{fancy}
	\fancyhf{}
	\fancyhead[LO]{\zihao{-5}博士论文}
	\fancyhead[RO]{\zihao{-5}\NJFU@value@title}
	\fancyhead[LE]{\zihao{-5}\leftmark}	
	\fancyhead[RE]{\zihao{-5}博士论文}
	\fancyfoot[CO,CE]{\zihao{-5}~\thepage~}
	%\renewcommand{\headrulewidth}{0pt}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%% chapter title format %%%%%%%%%%%%%%%%%%%%%%%%
%% chapter title format
\def\CTEX@chapter@nameformat{\heiti\zihao{3}}
\def\CTEX@chapter@titleformat{\heiti\zihao{3}}
\def\CTEX@chapter@beforeskip{0pt}
\def\CTEX@chapter@afterskip{10pt}

%% section title format
\def\CTEX@section@format{\heiti\zihao{-3}}
\def\CTEX@section@beforeskip{3pt}
\def\CTEX@section@afterskip{3pt}

%% subsection title format
\def\CTEX@subsection@format{\songti\zihao{4}}
\def\CTEX@subsection@beforeskip{3pt}
\def\CTEX@subsection@afterskip{3pt}

%% subsubsection title format
\def\CTEX@subsubsection@format{\songti\zihao{4}}
\def\CTEX@subsubsection@beforeskip{3pt}
\def\CTEX@subsubsection@afterskip{3pt}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Utility functions %%%%%%%%%%%%%%%%%%%%%%%%%%
% make cover page
\renewcommand\maketitle{%

	\thispagestyle{empty}
	
	
	\hspace{-3.68cm}\makebox[0pt][l]{
	\raisebox{-23.3cm}[0pt][0pt]{%
		\includegraphics[width=44.45cm,height=27.03cm]{img/cover.png}}}
	
	\vspace{-0.9cm}
	\hspace{19.5cm}
	\parbox[t]{20.3cm}{%
	%\begin{center}
	\heiti\zihao{-3}
	\hspace{78pt}\NJFU@label@classification~\NJFU@underline[253pt]{\NJFU@value@classification}
	\NJFU@label@degreecode~\NJFU@underline[100pt]{\NJFU@value@degreecode} 

	\hspace{78pt}\NJFU@label@UDC~\NJFU@underline[255pt]{\NJFU@value@UDC}
	\NJFU@label@schoolcode~\NJFU@underline[100pt]{\NJFU@value@schoolcode} 

	\hspace{78pt}\NJFU@label@confidential~\NJFU@underline[253pt]{\NJFU@value@confidential}
	\NJFU@label@studentid~\NJFU@underline[100pt]{\NJFU@value@studentid}
	
	\vspace{6.1cm}	
	\begin{center}
	
	{\bfseries\fdbsjw\zihao{0}{\NJFU@label@thesis}} % TODO this font need to be bolded 
	
	\vspace{3.7cm}
	\heiti\zihao{3}
	\NJFU@label@title ~\NJFU@underline[260pt]{\NJFU@value@title}\\
	\vspace{15pt}
	\NJFU@label@author ~\NJFU@underline[260pt]{\NJFU@value@author}\\
	\vspace{15pt}
	\NJFU@label@major ~\NJFU@underline[260pt]{\NJFU@value@major}\\
	\vspace{15pt}
	\NJFU@label@area ~\NJFU@underline[260pt]{\NJFU@value@area}\\
	\vspace{15pt}
	\NJFU@label@advisor ~\NJFU@underline[260pt]{\NJFU@value@advisor}\\
	\vspace{50pt}
	\songti \zihao{4}
	\NJFU@value@coverdate
	\end{center}
	}
	
	\vspace{-22.5cm}\hspace{18.5cm}\parbox[t]{1cm}{ \heiti\zihao{4}\linespacing{0em}\NJFU@value@titleBackbone \vskip 7.5cm \NJFU@value@authorBackbone \vskip 8.7cm \NJFU@value@schoolBackbone}
	\restoregeometry
}

%% make statement part
\newcommand\statement[1]{%
	\parbox{\textwidth}{\centering\heiti\zihao{3}\NJFU@label@statement}
	\vskip 1em
	\parbox{\textwidth}{\kaishu\linespacing{22pt}\hspace{1.8em}#1}
	\vskip 2em
	\parbox{\textwidth}{\kaishu\hspace{1em}\NJFU@label@singature\hspace{13em} 年\hspace{2em}月\hspace{2em}日}
}

%% make accredit part
\newcommand\accredit[1]{
	\vskip 1em
	\parbox{\textwidth}{\centering\heiti\zihao{3}\NJFU@label@accredit}
	\vskip 1em
	\parbox{\textwidth}{\kaishu\linespacing{22pt}\hspace{1.8em}#1}
	\vskip 2em
	\parbox{\textwidth}{
		\songti\bfseries 论文密级：\\
		$\square$公开\hspace{1em} $\square$保密（\underline{\hspace{2em}}年\underline{\hspace{1em}}月至\underline{\hspace{2em}}年\underline{\hspace{1em}}月）（保密的学位论文在解密后应遵守此协议）\\
		作者签名：\underline{\hspace{6em}}\hspace{14em} 导师签名：\underline{\hspace{6em}}\\
		\hspace*{5em}\underline{\hspace{3em}}年\underline{\hspace{1em}}月\underline{\hspace{1em}}日\hfill \underline{\hspace{3em}}年\underline{\hspace{1em}}月\underline{\hspace{1em}}日
	}
}

%% make remuneration part
\newcommand\remuneration[1]{
	\rule{\textwidth}{0.4pt}
	\vskip 0.5em
	\parbox{\textwidth}{\centering\heiti\NJFU@label@remuneration}
	\vskip 1em
	\parbox{\textwidth}{
		\kaishu\linespacing{22pt}\hspace{1.8em}#1\\
		\songti
		\hspace*{2em}{\bf 联系人：}吴老师\hfill
		{\bf 电话：}010-62791817（兼传真）、62793176、62701179（兼传真）\\
		\hspace*{2em}{\bf 通讯地址：}北京\hspace{1em}清华大学邮局84-48信箱\hspace{1em}采编中心\hspace{5em}
		{\bf 邮编：}100084
	}
}%


%%%%%%%%%%%%%%%%%%%%%%%% page layout for unnumbered chapters %%%%%%%%%%%%%%%%%%%
%% thanks
\renewenvironment{thanks}{
	{\chapter{\NJFU@label@thanks}}	
	\kaishu}{\vskip 3em \hspace{23em}作者: \NJFU@value@author \par
	\hspace{23em} \zhtoday
}

%% chinese abstract
\newenvironment{abstract}{
	{\chapter{\NJFU@label@abstract}}}{}

%% chinese keywords
\newcommand\keywords[1]{{{\bf \NJFU@label@keywords} #1}}

%% english abstract
\newenvironment{englishabstract}{
	{\chapter[\NJFU@label@englishabstract]{\NJFU@value@englishtitle}
	\begin{center}\zihao{3}Abstract\end{center}}}{}

%% english keywords
\newcommand\englishkeywords[1]{{{\bf \NJFU@label@englishkeywords} #1}}


%% reference
\renewenvironment{thebibliography}[1]
     {\chapter[\bibname]{\bibname}\ensong%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}
      \list{\@biblabel{\@arabic\c@enumiv}}% first define index 
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin0pt
            \itemindent45pt
            \itemsep-0.4em
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%define values
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

%% publication
\newenvironment{publication}[1]
     {\chapter[\NJFU@label@publication]{\NJFU@label@publication}\ensong%
      \@mkboth{\MakeUppercase\NJFU@label@publication}{\MakeUppercase\NJFU@label@publication}
      \list{\@biblabel{\@arabic\c@enumiv}}% first define index 
           {\settowidth\labelwidth{\@biblabel{#1}}%
           	\leftmargin0pt
            \itemindent45pt %indent of numbers
            \itemsep0em %the line space
            \parsep0pt
            \parskip0pt
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%define values
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publication' environment}}%
      \endlist}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    TOC       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% fill gap between chapters and pages in toc
\renewcommand*\l@chapter[2]{
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode 
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak
      \leaders\hbox{$\m@th\mkern 1mu\bm{\bm\cdot}\mkern 1mu$}
      \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi
}

%% build table of contents
\renewcommand\tableofcontents{
	\if@twocolumn
	  \@restonecoltrue\onecolumn
	\else
	  \@restonecolfalse
	\fi
	{\chapter{\contentsname}}
	\@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}
	\@starttoc{toc}
	\if@restonecol\twocolumn\fi
}


%% together
\newcommand*\listoffiguresandtables{%
  {\chapter{\NJFU@listoffiguresandtables}%
  \@mkboth{\MakeUppercase\NJFU@listoffiguresandtables}%
          {\MakeUppercase\NJFU@listoffiguresandtables}%
  \@starttoc{lof}%% list of figures
  \bigskip       %% space
  \@starttoc{lot}%% list of tables
  }
}
%

%% no idea what this does
\addtocontents{toc}{\let\string\quad\relax}


%%%%%%%%%%%%%%%%%%%%%%%%%%% Figure and Tables %%%%%%%%%%%%%%%%%% normal cite
%% figure and table




\newcommand{\ncite}[1]{\scalebox{1.3}[1.3]{\raisebox{-0.75ex}{\cite{#1}}}}
