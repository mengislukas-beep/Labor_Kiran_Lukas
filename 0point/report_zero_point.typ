#import "../style.typ": *
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
  #text[
    The goal of this experiment was to estimate the absolute zero temperature.
    Since pressure and volume cannot be negative, the ideal gas law
    $p V = N k_B T$ implies the existence of an absolute zero temperature.

    To estimate this temperature, we measured the pressure of helium at
    different known temperatures. By extrapolating the measured
    pressure-temperature relationship, we obtained an absolute zero
    temperature of $(-273 plus.minus 5) degree C$.
    This agrees with the literature value of $-273.15 degree C$
    @absoluter_nullpunkt.

    Using the previously determined pressure-temperature relationship,
    we were then able to estimate the temperature of liquid nitrogen
    ($N_2$).
  ]
]

= Introduction
The absolute zero point is a fundemental fixed point which has the lowest possible temperature $t_0$. This temperature $t_0$ is achived when all the particles of the system have 0 velocity. The Kelvin temperature scale is named after the physicist Lord Kelvin (William Thomson), who proposed an absolute temperature scale in 1848. The scale starts at absolute zero (0 K), the lowest possible thermodynamic temperature. Temperatures on the Kelvin scale are therefore non-negative

The Temperature is also contained in the ideal-gas-law. Here $N$ is the number of particles, $k_B$ is the Boltzmann constant, $T$ is Temperature, $p$ is pressure, and $V$ is the Volume.
$
  p V = N k_B T
$ <ideal_gas_law>
Helium (He) behaves relatively close to the ideal gas law, therefore this @ideal_gas_law can be used as a good approximation. So our calculations are mainly based on this relation.

= Experiment
The experiment (see @exp_setup) allows us to measure different voltages, which are linearly related to the pressure in the glas bulb. In @cali we see more precisely how to calculate the pressure given the voltage. This setup is connected to a pump which allows us by opening valve 2 to create a pressure close to a vacuum. Through valve 3 and 7 we were able to fill the glas bulb up with Helium. \

#figure(
  image("images/experiment_configuration.png", width: 80%),

  caption: [
    A shematic representation of the experimental set-up used in the experiment. @manual
  ],
) <exp_setup>
Firstly we wanted to calibrate the pressure sensor at position 6 in @exp_setup, which produces an output voltage. For this we measured the output voltage in two situations in which we know the pressure. We looked at the output voltage at room pressure and as a second measurement the output voltage at pressure near vacuum. With these values we made a linear fit which allows us to calculate the pressure inside of the glas bulb from the output voltage. \
\
After calibrating the pressure sensor we completely filled up the glas bulb with helium. We wanted to measure the pressure at different temperature. Therefore we were using water steam to heat the glas bulb up. Since the water evaporates at approximately $100^°$ Celsius, the temperature of the helium was then close to $100^°$ Celsius. This was our first pressure measurement. Also before measuring we closed the system at Position 6 (see @exp_setup), such that the number of particles is constant for the following measurments. Also the Volume is constant.
As a second step we cooled the helium down to $0^°$ Celsius using ice-water. At this state we made our second pressure measurement.  With these two we can now approximate the 'absolute zero temperature'. More in @results and @analysis.\

With this setup, we can also perform the reverse experiment. Instead of measuring the pressure at a known temperature to determine absolute zero, we can measure the pressure at an unknown temperature and use the previously calculated value of absolute zero to determine the temperature of the liquid.

In the second part of the experiment, we did this. We submerged the helium bulb in liquid nitrogen ($N_2$) and measured the corresponding voltage. Using this measurement and our previously determined value of absolute zero, we were able to estimate the temperature of the liquid nitrogen.


= Results<results>
== Calibration
For the calibration we measured the laboratory temperature $t_l$. We also measured the reading from the barometer $tilde(p_l)$, which is in "mmHg". Aswell as the output-signal of the pressure sensor when exposed to laboratory pressure $U_l$. Then we measured the output-signal at low pressure $U_2$. As a result:
$
  t_l = (22 plus.minus 1) °C
  \
  tilde(p_l) = (716 plus.minus 1) "mmHg"
  \
  U_l = (128.0 plus.minus 0.2) "mV"
  \
  U_2 = (-5.3 plus.minus 0.2) "mV"
$
For all temperatures we estimated $sigma_t = 1°C$. Since the smallest scale on the Barometer is $plus.minus 1 "mmHg"$, we got $sigma_p = 1 "mmHg"$. For all output voltages we used $sigma_U = 0.2 "mV"$. The $sigma_U$ comes from the manual @manual where there is the $0.05% "full scale" = 0.075 "mV"$ percicion error and another error due to temperature difference of $0.08 "mV" / "°C"$. Since we estimated $sigma_t = 1°C$ we got $sigma_U = 0.075 "mV" + 0.08 "mV" approx 0.2 "mV"$.

== Absolute Zero
The measurements to determine the absolute zero temperature are the output signals of the pressure sensor. $U_k$ is the voltage fat boiling water and $U_e$ for freezing water. The results are:
$
  U_k = (127.6 plus.minus 0.2) "mV"
  \
  U_e = (92.5 plus.minus 0.2) "mV"
$

== Liquid Nitrogen
The measurment for liquid nitrogen (ln2) is $ U_(l N_2)$. This is the output signal from the pressure sensor when submerged in boiling liquid nitrogen.
$
   U_(l N_2) = (24.7 plus.minus 0.2) "mV"
$


= Data Analysis<analysis>
== Calibration<cali>
From the barometer reading $tilde(p_l)$ and laboratory temperature $t_l$ we calculate the pressure in the laboratory $p_l$
$
  p_l = (tilde(p_l) - "correction"(t_l))  dot 133.322 / 100 = ((716 plus.minus 1) - 3) dot 133.322/100 "mbar" = (951 plus.minus 1) "mbar"
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
For the error propagations we always used a function of the starting parameters to calculate the values. We used the scipy Jacobian @SciPy_jacobian function to calculate all the derivatives. \
As an example this means for $C$:
$
  z_C = (p_l, p_2, U_l, U_2)
  \
  sigma_z_C = (sigma_p_l, sigma_p_2, sigma_U_l, sigma_U_2) = (0.001 "bar", 0.0001 "bar", 0.2 "mV", 0.2 "mV")
  \
  f_C (z_C) := (p_l - p_2) / (U_l - U_2)
  \
  sigma_C = sqrt((J_f_C (z_C)^2)_(1 times 4) (sigma^2_z_C)_(4 times 1)^T) = 0.02 "bar" / V
$ <example_error_prop>
Where 
$
  J_f_C (z_C)^2 = ((part_p_l f_C (z_C))^2, (part_p_2 f_C (z_C))^2, (part_U_l f_C (z_C))^2, (part_U_2 f_C (z_C))^2)
  \
  sigma^2_z_C = (sigma^2_p_l, sigma^2_p_2, sigma^2_U_l, sigma^2_U_2)
$ 
We used the same procedure for all propagated errors. The exact calculations can be found in the python program at @python. We used AI-tools to help debug the python program. We always made the function depend only on the measured values and the values assumed and not on previously caluclated values. We did this to minimize the effect of correlation. Since previously calculated values can depend on the same starting parameters they correlate. To account for correlation the error propagation gets more complicated and one has to estimate the correlation between the values. This is why we always directly calculated from the original values, so we can assume that they are uncorrelated.

So for $p_0$ it is the same procedere (shown in @error_p_0).

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
Using water we heatet the helium bulb using water evaporation up to $t_k$ and measure the output voltage $U_k$. And the submerged it into freezing water to cool it down to $t_e$ and measure the output voltage $U_e$. 
From the calibration curve and $U_k$ and $U_e$ we obtain the pressure $p_k$ and $p_e$ at boiling temperature $t_k$ and at freezing temperature $t_e$.
$
  p_k = p(U_k) = (951 plus.minus 2) "mbar"
  \
  p_e = p(U_e) = (700 plus.minus 2) "mbar"
  \
  t_k = (98 plus.minus 1) °C
  \
  t_e = (0 plus.minus 1) °C
$
We obtained $t_k$ through a table in the laboratory where the boiling temperature of water is denoted in dependance of $p_l$. For the freezing temperature $t_e$ we have $t_e = 0$ per assumption @manual. The error calculation can be found in @all_of_the_errors_AAAAAAAAAA We can now also plot the pressure/temperature dependance:
#figure(
  image("images/temperature_curve.png", width: 80%),

  caption: [
    The graph is a lineat fit calculated from the two measured points.
    The pruple point is the measured point of $(t_k, p_k)$. The blue point is the measured point of $(t_e, p_e)$. The orange line is a linear fit. From extrapolating the orange curve, one gets $t'_0$. The green dashed line at $t = -273.15°C$ represents the literature value of absolute zero temperature. It does not represent the experimental value of $t'_0$.
    \
    Note: The red lines are not the error bars. They are the caps of the error bars. The error bars are smaller than the points and thus barely visible.
  ],
)

From the obtained values we can caluclated the temperature of absolute zero. $t'_0$ is a simpler approximative calculation. $t_0$ is more accurate since it takes the parasitic volume $V_S$ into account (see @exp_setup).
$
  quaddd t'_0 = - p_e / (p_k - p_e) t_k = (-274 plus.minus 3) °C quaddd #cite(<manual>)
$
The error calculation can be found in @all_of_the_errors_AAAAAAAAAA. We now define:
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
The error calulcation can be found in @all_of_the_errors_AAAAAAAAAA.

== Liquid Nitrogen
From the calibration curve and the measurment $ U_(l N_2)$ we obtain the value for the pressure $p_(l N_2)$. $U_(l N_2)$ is the output voltage, when the bulb is submerged in boiling liquid nitrogen. So $p_(l N_2)$ is the corresponding pressure at temperature of boiling liquid nitrogen ($t_(l N_2)$).
$
  p_(l N_2) = p (U_(l N_2)) = (214 plus.minus 1) "mBar"
$
The error calculation is in @all_of_the_errors_AAAAAAAAAA. Again there is a simpler approximation for the temperature of liquid nitrogen ($t'_(l N_2)$). Aswell as a more complicated and more accurate value $t_(l N_2)$. We have:
$
  quaddd t'_(l N_2) = (1 - p_(l N_2) / p_e) t_0 = (-189 plus.minus 4) °C quaddd #cite(<manual>)
$
The error calculation is in @all_of_the_errors_AAAAAAAAAA. We now define:
$
  epsilon = 10^(-3)
  \
  gamma = 10^(-5) "/°C"
  \
  quaddd A = p_e / (t_e - t_0) + epsilon (p_e - p_(l N_2)) / (t_l - t_0) quaddd #cite(<manual>)
$
this gives:
$
  quaddd t_(l N_2) = (A t_0 + p_(l N_2)) / (A - gamma p_(l N_2)) = (-189 plus.minus 4) °C quaddd #cite(<manual>)
$
The error calculation is in @all_of_the_errors_AAAAAAAAAA.

= Discussion <disc>
Whilst measuring the value for $U_l$ we did not disconnect the pressurized hose from the system. We instead opened the valves to expose the sensor to the remaining pressure in the hose system. This pressure is not the same as the ambiant laboratory pressure. Whilst heating up the helium in the steam bath, the hose was fully disconnected and the valve at position 6 (see in @exp_setup) was open. This means that the sensor was exposed to laboratory pressure. We also noticed that the reading of the sensor was stable in this configuration. We therefore concluded that the measurment of $U_k$ better represents the laboratory pressure $U_l$. We therefore replaced the measured value of $U_l = (128.0 plus.minus 0.2) "mV"$ with $U_k = (127.6 plus.minus 0.2) "mV"$. So in all calculations: $U_l = U_k = (127.6 plus.minus 0.2) "mV"$.

The literature value of the absolute zero temperature ($-273.15 °C$) lies within the experimental result range of $t_0 = (-273 plus.minus 5) °C$. The standart deviation of $sigma_t_0 = 5 °C$ could be reduced by having more percice starting parameters. So i.e. smaller $sigma_t_l = sigma_t_k = sigma_t_e = 1 °C$ would result in a more accurate result. Also the other parameters could be more accurate, however this is harder to achieve.

The literature value of the temperature of boiling liquid nitrogen is: $-195.8°C$. This value lies outside the experimentally determined range of $t_(l N_2) = (-189 plus.minus 4) °C$. So there is likely a systematic error. One possible source of error is leakage of gas. There could be small amounts of gas entering the lower pressure system, which would increase the  measured pressure. This would lead to a higher experimentally determined boiling temperature, like in our case. The measurment of the liquid nitrogen was taken last, so in this case it would not be contradictury to an accurate measurment of absolute zero temperature $t_0$. Another reason could be that the temperature of the helium never fully reached the temperature of liquid nitrogen. Since the helium bulb was not entirely submerged into liquid nitrogen. This could lead to a warmer temperature of the helium bulb than than liquid nitrogen. This again would lead to a too a higher experimental value of $t_(l N_2)$. We also noticed a drop in the output voltage of the pressure sensor, after submerging the glas bulb (@exp_setup) in the liquid nitrogen (this is the expected behaviour). After the voltage dropped, it immediatly began to rise again. So the output voltage never stabilized, which made an accurate measurment difficult. We thus think, that an inaccurate measurment is the most likely cause of error.

= Conclusion

In this experiment, we first calibrated the pressure sensor and then performed measurements at different temperatures. Using these measurements, we were able to estimate the temperature of absolute zero. The value we obtained agrees with the literature value within the margin of error. However, the uncertainty is relatively high due to several effects, such as changes in the volume of the helium.

In the second part of the experiment, we used our estimate of absolute zero to determine the temperature of liquid nitrogen. Although we obtained an estimate, the deviation from the expected value was not covered by the standard deviation of our measurements. This could have several causes, as discussed in @disc.

We concluded that, in experiments involving multiple steps with accumulating uncertainties, a single measurement is not sufficient to obtain a representative result. To obtain a reliable result, the experiment should be repeated several times to improve the accuracy of the measurements.

Nevertheless, we consider this experiment a good introduction to experimental work involving heat and temperature.





#pagebreak()

#set heading(numbering: "A")
#counter(heading).update(0)
#set heading(numbering: "A.1.i")

= Appendix
== python skript <python>
```python
# %%
import numpy as np
import matplotlib.pyplot as plt
from scipy.differentiate import jacobian

# %%
##### calibration
std_fs = 0.15 * 0.05 / 100 # full scale error from manual
std_u_temp = 0.08 / 1000 # another error from manual
std_U = std_fs + std_u_temp # error of U general

# lab pressure calibration point
mmPerHg = 713 #+-1 (mm Hg) with correction for pressure
U_lab = 0.12755 # 0.12795 measured value in lab (but probalby a bit off) # measurement
p_lab = mmPerHg * 133.322 / 100000 # measurement  2.72 mm / Hg  716 reading at 21.5°
std_p_lab = 1 * 133.322 / 100000 # estimation

# low-pressure (# evacuate pump (7-10min))
U_2 = (-1) * 0.00526 # measurement
p_2 = 0.0001 # +- 0.0001 bar (manual)
std_p_2 = 0.0001

print(std_U * 1000)
print('p_lab =', p_lab, '+-', std_p_lab)

# %%
def f_c (data):
    pl = data[0]
    p2 = data[1]
    ul = data[2]
    u2 = data[3]
    return (pl - p2) / (ul - u2)

def f_p0 (data):
    pl = data[0]
    p2 = data[1]
    ul = data[2]
    u2 = data[3]
    return pl - (pl - p2) / (1 - u2 / ul)

def f_pr (data):
    pl = data[0]
    p2 = data[1]
    ul = data[2]
    u2 = data[3]

    u = data[4]

    c = f_c(data[:-1])
    p0 = f_p0(data[:-1])
    return p0 + u * c

# %%
point_c = np.array([p_lab, p_2, U_lab, U_2])
sigma_c = np.array([std_p_lab, std_p_2, std_U, std_U])
point_p0 = point_c
sigma_p0 = sigma_c
C = f_c(point_c)
p_0 = f_p0(point_p0)

#error prop
jac_c = jacobian(f_c, point_c).df
std_c = np.sqrt(jac_c**2 @ sigma_c.transpose()**2)
jac_p0 = jacobian(f_p0, point_p0).df
std_p0 = np.sqrt(jac_p0**2 @ sigma_p0.transpose()**2)

#print
print('C =', C, '+-', std_c)
print('p_0 =', p_0, '+-', std_p0)

#plot
linspace = np.linspace(U_2 - 0.02, U_lab + 0.02, 20)
points = np.zeros((len(linspace), 5))
points[:,: 4] = point_c
points[:, 4] = linspace
plt.title('calibration curve of pressure sensor')
plt.errorbar(U_lab * 1000, p_lab, std_p_lab, 1000 * std_U, capsize=10, color='r')
plt.errorbar(U_2 * 1000, p_2, std_p_2, 1000 * std_U, capsize=10, color='r')
plt.plot(linspace * 1000, f_pr(points.transpose()), color='orange', label='linear fit: p(U) = p0 + CU')
plt.plot(U_lab * 1000, p_lab, marker='o', linestyle='', color='purple', label='ambiant pressure = 0.95 bar')
plt.plot(U_2 * 1000, p_2, marker='o', linestyle='', color='b', label='low pressure = 0.1 mbar')
plt.xlabel('sensor signal [mV]')
plt.ylabel('pressure [bar]')
plt.legend()

# %%
##### absolute zero
# evacuate pump (7-10min (maybe already done))
# fill with helium for at least two minutes
# repeat procedure once

# %%
# boiling water (close opening after heating)
U_k = 0.12755 # measurment
t_k = 98.242 # table relation with pressure #+-1
std_t_k = 1 # estimation
point_k = np.array([p_lab, p_2, U_lab, U_2, U_k])
sigma_k = np.array([std_p_lab, std_p_2, std_U, std_U, std_U])

# calculation
p_k = f_pr(point_k)

# error prop
jac_pk = jacobian(f_pr, point_k).df
std_p_k = np.sqrt(jac_pk**2 @ sigma_k.transpose()**2)

print('p_k =', p_k, '+-', std_p_k)

# %%
# ice water
# make cold ice water wait ca 2min
U_e = 0.0925 # measurment
t_e = 0 # temperature ice-water
std_t_e = 1 # estimation
point_e = np.array([p_lab, p_2, U_lab, U_2, U_e])
sigma_e = np.array([std_p_lab, std_p_2, std_U, std_U, std_U])

# calculation
p_e = f_pr(point_e)

# error prop
jac_pe = jacobian(f_pr, point_e).df
std_p_e = np.sqrt(jac_pe**2 @ sigma_e.transpose()**2)

print('p_e =', p_e, '+-', std_p_e)

temp_samples = np.linspace(-300, 130, 100)
plt.title('pressure / temperature curve for constant volume and number of particles')
plt.errorbar(t_k, p_k, std_p_k, std_t_k, capsize=10, color='r')
plt.errorbar(t_e, p_e, std_p_e, std_t_e, capsize=10, color='r')
plt.plot(temp_samples, temp_samples * (p_k - p_e) / (t_k - t_e) + p_e - (p_k - p_e) / (t_k - t_e) * t_e, color='orange', label='linear fit')
plt.plot(t_k, p_k, marker='o', color='purple', label='boil t = 98°C')
plt.plot(t_e, p_e, marker='o', color='b', label='ice = 0°C')
plt.axhline(0, linestyle='dotted', color="#95B416", label='p = 0 bar')
plt.axvline(-273.15, linestyle='--', color='#95B416', label='t = -273.15°C')
plt.ylabel('pressure [bar]')
plt.xlabel('temperature [°C]')
plt.legend()

# %%
def f_t0approx (data):
    pl = data[0]
    p2 = data[1]
    ul = data[2]
    u2 = data[3]

    uk = data[4]
    ue = data[5]
    pk = f_pr(data[:5])
    pe = f_pr(data[[0, 1, 2, 3, 5]])

    tk = data[6]

    return (-1) * pe * tk / (pk - pe)

# %%
##### calculations:
point_t0approx = np.array([p_lab, p_2, U_lab, U_2, U_k, U_e, t_k])
sigma_t0approx = np.array([std_p_lab, std_p_2, std_U, std_U, std_U, std_U, std_t_k])

# calculation
t_0_approx = f_t0approx(point_t0approx)

# error prop
jac_t0approx = jacobian(f_t0approx, point_t0approx).df
std_t_0_approx = np.sqrt(jac_t0approx**2 @ sigma_t0approx.transpose()**2)



print('t_0_approx =', t_0_approx, '+-', std_t_0_approx)

# %%
epsilon = 10**(-3)
gamma = 10**(-5)

def f_t0(data):
    pl = data[0]
    p2 = data[1]
    ul = data[2]
    u2 = data[3]

    uk = data[4]
    ue = data[5]
    pk = f_pr(data[:5])
    pe = f_pr(data[[0, 1, 2, 3, 5]])

    tk = data[6]
    te = data[7]
    tl = data[8]

    aa = (1 + epsilon) * pe - (1 + epsilon + gamma * tk) * pk
    bb = epsilon * (pk - pe) * (te + tk) + (1 + gamma * tk) * pk * (te + tl) - pe * (tl + tk)
    cc = pe * tl * tk + epsilon * (pe - pk) * te * tk - (1 + gamma * tk) * pk * te * tl

    return ((-1) * bb + np.sqrt(bb**2 - 4 * aa * cc)) / (2 * aa)


# %%
t_lab = 21.5 # measurment +-1
std_t_lab = 1 # estimation
point_t0 = np.array([p_lab, p_2, U_lab, U_2, U_k, U_e, t_k, t_e, t_lab])
simga_t0 = np.array([std_p_lab, std_p_2, std_U, std_U, std_U, std_U, std_t_k, std_t_e, std_t_lab])

# calculation
t_0 = f_t0(point_t0)

# error prop
jac_t0 = jacobian(f_t0, point_t0).df
std_t_0 = np.sqrt(jac_t0**2 @ simga_t0.transpose()**2)

print('t_0 =', t_0, '+-', std_t_0)

# %%
##### liquid nitrogen
U_LN2 = 0.02465 # measurement
point_ln2 = np.array([p_lab, p_2, U_lab, U_2, U_LN2])
sigma_ln2 = np.array([std_p_lab, std_p_2, std_U, std_U, std_U])

# calculation
p_LN2 = f_pr(point_ln2)

# error prop
jac_pln2 = jacobian(f_pr, point_ln2).df
std_p_LN2 = np.sqrt(jac_pln2**2 @ sigma_ln2.transpose()**2)

print('p_LN2 =', p_LN2, '+-', std_p_LN2)

# %%
def f_tln2approx (data):
    pl = data[0]
    p2 = data[1]
    ul = data[2]
    u2 = data[3]

    uk = data[4]
    ue = data[5]
    pe = f_pr(data[[0, 1, 2, 3, 5]])

    tk = data[6]
    te = data[7]
    tl = data[8]

    t0 = f_t0(data[0:9])

    uln2 = data[9]
    pln2 = f_pr(data[[0, 1, 2, 3, 9]])

    return (1 - pln2 / pe) * t0


# %%
point_tln2approx = np.array([p_lab, p_2, U_lab, U_2, U_k, U_e, t_k, t_e, t_lab, U_LN2])
sigma_tln2approx = np.array([std_p_lab, std_p_2, std_U, std_U, std_U, std_U, std_t_k, std_t_e, std_t_lab, std_U])

# calculation
t_LN2_approx = f_tln2approx(point_tln2approx)

# error prop
jac_tln2approx = jacobian(f_tln2approx, point_tln2approx).df
std_t_LN2_approx = np.sqrt(jac_tln2approx**2 @ sigma_tln2approx.transpose()**2)

print('t_LN2_approx =', t_LN2_approx, '+-', std_t_LN2_approx)

# %%
def f_tln2 (data):
    pl = data[0]
    p2 = data[1]
    ul = data[2]
    u2 = data[3]

    uk = data[4]
    ue = data[5]
    pe = f_pr(data[[0, 1, 2, 3, 5]])

    tk = data[6]
    te = data[7]
    tl = data[8]

    t0 = f_t0(data[0:9])

    uln2 = data[9]
    pln2 = f_pr(data[[0, 1, 2, 3, 9]])
    
    aaaaa = pe / (te - t0) + epsilon * (pe - pln2) / (tl - t0)

    return (aaaaa * t0 + pln2) / (aaaaa - gamma * pln2)


# %%
point_tln2 = np.array([p_lab, p_2, U_lab, U_2, U_k, U_e, t_k, t_e, t_lab, U_LN2])
sigma_tln2 = np.array([std_p_lab, std_p_2, std_U, std_U, std_U, std_U, std_t_k, std_t_e, std_t_lab, std_U])

# calculation
t_LN2 = f_tln2(point_tln2)

# error prop
jac_tln2 = jacobian(f_tln2, point_tln2).df
std_t_LN2 = np.sqrt(jac_tln2**2 @ sigma_tln2.transpose()**2)

print('t_LN2 =', t_LN2, '+-', std_t_LN2)
```

= Error Propagation <all_of_the_errors_AAAAAAAAAA>
An overline $overline(a)$ means in this section: $overline(a) = f_a (z_a)$. So $overline(a)$ is the value $a$ but as a function dependant on $z_a$. The vector $z_a$ only contains values measured or values assumed. $z_a$ does not contain already calculated values. This is to minimize the effect of correlation in the error propagation. $sigma_z_a$ are the correspoinding errors of the starting or assumed values. Then $f_a (z_a) = overline(a) = a$. Is the function that returns $a$ when plugged in with $z_a$. We introduced this function to take its jacobian for the final formula of $sigma_a$. When we write $J_f_a (z_a)^2$, we mean component wise squars. so $J_f_a (z_a)^2 = ((part_z_(a, 1)f_a)^2, ..., ...., (part_z_(a, n) f_a)^2)$. The same goes for $sigma^2_z_a = (sigma^2_z_(a, 1), ..., ..., sigma^2_z_(a, n))$.
=== Error of *$C$*
$
  z_C = (p_l, p_2, U_l, U_2)
  \
  sigma_z_C = (sigma_p_l, sigma_p_2, sigma_U_l, sigma_U_2)
  \
  f_C (z_C) = (p_l - p_2) / (U_l - U_2)
  \
  sigma_C = sqrt((J_f_C (z_C)^2)_(1 times 4) (sigma^2_z_C)_(4 times 1)^T) = 0.02 "bar" / V
$

=== Error of *$p_0$* <error_p_0>
$
  z_p_0 = (p_l, p_2, U_l, U_2)
  \
  sigma_z_p_0 = (sigma_p_l, sigma_p_2, sigma_U_l, sigma_U_2)
  \
  f_p_0 (z_p_0) = p_l - (p_l - p_2) / (1 - U_2 / U_l)
  \

  sigma_p_0 = sqrt((J_f_p_0 (z_p_0)^2)_(1 times 4) (sigma^2_z_p_0)^T_(4 times 1))
$
=== Error of *$p_k$*
$
  z_p_k = (p_l, p_2, U_l, U_2, U_k)
  \
  sigma_z_p_k = (sigma_p_l, sigma_p_2, sigma_U_l, sigma_U_2, sigma_U_k)
  \
  f_p_k (z_p_k) = p_l - (p_l - p_2) / (1 - U_2 / U_l) + U_k (p_l - p_2) / (U_l - U_2) = overline(p_0) + U_k overline(C)
  \
  sigma_p_k = sqrt((J_f_p_k (z_p_k)^2)_(1 times 5) (sigma^2_z_p_k)^T_(5 times 1))
$

=== Error of *$p_e$*
$
  z_p_e = (p_l, p_2, U_l, U_2, U_e)
  \
  sigma_z_p_e = (sigma_p_l, sigma_p_2, sigma_U_l, sigma_U_2, sigma_U_e)
  \
  f_p_e (z_p_e) = p_l - (p_l - p_2) / (1 - U_2 / U_l) + U_e (p_l - p_2) / (U_l - U_2) = overline(p_0) + U_e overline(C)
  \
  sigma_p_e = sqrt((J_f_p_e (z_p_e)^2)_(1 times 5) (sigma^2_z_p_e)^T_(5 times 1))
$

=== Error of *$t'_0$*
$
  z_t'_0 = (p_l, p_2, U_l, U_2, U_k, U_e, t_k)
  \
  sigma_z_t'_0 = (sigma_p_l, sigma_p_2, sigma_U_l, sigma_U_2, sigma_U_k, sigma_U_e, sigma_t_k)
  \
  f_t'_0 (z_t'_0) = - t_k (f_p_e (z_p_e)) / (f_p_k (z_p_k) - f_p_e (z_p_e)) = - t_k overline(p_e) / (overline(p_k) - overline(p_e)) quadd ("we get " z_p_e "and " z_p_k "from " z_t'_0)
  \
  sigma_t'_0 = sqrt((J_f_t'_0 (z_t'_0)^2)_(1 times 7) (sigma^2_z_t'_0)^T_(7 times 1))
$

=== Error of *$t_0$*
$
  z_t_0 = (p_l, p_2, U_l, U_2, U_k, U_e, t_k, t_e, t_l)
  \
  sigma_z_t_0 = (sigma_p_l, sigma_p_2, sigma_U_l, sigma_U_2, sigma_U_k, sigma_U_e, sigma_t_k, sigma_t_e, sigma_t_l)
  \
  f_t_0 (z_t_0) = (-b + sqrt(b^2 - 4 a c)) / (2 a)
  \
  \
  epsilon = 10^(-3)
  \
  gamma = 10^(-5) "/°C"
  \
  a = (1 + epsilon) overline(p_e) - (1 + epsilon + gamma t_k) overline(p_k)
  \
  b = epsilon (overline(p_k) - overline(p_e)) t_k + (1 + gamma t_k) overline(p_k) t_l - overline(p_e) (t_l + t_k)
  \
  c = overline(p_e) t_l t_k
  \
  \
    ("where " overline(p_e) "means " f_p_e (z_p_e) "and " z_p_e "is obtained from " z_t_0 " " ("the same goes for all overlines"))
  \
  \
  sigma_t_0 = sqrt((J_f_t_0 (z_t_0)^2)_(1 times 9) (sigma^2_z_t_0)^T_(9 times 1))
$

=== Error of *$p_(l N_2)$*
$
  z_p_(l N_2) = (p_l, p_2, U_l, U_2,  U_(l N_2))
  \
  sigma_z_p_(l N_2) = (sigma_p_l, sigma_p_2, sigma_U_l, sigma_U_2, sigma_ U_(l N_2))
  \
  f_p_(l N_2) (z_p_(l N_2)) = p_l - (p_l - p_2) / (1 - U_2 / U_l) +  U_(l N_2) (p_l - p_2) / (U_l - U_2) = overline(p_0) +  U_(l N_2) overline(C)
  \
  sigma_p_(l N_2) = sqrt((J_f_p_(l N_2) (z_p_(l N_2))^2)_(1 times 5) (sigma^2_z_p_(l N_2))^T_(5 times 1))
$

=== Error of *$t'_(l N_2)$*
$
  z_t'_(l N_2) = (p_l, p_2, U_l, U_2, U_k, U_e, t_k, t_e, t_l,  U_(l N_2))
  \
  sigma_z_t'_(l N_2) = (sigma_p_l, sigma_p_2, sigma_U_l, sigma_U_2, sigma_U_k, sigma_U_e, sigma_t_k, sigma_t_e, sigma_t_l, sigma_ U_(l N_2))
  \
  f_t'_(l N_2) (z_t'_(l N_2)) = (1 - overline(p_(l N_2)) / overline(p_e)) overline(t_0)
  \
  \
  ("where " overline(t_0) "means " f_t_0 (z_t_0) "and " z_t_0 "is obtained from " z_t'_(l N_2) " " ("the same goes for all overlines"))
  \
  \
  sigma_t'_(l N_2) = sqrt((J_f_t'_(l N_2) (z_t'_(l N_2))^2)_(1 times 10) (sigma^2_z_t'_(l N_2))^T_(10 times 1))
$

=== Error of *$t_(l N_2)$*
$
  z_t_(l N_2) = (p_l, p_2, U_l, U_2, U_k, U_e, t_k, t_e, t_l,  U_(l N_2))
  \
  sigma_z_t_(l N_2) = (sigma_p_l, sigma_p_2, sigma_U_l, sigma_U_2, sigma_U_k, sigma_U_e, sigma_t_k, sigma_t_e, sigma_t_l, sigma_ U_(l N_2))
  \
  f_t_(l N_2) (z_t_(l N_2)) = (A overline(t_0) + overline(p_(l N_2))) / (A - gamma overline(p_(l N_2)))
  \
  \
  epsilon = 10^(-3)
  \
  gamma = 10^(-5) "/°C"
  \
  A = overline(p_e) / (t_e - overline(t_0)) + (epsilon (overline(p_e) - overline(p_(l N_2)))) / (t_l - overline(t_0))
  \
  \
  ("where " overline(t_0) "means " f_t_0 (z_t_0) "and " z_t_0 "is obtained from " z_t_(l N_2) " " ("the same goes for all overlines"))
  \
  \
  sigma_t_(l N_2) = sqrt((J_f_t_(l N_2) (z_t_(l N_2))^2)_(1 times 10) (sigma^2_z_t_(l N_2))^T_(10 times 1))
$

#pagebreak()


#bibliography("sources.bib")
