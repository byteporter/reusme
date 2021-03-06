m4_include(`shared-style-config.m4')m4_dnl
% This file is generated by a tool. Please edit the template file resume.css.m4 and build with 'make tools/style-templates/pdftemplate.tex.m4'
% Copyright 2018 James Lind
% Modeled off of Mark Szepieniec's <http://github.com/mszep> modification of Christophe-Marie Duequesne's <chmd@chmd.fr> ConTeXt style

\startmode[*mkii]
  \enableregime[utf-8]  
  \setupcolors[state=start]
\stopmode
$if(mainlang)$
\mainlanguage[$mainlang$]
$endif$

\definecolor[rulecolor][h=__COLOR_BREAK]
\definecolor[sectioncolor][h=__COLOR_HEADER]
\definecolor[contentcolor][h=__COLOR_BODY]

% Enable hyperlinks
% \setupinteraction[state=start, color=contentcolor]

\setuppapersize [$if(papersize)$$papersize$$else$letter$endif$][$if(papersize)$$papersize$$else$letter$endif$]
\setuplayout    [width=middle, height=middle,
                 backspace=15mm, cutspace=0mm,
                 topspace=15mm, bottomspace=15mm,
                 header=0mm, footer=0mm]

\unhyphenated
\setupalign [verytolerant,stretch]

%\setuppagenumbering[location={footer,center}]

% === fonts
\definefontfeature [default] [default] [onum=no]
\definefontfamily [resume] [sans] [Open Sans Light] [bf=Open Sans]

\setupbodyfont [resume, sans, 11pt]
% ====== end fonts


\setupwhitespace[small]

\definefontsize[e]
\definebodyfontenvironment[default][e=__H1_SIZE(),d=__H2_SIZE(),c=__H3_SIZE(),b=__H4_SIZE(),a=__H5_SIZE()]
\setupcolors[textcolor=contentcolor]

\setupblackrules[width=71mm, height=1mm, color=rulecolor]

\setuphead[section]             [style=\bfe, align=middle, color=sectioncolor, after={\blank[nowhite]}, before={\blank[nowhite]}]
\setuphead[subsection]          [style=\bfd, align=flushleft, after={\blackrule}]
\setuphead[subsubsection]       [style=\bfc, after={}]
\setuphead[subsubsubsection]    [style=\bfb]
\setuphead[subsubsubsubsection] [style=\bfa]

$if(number-sections)$
$else$
\setuphead[chapter, section, subsection, subsubsection, subsubsubsection][number=no]
$endif$

%\setupdescriptions[width=10mm]


\definedescription
  [description]
  [headstyle=normal, style=normal,
   location=hanging, width=18mm, distance=14mm, margin=0cm]

\setupitemize[autointro, packed]    % prevent orphan list intro
\setupitemize[indentnext=no]

\setupdelimitedtext
  [blockquote]
  [before={\setupalign[middle]},
   indentnext=no,
  ]

% \setupfloat[figure][default={here,nonumber}]
% \setupfloat[table][default={here,nonumber}]

% No clue why 'location=bottom' is needed to center this, there is no useful documentation to be found on \setupxtable. Seems to follow the same format
% as framed or maybe floats though? This was mostly trial and error. 'offset=none' is also important.
\setupxtable[frame=off,location=bottom,offset=none,option={stretch,width}]

% Showing boxes helps with debugging the layout
% \showboxes

% pandoc outputs \thinrule for horizontal rules but these are on the baseline. I want it on the middle so I overrode the built-in to use \textrule instead
% VERY hacky but I don not know of a better way at this time

\setuptextrules[rulecolor=rulecolor, rulethickness=.2mm]
\redefine\thinrule{\textrule[middle]{}}

$if(toc)$
\setupcombinedlist[content][list={$placelist$}]

$endif$
$for(header-includes)$
$header-includes$
$endfor$

\starttext
$if(title)$
\startalignment[center]
  \blank[2*big]
  {\tfd $title$}
$if(author)$
  \blank[3*medium]
  {\tfa $for(author)$$author$$sep$\crlf $endfor$}
$endif$
$if(date)$
  \blank[2*medium]
  {\tfa $date$}
$endif$
  \blank[3*medium]
\stopalignment
$endif$
$for(include-before)$
$include-before$
$endfor$
$if(toc)$
\placecontent
$endif$

$body$

$for(include-after)$
$include-after$
$endfor$
\stoptext
