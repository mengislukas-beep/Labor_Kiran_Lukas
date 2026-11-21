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
The k-value of the 0th-order ($k_0$) has:
$
  k_0 = (1126 pm 2) "a.u."
$
Here a.u. is arbitrary unit. For the known helium-lines we measured the following k-values. For this we measured the k-value when the spectral line was on the center pixel position $p_c$.
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

    // pixel position
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

== Unknown Source
To determine the unknown source, we measured its spectral lines. The measurment has given:
#figure(
  table(
    columns: 9,
    align: center + horizon,
    inset: (x: 9pt, y: 8pt),
    stroke: 0.4pt + gray.lighten(40%),

    // k-values
    table.cell(fill: rgb("#E8EDF3"))[
      *k-value [a.u.]*
    ],
    [$570 pm 2$],
    [$502 pm 2$],
    [$430 pm 2$],
    [$392 pm 2$],
    [$389 pm 2$],
    [$92 pm 2$],
    [$81 pm 2$],
    [$12 pm 2$],
  ),

  caption: [
    measurment of the k-values of the spectral lines of the unknown source.
  ],
)

== Solar Spectrum
The raw measurment of the solar spectrum has given the following data:
#figure(
    image("images/raw_data.png", width: 90%),
    caption: [
        colorful lines are edges of the images (same color from one image). Blue dots is the measured data.
    ]
)


= Data Analysis
== Calibration
Goal of calibration is to find paramaters $b$ and $d$ in:
$
  lambda (p, k) = b ((k - k_0) - (p - p_cent) / d)
$ <fit_func>
To get a function to determine the wavelength in dependance of pixel position $p$ and k-value $k$. For the first fit we used a fit function of the form
$
  lambda_c (k) = b (k - k_0)
$
To do this we used the scipy curve_fit function @SciPy_curve_fit. We also used the scipy curve_fit covariance matrix to determine its standart deviation @SciPy_curve_fit. We got:
$
  b = (-0.7851 pm 0.0007) "nm"
$
Then we used the function @fit_func. To determine $d$ with the second calibration data set. This gives:
$
  d = (25.78 pm 0.03) "px"
$
We again used curve_fit @SciPy_curve_fit. The two calibration curves look the following:

#subpar.grid(
  figure(
    image(
      "images/cali1.png",
      width: 100%,
      height: 6cm,
      fit: "contain",
    ),
    caption: [
      wavelength at center pixel $lambda_c$ in dependance of k-value
    ],
  ), <fig:pixel>,

  figure(
    image(
      "images/cali2.png",
      width: 100%,
      height: 6cm,
      fit: "contain",
    ),
    caption: 
    [
      k-value and pixel position dependance.
    ],
  ),

  columns: (1fr, 1fr),
  gutter: 15pt,
  align: top,
  caption: [
    calibration curves
  ],
)

== Unknown Source

== Solar Spectrum

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
