#import "../style.typ": *
#import "@preview/subpar:0.2.2"
#show: setup

#set document(title: "Report Spectroscopy I")

#align(center)[
  #text(size: 15pt, weight: "bold")[
    spectro 2
  ]

  #v(0.8em)

  #text(size: 11pt)[
    Lukas Mengis, Kiran Suda \
    21 November 2026
  ]
]

#v(2em)

#align(center)[
  #text(weight: "bold")[Abstract]
]

#v(0.5em)

#align(center)[
  
]

= Introduction

= Experiment

= Results
== Calibration
For the k-value of the 0th-order ($k_0$), we measured:
$
  k_0 = 1126 pm 2
$
For the known Helium-Lines we measured the following k-values. For this we measured the k-value when the spectral line was on the center pixel position $p_c$.
#figure(
  table(
    columns: 10,
    align: center + horizon,
    inset: (x: 9pt, y: 8pt),
    stroke: 0.4pt + gray.lighten(40%),

    // Wavelengths
    table.cell(fill: rgb("#E8EDF3"))[
      *Wavelength $lambda$ [nm]*
    ],
    [$447.1$],
    [$471.3$],
    [$492.1$],
    [$501.5$],
    [$504.7$],
    [$587.5$],
    [$667.8$],
    [$706.5$],
    [$781.3$],

    // k-values
    table.cell(fill: rgb("#E8EDF3"))[
      *k-value [a.u.]*
    ],
    [$556 pm 2$],
    [$524 pm 2$],
    [$500 pm 2$],
    [$486 pm 2$],
    [$483 pm 2$],
    [$376 pm 2$],
    [$274 pm 2$],
    [$226 pm 2$],
    [$135 pm 2$],
  ),

  caption: [
    calibration points for the first fit. This calibrates wavelength of the center pixel position $p_c$, in dependance of k-value.
  ],
)

The measured calibration points for the second fit are in the following table. These are all for the Helium-Line at $587.5 "nm"$
#figure(
  table(
    columns: 8,
    align: center + horizon,
    inset: (x: 9pt, y: 8pt),
    stroke: 0.4pt + gray.lighten(40%),

    // Wavelengths
    table.cell(fill: rgb("#E8EDF3"))[
      *pixel position [px]*
    ],
    [$80 pm 1$],
    [$290 pm 1$],
    [$473 pm 1$],
    [$720 pm 1$],
    [$920 pm 1$],
    [$1180 pm 1$],
    [$1390 pm 1$],

    // k-values
    table.cell(fill: rgb("#E8EDF3"))[
      *k-value [a.u.]*
    ],
    [$353 pm 2$],
    [$362 pm 2$],
    [$369 pm 2$],
    [$376 pm 2$],
    [$387 pm 2$],
    [$396 pm 2$],
    [$404 pm 2$],
  ),

  caption: [
    calibration points for the second fit. This determines the pixel dependance.
  ],
)

= Data Analysis

= Discussion

= Conclusion

#pagebreak()
#set heading(numbering: "A")

#set heading(numbering: "A")

#counter(heading).update(0)
#set heading(numbering: "A.1.i")
= Appendix
== python skript <python>
```python

```
== Uncertainties

=== Gaussian Error Propagation <gauss>

=== Uncertainties from `curve_fit` <curve_fit>

#pagebreak()


#bibliography("sources.bib")
