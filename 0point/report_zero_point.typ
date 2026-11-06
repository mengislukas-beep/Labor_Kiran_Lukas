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
== Calibration
For the Calibration two Data-Points were measured. The first point is the output voltage at laboratory pressure $(p_l, U_l)$. The second point is at low pressure $(p_2, U_2)$. We have:
$
  (p_l, U_l) = ((951 plus.minus 1) "mbar", (127.6 plus.minus 0.2) "mV")
$
$
  (p_2, U_2) = ((0.1 plus.minus 0.1) "mbar", (-5.3 plus.minus 0.2) "mV")
$


== Absolute Zero
== Liquid Nitrogen

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
