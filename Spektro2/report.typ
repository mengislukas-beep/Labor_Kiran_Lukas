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
Here a.u. is arbitrary unit. For the known helium-lines we measured the following k-values. For this we measured the k-value when the spectral line was on the center pixel position $p_c = 720$.
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
    first calibration points for the first fit. This calibrates wavelength of the center pixel position $lambda_c$, in dependance of k-value.
  ],
)

We set the error of the k-value $sigma_k$ to $sigma_k = 2$, since $2$ was the smalles difference in unit on the dial indicator. The measured calibration points for the second fit are in the following table. These are all for the Helium-Line at $587.5 "nm"$.
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
    second calibration points for the second fit. This determines the pixel dependance.
  ],
)
Every pixel can be evaluated seperatly, thus we set the error in pixel position $sigma_p$ to $sigma_p = 1$.

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
The data measured from the solar spectrum is in the .tif files. From them, we added all three color channels up, to get the intensity. We took the mean for a fixed x and y from 480 px to 520 px. This gives to following plot:
#figure(
    image("images/raw_data.png", width: 90%),
    caption: [
        colorful lines are edges of the images (same color from one image). Blue dots is the measured data.
    ]
) <raw_data>


= Data Analysis
== Calibration
Goal of calibration is to find paramaters $b$ and $d$ in:
$
  lambda (p, k) = b ((k - k_0) - (p - p_cent) / d)
$ <fit_func>
To get a function to determine the wavelength in dependance of pixel position $p$ and k-value $k$. For the first fit we used a fit function of the form:
$
  lambda_c (k) = b (k - k_0)
$
This is beacause for the first fit all spectral lines were measured at $p = p_c$. To do this we used the scipy curve_fit function @SciPy_curve_fit. We also used the scipy curve_fit covariance matrix to determine its standart deviation @SciPy_curve_fit. We got:
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
  ),

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
From the measured k-values of the spectral lines we got using @fit_func:
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

    // k-values
    table.cell(fill: rgb("#E8EDF3"))[
      *wavelength [nm]*
    ],
    [$437 pm 2$],
    [$490 pm 2$],
    [$546 pm 2$],
    [$576 pm 2$],
    [$579 pm 2$],
    [$812 pm 2$],
    [$820 pm 2$],
    [$875 pm 2$],
  ),

  caption: [
    calculated values of the wavelength of the spectral lines of the unknown source.
  ],
)
 We calculated the error with the scipy jacobian function @SciPy_jacobian. Here we defined the following:
$
  z = (k_0, b, d, p, k)
  \
  sigma_z = (sigma_k_0, sigma_b, sigma_d, sigma_p, sigma_k) = (2, 0.0007 "nm", 0.03 "px", 1 "px", 2)
  \
  sigma_z^2 := (sigma^2_k_0, sigma_b^2, sigma_d^2, sigma_p^2, sigma_k^2)
  \
  f(z) = b ((k - k_0) - (p - p_c) / d)
  \
  sigma_lambda = sqrt((J_f (z) ^2)_(1 times 5) (sigma_z^2)_(5 times 1)^T)
  \
  "where " J "is the jacobian and" J_f ^2 = ((part_z_1 f)^2, (part_z_2 f)^2, (part_z_3 f)^2, (part_z_4 f)^2, (part_z_5 f)^2)
$ <error_prop>

The intensity from the images give the following plot:
#figure(
    image("images/unkwn_no_overlap.png", width: 90%),
    caption: [
        measured data of unknown light source
    ]
)
This matches the spectrum of mercury the best:
#figure(
    image("images/lit_hg.png", width: 90%),
    caption: [
        literature values for spectrum of mercury lamp @lit_hg
    ]
) <literature_plot_hg>


== Solar Spectrum
From the images we can determine the absorbtion lines of the solar spectrum. We did not look at the rise in spectrum after 750 nm, since this is the second order. We found minimas at:
#figure(
  table(
    columns: 13,
    align: center + horizon,
    inset: (x: 9pt, y: 8pt),
    stroke: 0.4pt + gray.lighten(40%),

    // pixel position
    table.cell(fill: rgb("#E8EDF3"))[
      *pixel position [px]*
    ],
    [$599 pm 1$],
    [$548 pm 1$],
    [$567 pm 1$],
    [$607 pm 1$],
    [$900 pm 1$],
    [$13 pm 1$],
    [$861 pm 1$],
    [$880 pm 1$],
    [$1182 pm 1$],
    [$55 pm 1$],
    [$825 pm 1$],
    [$890 pm 1$],

    // k-values
    table.cell(fill: rgb("#E8EDF3"))[
      *k-value [a.u.]*
    ],
    [$500 pm 2$],
    [$460 pm 2$],
    [$460 pm 2$],
    [$460 pm 2$],
    [$460 pm 2$],
    [$420 pm 2$],
    [$380 pm 2$],
    [$380 pm 2$],
    [$340 pm 2$],
    [$300 pm 2$],
    [$300 pm 2$],
    [$300 pm 2$],

    // wavelength
    table.cell(fill: rgb("#E8EDF3"))[
      *wavelength [nm]*
    ],
    [$488 pm 2$],
    [$518 pm 2$],
    [$518 pm 2$],
    [$519 pm 2$],
    [$528 pm 2$],
    [$533 pm 2$],
    [$590 pm 2$],
    [$591 pm 2$],
    [$631 pm 2$],
    [$628 pm 2$],
    [$652 pm 2$],
    [$654 pm 2$],
  ),

  caption: [
    measurment of k-value and pixel position for absorbtion lines. Calculation of corresponding wavelength.
  ],
)

We caluclated the wavelength using @fit_func. We determined the errors using @error_prop. In the following plot we applied a moving average over 9 data points to reduce the noise.

#figure(
    image("images/ana_data.png", width: 90%),
    caption: [
        every second image has $+100$ intensity. This is to better see the overlap areas of the images. The spectrum here only goes from $400 "nm"$ to $680 "nm"$. Data has moving average over 9 data points. This is also the reason four datapoints rise or fall fast at the edges of images
    ]
) <seperated_data>


= Discussion
== Calibration
In the second fit the datapoints have an offset to the linear fit. This is most likly inaccuracy in reading the spectrometer and could lead to errors in the determination of wavelength. Also the initial determined standart deviation of the pixels $sigma_p = 1$ could be too small. This is beacause one spectral line is wider than one pixel. This is most likly beacause we set the slit too far open, which leads to wider spectral lines.
== Unknown Source
The spectral lines measured at $812 "nm", 820 "nm", 875 "nm"$ are outside the spectral range of the spectrometer ($400 "nm"$ to $650 "nm"$ @manuel_skript). Thus they are probably the second order. The calibration is for the first order, thus we disregard the spectral lines beyond $650 "nm"$. The other spectral lines match @literature_plot_hg. We also could match the $437 pm 2 "nm"$ line to literature $438.5 "nm"$ line @mercury_vapor_lamp, the $546 pm 2 "nm"$ line to the literature $546.1 "nm"$ line @mercury_vapor_lamp and the $576 pm 2 "nm"$ aswell as the $579 pm 2 "nm"$ line to the $578 "nm"$ literature line @mercury_vapor_lamp. The smaller peak at $490 pm 2 "nm"$ we could not find in @mercury_vapor_lamp. This is the least intense peak in the spectrum we found. In @literature_plot_hg there is a peak at $490 "nm"$, which could match the spectral line we found at $490 pm 2 "nm"$. The literature line at $404.7 "nm"$ we could not find. This might be beacause this approaches the limit of the spectral range of the spectrometer ($400 "nm"$ @manuel_skript). Also it could be that we started the scan to far into the spectrum and did not pass by $404 "nm"$.

== Solar Spectrum
The absorbtion line at $488 "nm"$ corresponds to the $F$ Fraunhofer absorbtion line @fraunhofer_lines. The $518 "nm", 518 "nm", 519 "nm"$ lines all correspond to the $b_1$ Fraunhofer line. The $528 "nm"$ line corresponds to the $E_2$ line. The measured lines at $590 "nm"$ and $591 "nm"$ correspond to the $D_2$ and $D_1$ Fraunhofer lines. The $654 "nm"$ line corresponds to $H"-"alpha$.

We have found no match for the $533 "nm", 631 "nm", 628 "nm", 652 "nm"$ lines.

We especially missed many of the absorbtion lines outside the $(480 "nm", 660 "nm")$ interval. We only see a rise in the spectrum at $400 "nm"$, since at $400 "nm"$ the spectral range of the spectrometer starts @manuel_skript. The spectral range ends at $650 "nm"$ @manuel_skript. This can also be seen in the plot and can explain the increase and drop off in intenity around these positions. Another error source is the noise. This increases the difficulty of distinguishing noise from a absorbtion line. Also from $580 "nm"$ to $640 "nm"$ the intensity is doubled. This is red light. This could be beacause the experiment took place 1-2h before sunset (2026-11-18, 14:45 - 15:45, Zürich). This might have increased the amount of light in this spectral range. Another source of error is, that we used a flashlight to read the dial position (k-value) from the spectrometer. This might have caused a different background noise and could explain the jumps in intensity at the image borders (can bee seen in @raw_data). In addition the fit can cause inaccuracy. Evidence for this are the $533 "nm", 631 "nm", 628 "nm"$ lines. They are in an overlaping are of the images. So they should appear in both images. However they only appear in one of the images (see @seperated_data). This could be beacause the fit is inaccurate and therefore causes the conversion from $k$ and $p$ to $lambda$ to have a mismatch. We could think that the $528 "nm"$ and the $533 "nm"$ are the same, and the $631 "nm"$ and the $628 "nm"$ are the same, but have different values due to the fit. This only works for one pair tho, since the offset is in the contrairy direction. For one pair the image to the right has the spectral line to the right and for the other pair to the left.

Another source of error could be mistakes in reading the dial position or a typing mistake, whilst copying the reading.

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

=== Uncertainties from `curve_fit` <curve_fit>

The function `curve_fit` from `scipy.optimize` fits a function to measured data and returns the optimal parameters (`popt`) and their covariance matrix (`pcov`).

The uncertainties of the fitted parameters are calculated from the diagonal elements of the covariance matrix:

$
  sigma_(p_i) = sqrt("pcov"_(i i))
$
The parameter `absolute_sigma` determines how the provided measurement uncertainties are interpreted. If `True`, they are treated as absolute uncertainties. 
If 'False', the covariance matrix is scaled based on the residuals of the fit, while still accounting for the relative measurement uncertainties.
In both cases, `curve_fit` automatically estimates the uncertainties of the fitted parameters.

#pagebreak()


#bibliography("sources.bib")
