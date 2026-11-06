#import "../style.typ": *
#import "@preview/subpar:0.2.2"
#show: setup

#set document(title: "Report Spectroscopy I")

#align(center)[
  #text(size: 15pt, weight: "bold")[
    Introduction in Spectroscopy and measurement of the Balmer series.
  ]

  #v(0.8em)

  #text(size: 11pt)[
    Kiran Suda, Lukas Mengis \
    13 October 2026
  ]
]

#v(2em)

#align(center)[
  #text(weight: "bold")[Abstract]
]

#v(0.5em)

#align(center)[
  abstract
]

= Introduction

introduc

= Experiment

experiment




= Results
==
results

= Data Analysis
==
analysis


= Discussion

discussion

= Conclusion

conclusion





#pagebreak()
#set heading(numbering: "A")

#set heading(numbering: "A")

#counter(heading).update(0)
#set heading(numbering: "A.1.i")
= Appendix
== python skript <python>
```python

```

#pagebreak()


#bibliography("sources.bib")
