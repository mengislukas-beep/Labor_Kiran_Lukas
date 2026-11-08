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
The absolute zero point is a fundamental fixed point. It has the lowest possible temperature $t_0$. There is no lower temperature.

The Temperature is also contained in the ideal-gas-law. Here $n$ is the number of particles, $k_B$ is the Boltzmann constant, $T$ is Temperature, $p$ is pressure, and $V$ is the Volume.
$
  n k_B T = p V
$ <ideal_gas_law>

= Experiment
#figure(
  image("images/experiment_configuration.png", width: 80%),

  caption: [
    Shows the experimental setup. @manual
  ],
) <exp_setup>

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
Far all temperatures we estimated $sigma_t = 1°C$. Since the smallest scale on the Barometer is $plus.minus 1 "mmHg"$, we got $sigma_p = 1 "mmHg"$. For all output voltages we used $sigma_U = 0.2 "mV"$. The $sigma_U$ comes from the manual @manual where there is the $0.05% "full scale" = 0.075 "mV"$ percicion error and another error due to temperature difference of $0.08 "mV" / "°C"$. Since we estimated $sigma_t = 1°C$ we got $sigma_U = 0.075 "mV" + 0.08 "mV" approx 0.2 "mV"$.

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
We used the value of $U_k$ for $U_l$. So $U_l = (127.6 plus.minus 0.2) "mV"$ for all calculations (see @disc). The value for the low pressure is per assumption @manual:
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
For the error propagations we always used a function of the starting parameters to calculate the values. We used the scipy Jacobian @SciPy_jacobian function to calculate all the derivatives. So for $C$ it is:
$
  z_C = (p_l, p_2, U_l, U_2)
  \
  sigma_z_C = (sigma_p_l, sigma_p_2, sigma_U_l, sigma_U_2) = (0.001 "bar", 0.0001 "bar", 0.2 "mV", 0.2 "mV")
  \
  f_C (z_C) := (p_l - p_2) / (U_l - U_2)
  \
  sigma_C = sqrt((J_f_C (z_C)^2)_(1 times 4) (sigma^2_z_C)_(4 times 1)^T) = 0.02 "bar" / V
$ <example_error_prop>
Where $J_f_C (z_C)^2 = ((part_p_l f_C (z_C))^2, (part_p_2 f_C (z_C))^2, (part_U_l f_C (z_C))^2, (part_U_2 f_C (z_C))^2)$ and $sigma^2_z_C = (sigma^2_p_l, sigma^2_p_2, sigma^2_U_l, sigma^2_U_2)$. We used the same prcedure for all propagated errors. The exact calculations can be found in the python program at @python. We used AI-tools to help debug the python program. We always made the function depend only on the measured values and the values assumed and not on previously caluclated values. We did this to minimize the effect of correlation. Since previously calculated values can depend on the same starting parameters they correlate. To account for correlation the error propagation gets more complicated and one has to estimate the correlation between the values. This is why we always directly calculated from the original values, so we can assume that they are uncorrelated.

So for $sigma_p_0$ we have $sigma_p_0 = sqrt((J_f_p_0 (z_p_0)^2)_(1 times 4) (sigma^2_z_p_0)^T_(4 times 1))$ with $z_p_0 = z_p_C => sigma_z_p_0 = sigma_z_C$ and $f_p_0 (z_p_0) = p_l - (p_l - p_2) / (1 - U_2 / U_l)$

The calibration gives the following calibration-curve:
#figure(
  image("images/calibration_curve.png", width: 80%),

  caption: [
    The two calibration points. $(p_l, U_l)$ is purple and $(p_2, U_2)$ is blue. Orange line is $p(U) = p_0 + C U$.
    \
    Note: The red lines are not the error bars. They are the caps of the error bars. The error bars are smaller than the points and thus barely visible.
  ],
)

== Absolute Zero
From the calibration curve and $U_k$ and $U_e$ we obtain the pressure $p_k$ and $p_e$ at boiling temperature (water) $t_k$ and at freezing temperature $t_e$.
$
  p_k = p(U_k) = (951 plus.minus 2) "mbar"
  \
  p_e = p(U_e) = (700 plus.minus 2) "mbar"
  \
  t_k = (98 plus.minus 1) °C
  \
  t_e = (0 plus.minus 1) °C
$
We obtained $t_k$ through a table in the laboratory where the boiling temperature of water is denoted in dependance of $p_l$. For the freezing temperature $t_e$ we have $t_e = 0$ per assumption. We can now also plot the pressure/temperature dependance:
#figure(
  image("images/temperature_curve.png", width: 80%),

  caption: [
    The pruple point is the measured point of $(t_k, p_k)$. The blue point is the measured point of $(t_e, p_e)$. The orange line is a linear fit. From extrapolating the orange curve, one gets $t'_0$.
    \
    Note: The red lines are not the error bars. They are the caps of the error bars. The error bars are smaller than the points and thus barely visible.
  ],
)

From the obtained values we can caluclated the temperature of absolute zero. $t'_0$ is a simpler approximative calculation. $t_0$ is more accurate since it takes the parasitic volume $V_S$ into account (see @exp_setup).
$
  quaddd t'_0 = - p_e / (p_k - p_e) t_k = (-274 plus.minus 3) °C quaddd #cite(<manual>)
$
we define:
$
  epsilon = 10^(-3)
  \
  gamma = 10^(-5) "/°C"
  \
  a = (1 + epsilon) p_e - (1 + epsilon + gamma t_k) p_k
  \
  b = epsilon (p_k - p_e) t_k + (1 + gamma t_k) p_k t_l - p_e (t_l + t_k)
  \
  quaddd c = p_e t_l t_k quaddd #cite(<manual>)
$
this gives:
$
  quaddd t_0 = (-b + sqrt(b^2 - 4 a c)) / (2 a) = (-273 plus.minus 5) °C quaddd #cite(<manual>)
$

== Liquid Nitrogen
From the calibration curve and the measurment $U_"ln2"$ we obtain the value for the pressure $p_"ln2"$ at temperature of liquid nitrogen ($t_"ln2"$)
$
  p_"ln2" = (214 plus.minus 1) "mBar"
$
Again there is a simpler approximation for the temperature of liquid Nitrogen ($t'_"ln2"$). Aswell as a more complicated and more accurate value $t_"ln2"$. We have:
$
  quaddd t'_"ln2" = (1 - p_"ln2" / p_e) t_0 = (-189 plus.minus 4) °C quaddd #cite(<manual>)
$
we define:
$
  epsilon = 10^(-3)
  \
  gamma = 10^(-5) "/°C"
  \
  quaddd A = p_e / (t_e - t_0) + epsilon (p_e - p_"ln2") / (t_l - t_0) quaddd #cite(<manual>)
$
this gives:
$
  quaddd t_"ln2" = (A t_0 + p_"ln2") / (A - gamma p_"ln2") = (-189 plus.minus 4) °C quaddd #cite(<manual>)
$

= Discussion <disc>
Whilst measuring the value for $U_l$ we did not disconnect the pressurized hose from the system. We instead opened the valves to expose the sensor to the remaining pressure in the hose system. This pressure is not the same as the ambiant laboratory pressure. Whilst heating up the helium in the steam bath, the hose was fully disconnected and the valve at position 6 (see in @exp_setup) was open. This means that the sensor was exposed to laboratory pressure. We also noticed that the reading of the sensor was stable in this configuration. We therefore concluded that the measurment of $U_k$ better represents the laboratory pressure $U_l$. We therefore replaced the measured value of $U_l = (128.0 plus.minus 0.2) "mV"$ with $U_k = (127.6 plus.minus 0.2) "mV"$. So in all calculations: $U_l = U_k = (127.6 plus.minus 0.2) "mV"$.

The literature value of the absolute zero temperature ($-273.15 °C$) lies within the experimental result range of $t_0 = (-273 plus.minus 5) °C$.

The literature value of the temperature of liquid Nitrogen is: $-195.8°C$. This value lies outside the experimentally determined range of $t_"ln2" = (-189 plus.minus 4) °C$. So there is likely a systematic error. One possible source of error is leakage of gas. There could be small amounts of gas entering the lower pressure system, which would increase the  measured pressure. This would lead to a higher experimentally determined boiling temperature, like in our case. The measurment of the liquid Nitrogen was taken last, so in this case it would not be contradictury to an accurate measurment of absolute zero temperature $t_0$. Another source could be that the temperature of the helium never fully reached the temperature of liquid Nitrogen. In this case it would be warmer, since we never cooled it more down, than with liquid Nitrogen. This again would lead to a too high experimental value of $t_"ln2"$. Also we noticed a drop in output voltage of the pressure sensor, after submerging the glas bulb (@exp_setup) in liquid Nitrogen (this is the expected behaviour). After the voltage dropped, it immediatly began to rise again. So the output voltage never stabilized, which made an accurate measurment difficult. We thus think, that an inaccurate measurment is the most likely cause of error.

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
