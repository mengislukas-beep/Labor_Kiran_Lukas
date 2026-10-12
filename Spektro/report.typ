
#import "../style.typ": *

#show: setup    

#set document(title: "Report Spectroscopy I")

#set text(size: 11pt)

#align(center)[
  #text(size: 17pt, weight: "bold")[
    Report Spectroscopy I
  ]
]

#v(2em)

#align(center)[
  *Abstract*
]

#v(0.5em)

#align(center)[
  The goal of this experiment is to analyse the spectroscopy lines of hydrogene and helium and compare it with the literature values. To achive this we used a spectrometer and compared the differents angles of the grating of the spectrallines. At the end by taking the average over all result we got $3.07 plus.minus 0.01$e15, which is deviates with approxiamtely 10% of the literature value. One hypothesis is that the due to the bad resolution the mesearments are not totally correct. We conclude therefore that some deviates of the lesser visible spectrallines have to be taken in account.
]

= Introduction

= Experiment

= Results
$k_0$ denotes the k-value which corresponds to the 0-th order. The measured value is $k_0 = 950$. This value is wrong. More details are in the discussion section.

the first measurement is to fit the wavelength of the middle pixel position in dependance of dial position (k-value). The results are the following:

#table(
  columns: 8,
  stroke: 0.5pt + gray,
  align: center + horizon,

  [Wavelength [nm]],
  [388.8],
  [447.1],
  [471.3],
  [492.1],
  [504.7],
  [667.8],
  [706.5],

  [k-value],
  [$1310 plus.minus 1$],
  [$1131 plus.minus 1$],
  [$1101 plus.minus 1$],
  [$1072 plus.minus 1$],
  [$1070 plus.minus 1$],
  [$849 plus.minus 1$],
  [$800 plus.minus 1$],
)


The first column contains the wavelength in nm of the measured light-strips. The value is the literature value. The second column contains the measurements. The measurement is the k-value. This is light from the He-Lamp.

the second measurement is for a fixed k-value and measures data to fit the wavelength in dependance of pixel position
the results are the following:

#table(
    columns: 4,
    rows: 2,
    stroke: gray,

    [Wavelength [nm]],
    [492.1],
    [501.5],
    [504.7],

    [pixel position],
    [$475 plus.minus 1$],
    [$802 plus.minus 1$],
    [$920 plus.minus 1$],
)

The first column is again the known wavelengths of the measured light-strips in nm. the second column is the pixel position on the image. the image is 1440px wide, therefore the pixel position $p$ has $0 <= p < 1440$

the third data-set is from the Hydrogen-Lamp to measure the wavelengths of the Balmer-Series.

#table(
    columns: 5,
    rows: 2,
    stroke: gray,

    [n],
    [3],
    [4],
    [5],
    [6],

    [k-value],
    [$860 plus.minus 1$],
    [$1080 plus.minus 1$],
    [$1112 plus.minus 1$],
    [$1120 plus.minus 1$],
)
the first column is the Balmer-Series. They are the corresponding measurements of the k-values.


= Data Analysis

The fit function used is of the form $lambda (p, k) = b k + a + (p - p_("cent")) / d$
we used this function because our $k_0$-value was wrong. Therefore we now use three fit-parameter instead of two like in the manual.
with the first data-set we obtained values for a and b. we used scipy.curve_fit for the regression. For the first data-set we used the fit $lambda_c_ (k) = b k + a$ since $p = p_("cent")$. This gives the values $a = 1220 plus.minus 2, b = -0.663 plus.minus 0.002$.\
#figure(
    image("Bilder/plot01.png"),
    caption: [
        The Graphs shows the differents spactrallines of helium marked as points meseraude in the in the center pixel. On the x-axis we have the k-(dial position) and the y-axis is the wavelength in nanometers. The orange line is the least sqaures approximation of the points.
    ]
)<1.1>



for the second data-set the fit function is $lambda (p, k_("fix")) = b k_("fix") + a + (p - p_("cent") d$. this is the final fit function but with a fixed $k = k_("fix")$ and $a, b$ from above. this gives $d = 42.6 plus.minus 0.1$. 


#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,

  figure(
    image("Bilder/plot01.png", width: 100%),
    caption: [
      Screenshot of spectral range at k = 1066. We can see three different spectrallines. The verdical line marks the center pixel.
    ],
    
  ),

  figure(
    image("Bilder/plot02.png"),
    caption: [ 
      Graph of the pixel presentation of the visibel spectralines in the picture beside. The blue dots represents the spectrallines of the picture. The red dot is the fit of the center pixel fixed at k=1066. The red striped line represents the fit from @1.1.
      
    ]
  ),
)
from the fit we calculate the lattice constant $g$ as $g = 1 / d = (5.87 plus.minus 0.02) dot 10^(-5)$.

with the complete fit function we obtained the following wavelengths of the Balmer-Series through the fit function: $lambda_3 = 650 plus.minus 2 "nm", lambda_4 = 504 plus.minus 2 "nm", lambda_5 = 483 plus.minus 2 "nm", lambda_6 = 477 plus.minus 2 "nm"$.

from the average of the obtained wavelengths we calculate the Rydberg-Frequency as $R_H  = (3.07 plus.minus 0.01) e 15$ therefore the limit of the Balmer-Series is $lambda_("min") = 391 plus.minus 2 "nm"$. From the Rydberg-Frequency we continue to calculate the ionisation energy as $E_("ion") = (h R_H) / e = 12.7 plus.minus 0.1 "eV"$ where $h$ is Plancks constant and $e$ is the proton charge.


= Discussion

The $k_0$-value measured in the experiment is $k_0 = 950$. This measurment does not correspond to the actual $k_0$-vlaue but to the 587.5 nm wavelength light. This wavelength is yellow and was therefore misinterpreted as the 0-th order. In order to correct for this mistake, we used for the first fit-function $lambda_c (k) = b k + a$ instead of $lambda_c (k) = b (k - k_0)$. The latter function is used in the manual.

The measurements of the Balmer-Series have given:

#table(
    columns: 5,
    rows: 2,
    column-gutter: 0pt,
    row-gutter: 0pt,
    stroke: gray,

    [literature value [nm]],
    [656],
    [486],
    [434],
    [410],

    [experimental value [nm]],
    [$650 plus.minus 2$],
    [$504 plus.minus 2$],
    [$483 plus.minus 2$],
    [$477 plus.minus 2$],
)

Also the experimental values from the Rydberg-Frequency, ionisation energy and the limit of the Balmer-Series deviate from the literature values.

#table(
    columns: 4,
    rows: 3,
    stroke: gray,
    align: center,
    

    [],
    [Rydberg-Frequency [Hz]],
    [ionisation energy [eV]],
    [limit of Series [nm]],

    [literature value],
    [3.29 e 15],
    [13.6],
    [365],

    [experimental value],
    [$(3.07 plus.minus 0.01) e 15$],
    [$12.7 plus.minus 0.1$],
    [$391 plus.minus 2$],
)



The errors from the Rydberg-Frequency, ionisation energy and limit of the Balmer-Series directly propagate from the errors in measurement of the H-Lines. The values obtained from the H-Lines come from the fit-function and the measured k-values for each H-Line. Both of them have their own errors, which contribute. The errors trace back to the originally set deviations of $Delta k = plus.minus 1$ and $Delta p = plus.minus 1$ where $Delta k$ is the error of the k-value and $Delta p$ the error in pixel position.\



= Conclusion
So könnte man sourcen zitieren\
@demtroeder2018
@griffiths2018
Ich mache eine Footnote #footnote[1 2 3]




#pagebreak()

= Appendix

```python

import numpy as np
import matplotlib.pyplot as plt

# %%
p_cent = 720                                                # image is 1440 wide
k0 = 950                                                    # +-1 measured value
k_cent = np.array([1070, 1072, 1101, 1131, 1310, 849, 800]) # +-1 measured values of k
lamda_cent = np.array([504.7, 492.1, 471.3, 447.1, 388.8, 667.8, 706.5])
                                                            # corresponding wavelength values from manual

# %%
# fit model for wavelength depending on dial position k
def lamda_cent_fit (k, bb, aa):
    return bb * k + aa

# %%
std_k = 50
std_k_cent = np.ones(7) * std_k # uncertenties of k values

from scipy.optimize import curve_fit
# first fit to convert x-error to y-error
popt, pcov = curve_fit(lamda_cent_fit, k_cent, lamda_cent, absolute_sigma=True)

b_prov = popt[0]

# y-error
std_lamda_from_k = np.abs(b_prov * std_k_cent)

# actual fit
popt, pcov = curve_fit(lamda_cent_fit, k_cent, lamda_cent, sigma=std_lamda_from_k, absolute_sigma=True)

# fit parameters a, b for lamda(k) = b*k + a
b = popt[0]
a = popt[1]
print(a)
print(b)

print('========')

std_b = np.sqrt(pcov[0, 0])
std_a = np.sqrt(pcov[1, 1])
print(std_a)
print(std_b)

plt.plot(k_cent, lamda_cent, linestyle='', marker='o')
plt.plot(k_cent, lamda_cent_fit(k_cent, b, a))
plt.xlabel('k (dial position)')
plt.ylabel('wavelength [nm]')
plt.title('fit for the center pixel')
plt.errorbar(k_cent, lamda_cent, std_lamda_from_k, linestyle = '', color='r')

# %%
k_fix = 1066                              # +-1 measured value
p_pos = np.array([475, 802, 920])         # pixel position from image
lamda_k = np.array([492.1, 501.5, 504.7]) # values from manual (wavelength)

# %%
# fit model including pixel position
def lamda_fit (p, dd):
    return b * k_fix + a + (p - p_cent) / dd

# %%
std_p = 20

from scipy.optimize import curve_fit
# first fit to determine y-error from x-error
popt, pcov = curve_fit(lamda_fit, p_pos, lamda_k, absolute_sigma=True)

d_prov = popt[0]
std_lamda_from_p = np.abs(std_p / d_prov)

# actual fit
popt, pcov = curve_fit(lamda_fit, p_pos, lamda_k, sigma=std_lamda_from_p, absolute_sigma=True)
d = popt[0]
print(d)
std_d = np.sqrt(pcov[0, 0])
print(std_d)

# %%
plt.plot(p_pos, lamda_k, linestyle='', marker='o')
offset = 0
plt.plot(p_pos, lamda_fit(p_pos, d) - offset)
plt.plot(p_pos, lamda_fit(p_pos, d + std_d) - offset, linestyle='--')
plt.plot(p_pos, lamda_fit(p_pos, d - std_d) - offset, linestyle='--')

plt.xlabel('p (pixel position)')
plt.ylabel('wavelength [nm]')
plt.title('fit for pixel dependancy fixed k = 1066')

plt.plot(p_cent, lamda_fit(p_cent, d) - offset, marker='o', color='r')

# %%
# final fit function
def lamda (p, k):
    return b * k + a + (p - p_cent) / d

# %%
# calculation of the lattice constant

# %%
lamda_at_center = 667.8                 # wavelength of middle pixel
beta = 15 * 2 * np.pi / 360             # 15° in radians
k_pos = 850                             # +-1 dial position
alpha = (k_pos - 500) * 5.8 / 10**5     # calculates the angle alpha based on manual
print(alpha / (2 * np.pi) * 360)        # prints alpha in degrees

# %%
# lattice constant:
d = lamda_at_center / (2 * np.cos(beta) * np.sin(alpha))
print(1 / d)

# %%
# error prop:
del_alpha = 5.8 / 10**5
std_alpha = np.sqrt((del_alpha * std_k)**2)

del_g = 2 * np.cos(beta) * np.cos(alpha) / lamda_at_center
std_g = np.sqrt((del_g * std_alpha)**2)

print(std_g)

# %%
measurements = np.array([860, 1080, 1112, 1120])   # +-1 k values
balmer_lamda = lamda(p_cent, measurements)          #literature 656.279, 486.135, 434.0472, 410.1734
print(balmer_lamda)
c = 299792458

print('==============')

# error porp:
del_f_a = 1                           # = 1
del_f_b = measurements                # = k
del_f_d = -(p_cent - p_cent) / d**2   # = -(p - p_cent) / d^2
del_f_p = 1 / d                       # = 1 / d
del_f_k = b                           # = b
std_lamda = np.sqrt((del_f_a * std_a)**2
               + (del_f_b * std_b)**2
               + (del_f_d * std_d)**2
               + (del_f_p * std_p)**2
               + (del_f_k * std_k)**2)

print(std_lamda)

# %%
# calculated values for rydborg frequency
nn = np.array([3, 4, 5, 6])                                   # balmer series
balmer_lamda_m = balmer_lamda / 10**9                         # wavelength in m
ryd_freq = c / balmer_lamda_m * 1 / ((1 / 4) - (1 / nn**2))   # formula from manual
print(ryd_freq)
print(np.mean(ryd_freq))
print(np.mean(ryd_freq) / 10**15)
print('---')
print(np.mean(ryd_freq) / c)

print('=============')

# error prop:
del_ryd_lamda = (-1) * c / (balmer_lamda_m)**2 * 1 / ((1 / 4) - (1 / nn**2))
std_ryd = np.sqrt((del_ryd_lamda * std_lamda / 10**9)**2)
print(std_ryd)

# %%
# limit of series: f = Rh / 4 | lamda = 4 * c / Rh
print(c / np.mean(ryd_freq) * 4 * 10**9)

print('===========')
# error prop:
del_lamda_lim = (-1) * 4 * c / np.mean(ryd_freq)**2
std_lamda_lim = np.sqrt((del_lamda_lim * np.mean(std_ryd))**2)
print(std_lamda_lim * 10**9)

# %%
# E_photon = h * c / lamda         (h is planks constant)
# E_photon[eV] = E_photon / e      (e is electornic charge)
e = 1.602176634 * 10**(-19)
h = 6.62607015 * 10**(-34)

print(h * np.mean(ryd_freq) / e)

print('=======')
# error prop:
del_E_photon = h / e
sig_E_photon = np.sqrt((del_E_photon * np.mean(std_ryd))**2)
print(sig_E_photon)
```

#pagebreak()


= Sources


#bibliography("sources.bib")