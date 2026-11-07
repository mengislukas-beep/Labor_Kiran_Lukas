#import "../style.typ": *
#import "@preview/subpar:0.2.2"
#show: setup

#set document(title: "report absolute zero")

#align(center)[
  #text(size: 15pt, weight: "bold")[
    Determination of the Absolute Zero Point
  ]

  #v(0.8em)

  #text(size: 11pt)[
    Lukas Mengis, Kiran Suda \
    06 November 2026
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
For the calibration we measured the laboratory temperature $t_l$. We also measured the reading from the barometer $tilde(p_l)$. Aswell as the output-signal of the pressure sensor when exposed to laboratory pressure $U_l$. Then we measured the output-signal at low pressure $U_2$. This gave:
$
  t_l = (22 plus.minus 1) °C
  \
  tilde(p_l) = (716 plus.minus 1) "mmHg"
  \
  U_l = (128.0 plus.minus 0.2) "mV"
  \
  U_2 = (-5.3 plus.minus 0.2) "mV"
$
Far all temperatures we estimated $sigma_t = 1°C$. Since the smallest scale on the Barometer is $plus.minus 1 "mmHg"$, we got $sigma_p = 1 "mmHg"$. For all output voltages we used $sigma_U = 0.2 "mV"$. The $sigma_U$ comes from the manual where there is the the $0.05% "full scale" = 0.075 "mV"$ percicion error and another error due to temperature difference of $0.08 "mV" / "°C"$. Since we estimated $sigma_t = 1°C$ we got $sigma_U = 0.075 "mV" + 0.08 "mV" approx 0.2 "mV"$.

== Absolute Zero
The measurements to determine the absolute zero temperature are the output signals of the pressure sensor. We use $U_k$ for boiling water and $U_e$ for freezing water. The results are:
$
  U_k = (127.6 plus.minus 0.2) "mV"
  \
  U_e = (92.5 plus.minus 0.2) "mV"
$

== Liquid Nitrogen
The measurment for liquid Nitrogen (ln2) is $U_"ln2"$. This is the output signal from the pressure sensor when submerged in boiling liquid Nitrogen.
$
  U_"ln2" = (24.7 plus.minus 0.2) "mV"
$


= Data Analysis
== Calibration
From the barometer reading $tilde(p_l)$ and laboratory temperature $t_l$ we calculate the pressure in the laboratory $p_l$
$
  p_l = (tilde(p_l) - "correction"(t_l))  * 133.322 / 100 = ((716 plus.minus 1) - 3) * 133.322/100 "mbar" = (951 plus.minus 1) "mbar"
$
We used the value of $U_k$ for $U_l$. so $U_l = (127.6 plus.minus 0.2) "mV"$ (discussion). The value for the low pressure is per assumption (manual):
$
  p_2 = (0.1 plus.minus 0.1) "mbar"
$
From here we fitted a linear function of the form:
$
  p(U) = p_0 + C U
$
through $(p_l, U_l)$ and $(p_2, U_2)$. We calculated:
$
  C = (p_l - p_2) / (U_l - U_2) = (7.16 plus.minus 0.02) "bar" / V
  \
  p_0 = p_l - (p_l - p_2) / (1 - U_2 / U_l) = (0.038 plus.minus 0.001) "bar"
$
For the error propagation we always used a function of the starting parameters to calculate the values. We used the scipy Jacobian function to calculate all the derivatives. So for $C$ it is:
$
  z = (p_l, p_2, U_l, U_2)
  \
  sigma_z = (sigma_p_l, sigma_p_2, sigma_U_l, sigma_U_2) = (0.001 "bar", 0.0001 "bar", 0.2 "mV", 0.2 "mV")
  \
  f_c (z) := (p_l - p_2) / (U_l - U_2)
  \
  sigma_c = sqrt((J_f_C (z)^2)_"1x4" (sigma_z^2)_"4x1"^T) = 0.02 "bar" / V
$
where $sigma_z^2 = (sigma_(z,1)^2, sigma_(z,2)^2, sigma_(z,3)^2, sigma_(z,4)^2$). And $J_f_C (z)^2 = ((part_p_l f_C)^2, (part_p_2 f_C)^2, (part_U_l f_C)^2, (part_U_2 f_C)^2)$. We used the same prcedure for all propagated errors in @python. We always made the function depend only on the measured values and the values assumed and not on previously caluclated values. We did this to minimize the effect of correlation. Since previously calculated values depend on same starting parameters they correlate. To account for correlation the error propagation gets more complicated and one has to estimate the correlation between the values. This is why we always directly calculated from the original values.

The calibration gives the following calibration-curve:
#figure(
  image("images/calibration_curve.png", width: 80%),

  caption: [
    The two calibration points. $(p_l, U_l)$ is purple and $(p_2, U_2)$ is blue. Orange line is $p(U) = p_0 + C U$
  ],
)

== Absolute Zero
From the calibration curve and $U_k$ and $U_e$ we obtain the pressure $p_k$ and $p_e$ at boiling temperature (water) $t_k$ and at freezing temperature $t_e$.
$
  p_k = p(U_k) = (951 plus.minus 2) "mV"
  \
  p_e = p(U_e) = (700 plus.minus 2) "mV"
  \
  t_k = (98 plus.minus 1) °C
  \
  t_e = (0 plus.minus 1) °C
$
We obtained $t_k$ through a table in the laboratory where the boiling temperature of water is denoted in dependance of $p_l$. $t_e = 0$ per assumption. We can now also plot the pressure/temperature dependance:
#figure(
  image("images/temperature_curve.png", width: 80%),

  caption: [
    
  ],
)

From the obtained values we can caluclated the temperature of absolute zero. $t'_0$ is a simpler approximative calculation. $t_0$ is more accurate since it takes some parazitic volume into account.
$
  t'_0 = - p_e / (p_k - p_e) t_k = (-274 plus.minus 3) °C quaddd "manual"
$
we define:
$
  epsilon = 10^(-3), quad gamma = 10^(-5) "/°C"
  \
  a = (1 + epsilon) p_e - (1 + epsilon + gamma t_k) p_k
  \
  b = epsilon (p_k - p_e) t_k + (1 + gamma t_k) p_k t_l - p_e (t_l + t_k)
  \
  c = p_e t_l t_k quaddd "manual"
$
this gives:
$
  t_0 = (-b + sqrt(b^2 - 4 a c)) / (2 a) = (-273 plus.minus 5) °C quaddd "manual"
$

== Liquid Nitrogen
From the calibration curve and the measurment $U_"ln2"$ we obtain the value for the pressure $p_"ln2"$ at temperature of liquid nitrogen ($t_"ln2"$)
$
  p_"ln2" = (214 plus.minus 1) "mBar"
$
Again there is a simpler approximation for the temperature of liquid Nitrogen ($t'_"ln2"$). Aswell as a more complicated and more accurate value $t_"ln2"$. We have:
$
  t'_"ln2" = (1 - p_"ln2" / p_e) t_0 = (-189 plus.minus 4) °C
$
we define:
$
  epsilon = 10^(-3), quad gamma = 10^(-5) "/°C"
  \
  A = p_e / (t_e - t_0) + epsilon (p_e - p_"ln2") / (t_l - t_0)
$
this gives:
$
  t_"ln2" = (A t_0 + p_"ln2") / (A - gamma p_"ln2") = (-189 plus.minus 4) °C
$

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
