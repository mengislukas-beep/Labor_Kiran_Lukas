#import "../style.typ": *
#import "@preview/subpar:0.2.2"
#show: setup

#set document(title: "Report Spectroscopy I")
#set text(lang: "en", region: "GB")


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

#include "chapters/abstract.typ"



#include "chapters/intro.typ"



#include "chapters/experiment.typ"



= Results
== Calibration
The k-value of the 0th-order ($k_0$) is equal to:
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

== Solar Spectrum<solar_spectre>
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
This is beacause for the first fit all spectral lines were measured at $p = p_c$. To do this we used the scipy curve_fit function @SciPy_curve_fit. We also used the scipy curve_fit covariance matrix to determine its standart deviation (@curve_fit) @SciPy_curve_fit. We got:
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
  sigma_z &= (sigma_k_0, sigma_b, sigma_d, sigma_p, sigma_k) = (2, 0.0007 "nm", 0.03 "px", 1 "px", 2)
  \
  sigma_z^2 &:= (sigma^2_k_0, sigma_b^2, sigma_d^2, sigma_p^2, sigma_k^2)
  \
  f(z) &= b ((k - k_0) - (p - p_c) / d)
  \
  sigma_lambda &= sqrt((J_f (z) ^2)_(1 times 5) (sigma_z^2)_(5 times 1)^T)
  \
$
where $J$ is the jacobian and
$
J_f ^2 &= ((part_z_1 f)^2, (part_z_2 f)^2, (part_z_3 f)^2, (part_z_4 f)^2, (part_z_5 f)^2)
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
The absorbtion line at $488 "nm"$ corresponds to the $F$ Fraunhofer absorbtion line @fraunhofer_lines. The $518 "nm", 518 "nm", 519 "nm"$ lines all correspond to the $b_1$ Fraunhofer line. The $528 "nm"$ line corresponds to the $E_2$ line. The measured lines at $590 "nm"$ and $591 "nm"$ correspond to the $D_2$ and $D_1$ Fraunhofer lines. The $654 "nm"$ line corresponds to $H"-"alpha$ @fraunhofer_lines.

We have found no match for the $533 "nm", 631 "nm", 628 "nm", 652 "nm"$ lines.

We especially missed many of the absorbtion lines outside the $(480 "nm", 660 "nm")$ interval. We only see a rise in the spectrum at $400 "nm"$, since at $400 "nm"$ the spectral range of the spectrometer starts @manuel_skript. The spectral range ends at $650 "nm"$ @manuel_skript. This can also be seen in the plot and can explain the increase and drop off in intenity around these positions. Another error source is the noise. This increases the difficulty of distinguishing noise from an absorbtion line. Also from $580 "nm"$ to $640 "nm"$ the intensity is doubled. This is red light. This could be beacause the experiment took place 1-2h before sunset (2026-11-18, 14:45 - 15:45, Zürich). This might have increased the amount of light in this spectral range. Another source of error is, that we used a flashlight to read the dial position (k-value) from the spectrometer. This might have caused a different background noise and could explain the jumps in intensity at the image borders (can bee seen in @raw_data). In addition the fit can cause inaccuracy. Evidence for this are the $533 "nm", 631 "nm", 628 "nm"$ lines. They are in an overlaping are of the images, so they should appear in both images. However they only appear in one of the images (see @seperated_data). This could be beacause the fit is inaccurate and therefore causes the conversion from $k$ and $p$ to $lambda$ to have a mismatch. We could think that the $528 "nm"$ and the $533 "nm"$ are the same, and the $631 "nm"$ and the $628 "nm"$ are the same, but have different wavelengths due to the fit. This only works for one pair tho, since the offset is in the opposite direction. For one pair the image to the right has the spectral line to the right and for the other pair to the left.

Another source of error could be mistakes in reading the dial position or a typing mistake, whilst copying the reading.

= conclusion 

#pagebreak()
#set heading(numbering: "A")

#set heading(numbering: "A")

#counter(heading).update(0)
#set heading(numbering: "A.1.i")
= Appendix
== python skript <python>
```python
# %%
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
from scipy.differentiate import jacobian

# %%
##### calibration
p_cent = 720 # image is 1440 wide

k0 = 1126 # measurement (+- 2)



k_cali = np.array([556, 524, 500, 486, 483, 376, 274, 226, 135]) # measurements (+- 2)
lamda_cali = np.array([447.1, 471.3, 492.1, 501.5, 504.7, 587.5, 667.8, 706.5, 781.3]) # literature values of wavelength (manual)

# %%
# fit model for wavelength depending on dial position k
def lamda_c (kk, bb):
    return bb * (kk - k0)

# %%
std_k = 2
std_k_cali = np.ones(len(k_cali)) * std_k # uncertenties of k values

# first fit to convert x-error to y-error
popt, pcov = curve_fit(lamda_c, k_cali, lamda_cali, absolute_sigma=True)
b_prov = popt[0]
std_lamda_cali = np.abs(b_prov * std_k_cali)

# actual fit
popt, pcov = curve_fit(lamda_c, k_cali, lamda_cali, sigma=std_lamda_cali, absolute_sigma=True)
b = popt[0]
std_b = np.sqrt(pcov[0, 0])
print('b =', b, '+-', std_b)

plt.plot(k_cali, lamda_cali, linestyle='', marker='o')
plt.plot(k_cali, lamda_c(k_cali, b))
plt.xlabel('k (dial position) a.u.')
plt.ylabel('wavelength [nm]')
plt.title('fit for the center pixel')
plt.errorbar(k_cali, lamda_cali, std_lamda_cali, linestyle = '', color='r')

# %%
p_pcali = np.array([80, 290, 473, 720, 920, 1180, 1390]) # measurment of pixel position from image (+- 1)
k_pcali = np.array([353, 362, 369, 376, 387, 396, 404]) # measurment of k (+- 2)
lamda_pcali = np.array([587.5, 587.5, 587.5, 587.5, 587.5, 587.5, 587.5]) # literaure values from manual (wavelength)

pk_pcali = np.stack((p_pcali, k_pcali))

# %%
# fit model including pixel position
def lamda_p (pk, dd):
    pp = pk[0]
    kk = pk[1]
    return b * ((kk - k0) - (pp - p_cent) / dd)

# %%
std_p = 1
std_p_pcali = np.ones(len(p_pcali)) * std_p # errors of the pixels

# first fit to determine y-error from x-error
popt, pcov = curve_fit(lamda_p, pk_pcali, lamda_pcali, absolute_sigma=True)
d_prov = popt[0]
std_lamda_pcali = np.abs(std_p_pcali / d_prov)

# actual fit
popt, pcov = curve_fit(lamda_p, pk_pcali, lamda_pcali, sigma=std_lamda_pcali, absolute_sigma=True)
d = popt[0]
std_d = np.sqrt(pcov[0, 0])
print('d =', d, '+-', std_d)

plt.plot(p_pcali, k_pcali, linestyle='', marker='o')
plt.plot(p_pcali, lamda_pcali / b + k0 + (p_pcali - p_cent) / d)
plt.ylabel('k-value (dial position) a.u.') 
plt.xlabel('pixel position [px]')
plt.title('estimated middle k-value for pixel position')

# %%
saveparams = open("popt.txt", "w")
saveparams.write(str(k0))
saveparams.write("\n")
saveparams.write(str(b))
saveparams.write("\n")
saveparams.write(str(std_b))
saveparams.write("\n")
saveparams.write(str(d))
saveparams.write("\n")
saveparams.write(str(std_d))
saveparams.close()



# %%
# final fit function
def lamda (pp, kk):
    return b * ((kk - k0) - (pp - p_cent) / d)

# %%
def k_val (w):
    return w / b + k0

# %%
print(k_val(580))

# %%
def f_lamda(z):
    fk0 = z[0]
    fb = z[1]
    fd = z[2]
    fp = z[3]
    fk = z[4]
    return fb * ((fk - fk0) - (fp - p_cent) / fd)

# %%
absorb_lines_p = np.array([599, 548, 567, 607, 900, 13,  861, 880, 1182,  55, 825, 890]) # data from tif images
absorb_lines_k = np.array([500, 460, 460, 460, 460, 420, 380, 380,  340, 300, 300, 300]) # data from tif images

# %%
for i in range(len(absorb_lines_k)):
    counttt = i

    z = np.array([k0, b, d, absorb_lines_p[counttt], absorb_lines_k[counttt]])
    std_z = np.array([std_k, std_b, std_d, std_p, std_k])

    jac = jacobian(f_lamda, z).df

    print(lamda(z[3], z[4]), '+-', np.sqrt(jac**2 @ std_z.transpose()**2))

# %%
print(lamda(20, 220))

# %%
##### PLOTS

# %%
##### go to other jupyter to create the solar spectrum from images

data = np.loadtxt("spct_sun_raw.txt", delimiter=',')
wavelength = data[:, 0]
intensity = data[:, 1]

edges = np.loadtxt("spct_sun_raw_edges.txt", delimiter=',')

fromm = 0
too = 20

fig = plt.figure(figsize=(12, 6.5))
ax = fig.add_subplot(111)
for i in range(fromm, too):
    if i % 5 == 0:
        ax.axvline(edges[i, 0], color='green', linestyle='--', linewidth=0.7)
        ax.axvline(edges[i, 1], color='green', linestyle='--', linewidth=0.7)
    elif i % 5 == 1:
        ax.axvline(edges[i, 0], color='orange', linestyle='--', linewidth=0.7)
        ax.axvline(edges[i, 1], color='orange', linestyle='--', linewidth=0.7)
    elif i % 5 == 2:
        ax.axvline(edges[i, 0], color='purple', linestyle='--', linewidth=0.7)
        ax.axvline(edges[i, 1], color='purple', linestyle='--', linewidth=0.7)
    elif i % 5 == 3:
        ax.axvline(edges[i, 0], color='red', linestyle='--', linewidth=0.7)
        ax.axvline(edges[i, 1], color='red', linestyle='--', linewidth=0.7)
    else:
        ax.axvline(edges[i, 0], color='cyan', linestyle='--', linewidth=0.7)
        ax.axvline(edges[i, 1], color='cyan', linestyle='--', linewidth=0.7)
ax.plot(wavelength[1440 * fromm: 1440 * too], intensity[1440 * fromm: 1440 * too], linestyle='', marker='o', markersize=1)
ax.set_title('raw datapoints of solar spectrum', fontsize=18)
ax.set_xlabel('wavelength [nm]', fontsize=16)
ax.set_ylabel('intensity [a.u.]', fontsize=16)

# %%
data = np.loadtxt("spct_sun_raw.txt", delimiter=',')
wavelength = data[:, 0]
intensity = data[:, 1]

edges = np.loadtxt("spct_sun_raw_edges.txt", delimiter=',')

fromm = 400
too = 680

fig = plt.figure(figsize=(12, 7))
ax = fig.add_subplot(111)
oneTime = True
#for i in range(len(edges)):
#    if edges[i, 0] > fromm and edges[i, 0] < too:
#        if oneTime == True:
#            ax.axvline(edges[i, 0], color='purple', linestyle='--', linewidth=0.7, label='image border')
#            ax.axvline(edges[i, 1], color='purple', linestyle='--', linewidth=0.7)
#            oneTime = False
#        else:
#            ax.axvline(edges[i, 0], color='purple', linestyle='--', linewidth=0.7)
#            ax.axvline(edges[i, 1], color='purple', linestyle='--', linewidth=0.7)

for i in range(len(absorb_lines_k)):
    if i == 0:
        ax.axvline(lamda(absorb_lines_p[i], absorb_lines_k[i]), linewidth=0.3, color='r', label='absorbtion lines')
    else:
        ax.axvline(lamda(absorb_lines_p[i], absorb_lines_k[i]), linewidth=0.3, color='r')

idk = np.zeros(28800)
for i in range(len(idk)):
    if i % 2880 < 1440:
        idk[i] = 1

# moving average
mov_avr_intensity = np.zeros(len(intensity))
delta = 4
for i in range(delta, len(mov_avr_intensity) - delta - 1):
    mov_avr_intensity[i] = np.mean(intensity[i - delta: i + delta + 1])

#ax.plot(wavelength[(wavelength >= fromm) & (wavelength <= too)], intensity[(wavelength >= fromm) & (wavelength <= too)] + idk[(wavelength >= fromm) & (wavelength <= too)] * 100, linestyle='', marker='o', markersize=2, label='data points')
ax.plot(wavelength[(wavelength >= fromm) & (wavelength <= too)], mov_avr_intensity[(wavelength >= fromm) & (wavelength <= too)] + idk[(wavelength >= fromm) & (wavelength <= too)] * 100, linestyle='', marker='o', markersize=2, label='moving average over 9 datapoints')

ax.legend()
ax.set_title('solar spectrum | 400nm - 680nm | pictures seperated by 100 a.u.', fontsize=18)
ax.set_xlabel('wavelength [nm]', fontsize=16)
ax.set_ylabel('intensity [a.u.]', fontsize=16)


# %%
# fourier filter
fftA = np.fft.fft(intensity)
fftF = np.fft.fftfreq(len(intensity), d=(wavelength[-1] - wavelength[0]) / len(wavelength))

frequency_cutoff = np.max(fftF) / 1.1

fftA_filtered = np.zeros(len(fftA), dtype='complex')
for i in range(len(fftA)):
    if np.abs(fftA[i]) > 0.005 * 10**6:
        if np.abs(fftF[i]) < frequency_cutoff:
            fftA_filtered[i] = fftA[i]

filt_intensity = np.fft.ifft(fftA_filtered)

# %%
fig = plt.figure(figsize=(12, 7))
ax = fig.add_subplot(111)
oneTime = True
for i in range(len(edges)):
    if edges[i, 0] > fromm and edges[i, 0] < too:
        if oneTime == True:
            ax.axvline(edges[i, 0], color='purple', linestyle='--', linewidth=0.7, label='image border')
            oneTime = False
        else:
            ax.axvline(edges[i, 0], color='purple', linestyle='--', linewidth=0.7)

for i in range(len(absorb_lines_k)):
    if i == 0:
        ax.axvline(lamda(absorb_lines_p[i], absorb_lines_k[i]), linewidth=0.5, color='r', label='absorbtion lines')
    else:
        ax.axvline(lamda(absorb_lines_p[i], absorb_lines_k[i]), linewidth=0.5, color='r')

ax.plot(wavelength[(wavelength >= fromm) & (wavelength <= too)], intensity[(wavelength >= fromm) & (wavelength <= too)], linestyle='', marker='o', markersize=0.3, label='raw data')
ax.plot(wavelength[(wavelength >= fromm) & (wavelength <= too)], np.abs(filt_intensity[(wavelength >= fromm) & (wavelength <= too)]), linewidth=0.1, marker='.', markersize=0.3, label='fourier filter (low aplitudes gone)')

ax.legend()
ax.set_title('shortened solar spectrum (no image overlap)', fontsize=18)
ax.set_xlabel('wavelength [nm]', fontsize=16)
ax.set_ylabel('intensity [a.u.]', fontsize=16)

# %%
#570
#520
unk = np.array([570, 502, 430, 392, 389, 92, 81, 12])
unk_w = lamda(p_cent, unk)
unk_s = np.zeros(len(unk))
for i in range(len(unk)):
    z = np.array([k0, b, d, p_cent, unk[i]])
    std_z = np.array([std_k, std_b, std_d, std_p, std_k])
    jac = jacobian(f_lamda, z).df
    unk_s[i] = np.sqrt(jac**2 @ std_z.transpose()**2)

for i in range(len(unk_w)):
    print(unk_w[i], '+-', unk_s[i])

# %%
data = np.loadtxt("spct_unknwn_raw.txt", delimiter=',')
wavelength = data[:, 0]
intensity = data[:, 1]

edges = np.loadtxt("spct_unknwn_raw_edges.txt", delimiter=',')

fromm = 0
too = 1000

fig = plt.figure(figsize=(12, 7))
ax = fig.add_subplot(111)
for i in range(len(edges)):
    if edges[i, 0] > fromm and edges[i, 0] < too:
        ax.axvline(edges[i, 0], color='orange', linestyle='--', linewidth=0.7)
        ax.axvline(edges[i, 1], color='orange', linestyle='--', linewidth=0.7)

ax.plot(wavelength[(wavelength >= fromm) & (wavelength <= too)], intensity[(wavelength >= fromm) & (wavelength <= too)], linestyle='', marker='o', markersize=0.3)

ax.set_title('unknown source (raw datapoints)', fontsize=18)
ax.set_xlabel('wavelength [nm]', fontsize=16)
ax.set_ylabel('intensity [a.u.]', fontsize=16)

# %%
data = np.loadtxt("spct_unknwn_no_overlap.txt", delimiter=',')
wavelength = data[:, 0]
intensity = data[:, 1]

edges = np.loadtxt("spct_unknwn_no_overlap_edges.txt", delimiter=',')

fromm = 0
too = 1000

oneTime = True

fig = plt.figure(figsize=(12, 4))
ax = fig.add_subplot(111)
for i in range(len(edges)):
    if edges[i, 0] > fromm and edges[i, 0] < too:
        if oneTime == True:
            oneTime = False
            ax.axvline(edges[i, 0], color='orange', linestyle='--', linewidth=0.7, label='image borders')
        else:
            ax.axvline(edges[i, 0], color='orange', linestyle='--', linewidth=0.7)
        
        ax.axvline(edges[i, 1], color='orange', linestyle='--', linewidth=0.7)

ax.plot(wavelength[(wavelength >= fromm) & (wavelength <= too)], intensity[(wavelength >= fromm) & (wavelength <= too)], linestyle='', marker='o', markersize=0.3)

ax.set_title('unknown source (no image overlap)', fontsize=18)
ax.set_xlabel('wavelength [nm]', fontsize=16)
ax.set_ylabel('intensity [a.u.]', fontsize=16)
ax.legend()

# %%


# %%
import numpy as np

data = np.loadtxt("spct_sun_raw.txt", delimiter=",")
wavelength = data[:, 0]
itens = data[:, 1]

n = 100

for i in range(len(wavelength) - 1):
    if wavelength[i] > wavelength[i + 1]:

        # Mittelwert der vorherigen n Datenpunkte
        mean1 = np.mean(itens[max(0, i-n+1):i+1])

        # Überlappenden Wellenlängenbereich überspringen
        s = 1
        while i + s < len(wavelength) and wavelength[i] > wavelength[i + s]:
            s += 1

        if i + s >= len(wavelength):
            continue

        # Mittelwert der nächsten n Datenpunkte
        mean2 = np.mean(itens[i+s:i+s+n])

        # Intensitäten der nachfolgenden Datenpunkte korrigieren
        itens[i+s:] += mean1 - mean2

# Wellenlänge und Intensität zusammenfügen
result = np.column_stack((wavelength, itens))

# In TXT-Datei speichern
np.savetxt("spct_sun_continues_1.txt", result, delimiter=",")

#erste idee macht aber irgendwie nicht so viel sinn
    
    


# %%
import numpy as np

data = np.loadtxt("spct_sun_raw.txt", delimiter=",")
wavelength = data[:, 0]
itens = data[:, 1].copy()

# Grenzen der einzelnen Messbereiche finden
breaks = np.where(np.diff(wavelength) < 0)[0] + 1
bounds = np.r_[0, breaks, len(wavelength)]

for k in range(1, len(bounds) - 1):

    a = bounds[k-1]
    b = bounds[k]
    c = bounds[k+1]

    # Alter Messbereich
    w1 = wavelength[a:b]
    I1 = itens[a:b]

    # Neuer Messbereich
    w2 = wavelength[b:c]
    I2 = itens[b:c]

    # Gemeinsamer Wellenlängenbereich
    mask = (w2 >= w1.min()) & (w2 <= w1.max())

    if not np.any(mask):
        continue

    # Intensitäten bei gleichen Wellenlängen
    I1_interp = np.interp(w2[mask], w1, I1)

    # Offset berechnen
    offset = np.mean(I1_interp - I2[mask])

    # Gesamten neuen Messbereich korrigieren
    itens[b:c] += offset

    print("Wellenlänge:", w2[0], "Offset:", offset)

np.savetxt(
    "spct_sun_continues_2.txt",
    np.column_stack((wavelength, itens)),
    delimiter=","
)

# %%


# %%
##### go to other jupyter to create the solar spectrum from images

data = np.loadtxt("spct_sun_continues_2.txt", delimiter=',')
wavelength = data[:, 0]
intensity = data[:, 1]





fig = plt.figure(figsize=(12, 6.5))
ax = fig.add_subplot(111)


ax.plot(wavelength[1440 * fromm: 1440 * too], intensity[1440 * fromm: 1440 * too], linestyle='', marker='o', markersize=1)
ax.set_title('raw datapoints of solar spectrum', fontsize=18)
ax.set_xlabel('wavelength [nm]', fontsize=16)
ax.set_ylabel('intensity [a.u.]', fontsize=16)

# %%
##### go to other jupyter to create the solar spectrum from images

data = np.loadtxt("spct_sun_continues_2.txt", delimiter=',')
wavelength = data[:, 0]
intensity = data[:, 1]


mov_avr_intensity = np.zeros(len(intensity))
delta = 4
for i in range(delta, len(mov_avr_intensity) - delta - 1):
    mov_avr_intensity[i] = np.mean(intensity[i - delta: i + delta + 1])


fig = plt.figure(figsize=(12, 6.5))
ax = fig.add_subplot(111)


ax.plot(wavelength[1440 * fromm: 1440 * too], mov_avr_intensity[1440 * fromm: 1440 * too], linestyle='', marker='o', markersize=1)
ax.set_title('bessere Übergänge', fontsize=18)
ax.set_xlabel('wavelength [nm]', fontsize=16)
ax.set_ylabel('intensity [a.u.]', fontsize=16)

# %%


# %%

```

== python skript 2
```python
# %% [markdown]
# # Load libraries

# %%
# modified program from moodle course

import matplotlib
import numpy as np
import matplotlib.pyplot as plt
import os
from os import listdir
from os.path import isfile, join
import tifffile as tiff # you might have to install this with 'pip install tifffile'

# %%
# function form datenanalyse in der physik lecture

def moving_average(x, delta, edges='repeat'):
    '''Calculate moving average of data array x. Average goes from i-delta to i+delta for every i.
    The argument edges determines how the edge of the array is treated. Options are:
        'repeat': First or last value is repeated beyond array. Output array has same length as input array.
        'cut': Input array is not extended for averaging. Output array has length N-2*delta, where N is len(x).
        'wrap': Input array wraps around for averaging. Output array has same length as input array.'''
    
    N = len(x)
    
    filtered_array = np.zeros(N)
    
    if edges == 'repeat':
        # Original data starts at index delta, stops at delta+N-1
        padded_array = np.concatenate([
            np.ones(delta) * x[0],  # repeat first value at start
            x,
            np.ones(delta) * x[-1]  # repeat last value at end
        ])
    elif edges == 'cut':
        # We pad with zeros to be able to treat this case the same as the others while averaging.
        # We need to cut the start and end of the array before returning it.
        padded_array = np.concatenate([
            np.zeros(delta),
            x,
            np.zeros(delta)
        ])
    elif edges == 'wrap':
        padded_array = np.concatenate([
            x[-delta:],
            x,
            x[:delta]
        ])
    else:
        raise ValueError('Invalid argument edges="{}"'.format(edges))

    # Calculate moving average
    for i in range(N):
        filtered_array[i] = np.mean(padded_array[i:i+2*delta])

    # Cut invalid parts in case edges='cut'
    if edges == 'cut':
        filtered_array = filtered_array[delta:-delta]
        
    return filtered_array

# %% [markdown]
# # Print files in the current working directory (cwd)

# %%
folder = os.getcwd()
files = listdir(folder)

for i, f_i in enumerate(files):
    print(i, f_i)

# %% [markdown]
# # Read and plot image file

# %%
order = np.array([19, 18, 17, 16, 15, 14, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 13])
kk = np.array([820, 780, 740, 700, 660, 620, 580, 540, 500, 460, 420, 380, 340, 300, 260, 220, 180, 140, 100, 60])
img= tiff.imread(files[6])
k = 300

# %%
# Convert images to arrays
img_array = np.array(img).astype('float64')
print(np.shape(img_array))

# %%
# Plot example image
plt.imshow(img, vmin=1000,vmax=0) 

# %% [markdown]
# # Plot linecut

# %%
y_max, x_max, c_max = np.shape(img_array)

x = np.linspace(0, x_max - 1, x_max)

y = 550
rangee = 70

y_mean = np.zeros(1440)
for i in range(1440):
    y_mean[i] = np.mean(img_array[y - rangee: y + rangee, i, 0]) + np.mean(img_array[y - rangee: y + rangee, i, 1]) + np.mean(img_array[y - rangee: y + rangee, i, 2])

y_mean = y_mean / 3
y_mean_filtered = moving_average(y_mean, 2, "repeat")

# chose color channel
c = 1

cts = (img_array[y, :, 0] + img_array[y, :, 1] + img_array[y, :, 2]) / 3
cts = y_mean

print(img_array[550, 100])
print(img_array[550, 1300])

# %%
# Plot Data
plt.figure(
    num=1,
    figsize=(10,6),
    facecolor='white')
plt.xlabel(r'Pixel', fontsize=16)
plt.ylabel(r'Counts per $t_\mathrm{c}$', fontsize=16)
plt.plot(x, cts)
plt.xticks(fontsize=16)
plt.yticks(fontsize=16)
#plt.axvline(825)
plt.show()

# %%
cutoff = 0
cutofff = 100
x_short = x[cutoff: cutofff]
cts_short = cts[cutoff: cutofff]
print(x_short[cts_short < 60])

# %%
plt.figure(
    num=1,
    figsize=(10,6),
    facecolor='white')
plt.xlabel(r'Pixel', fontsize=16)
plt.ylabel(r'Counts per $t_\mathrm{c}$', fontsize=16)
plt.plot(x, y_mean_filtered)
plt.xticks(fontsize=16)
plt.yticks(fontsize=16)
plt.show()

# %%
print(len(cts))
print(len(x))

# %%
popt = np.loadtxt("../popt.txt")
k0 = popt[0]
b = popt[1]
d = popt[3]
p_cent = 720
print(k0)
print(b)
print(d)

# %%
def lamda(pp, kk):
    return b * ((kk - k0) - (pp - p_cent) / d)

# %%
for h in range(len(order)):
    img= tiff.imread(files[order[h]])
    img_array = np.array(img).astype('float64')
    k_val = kk[h]
    y_meann = np.zeros(1440)
    
    for i in range(1440):
        y_meann[i] = np.mean(img_array[y - rangee: y + rangee, i, 0]) + np.mean(img_array[y - rangee: y + rangee, i, 1]) + np.mean(img_array[y - rangee: y + rangee, i, 2])

    
    data = np.loadtxt("spectrum.txt", delimiter=',')
    start = 1440
    if data.size == 0:
        start = 0
    else:
        last = data[-1, 0]
        for i in range(len(x)):
            if lamda(i, kk[h]) > last:
                start = i
                break
    #start = 0
    print(h)
    print(start)
    print(lamda(x[start], kk[h]))

    ed = open("edges.txt", "a")
    ed.write(str(lamda(x[start], k_val)))
    ed.write(", ")
    ed.write(str(lamda(x[-1], k_val)))
    ed.write("\n")
    ed.close()

    sp = open("spectrum.txt", "a")

    for i in range(start, len(x)):
        sp.write(str(lamda(x[i], k_val)))
        sp.write(", ")
        sp.write(str(y_meann[i]))
        sp.write("\n")
    sp.close()


# %%
sp.close()

# %%
#must start with smallest wavelength
#must start with highest dial position

data = np.loadtxt("spectrum.txt", delimiter=',')
start = 1440
if data.size == 0:
    start = 0
else:
    last = data[-1, 0]
    for i in range(len(x)):
        if lamda(i, k) > last:
            start = i
            break

start = 0

ed = open("edges.txt", "a")
ed.write(str(lamda(x[start], k)))
ed.write(", ")
ed.write(str(lamda(x[-1], k)))
ed.write("\n")
ed.close()

sp = open("spectrum.txt", "a")

for i in range(start, len(x)):  
    sp.write(str(lamda(x[i], k)))
    sp.write(", ")
    sp.write(str(cts[i]))
    sp.write("\n")
sp.close()

print(len(x) - start)

# %%


# %%


# %%


# %%


# %%


```

== python skript 3
```python
# %% [markdown]
# # Load libraries

# %%
# modified program from moodle course

import matplotlib
import numpy as np
import matplotlib.pyplot as plt
import os
from os import listdir
from os.path import isfile, join
import tifffile as tiff # you might have to install this with 'pip install tifffile'

# %% [markdown]
# # Print files in the current working directory (cwd)

# %%
folder = os.getcwd()
files = listdir(folder)

for i, f_i in enumerate(files):
    print(i, f_i)

# %% [markdown]
# # Read and plot image file

# %%
# Convert images to arrays
order = np.array([5, 4, 3, 2, 1, 7, 6, 0])
kk = np.array([570, 502, 430, 392, 389, 92, 81, 12])


img= tiff.imread(files[order[1]])
img_array = np.array(img).astype('float64')
print(np.shape(img_array))

# %%
# Plot example image
plt.imshow(img, vmin=1000,vmax=0) 

# %% [markdown]
# # Plot linecut

# %%
y_max, x_max, c_max = np.shape(img_array)

x = np.linspace(0, x_max - 1, x_max)

y = 550
rangee = 50

# chose color channel
c = 1

cts = (img_array[y, :, 0] + img_array[y, :, 1] + img_array[y, :, 2]) / 3

# %%
# Plot Data
plt.figure(
    num=1,
    figsize=(10,6),
    facecolor='white')
plt.xlabel(r'Pixel', fontsize=16)
plt.ylabel(r'Counts per $t_\mathrm{c}$', fontsize=16)
plt.plot(x, cts)
plt.xticks(fontsize=16)
plt.yticks(fontsize=16)
plt.show()

# %%
popt = np.loadtxt("../../popt.txt")
k0 = popt[0]
b = popt[1]
d = popt[3]
p_cent = 720
print(k0)
print(b)
print(d)

def lamda(pp, kk):
    return b * ((kk - k0) - (pp - p_cent) / d)

# %%
for h in range(len(order)):
    img= tiff.imread(files[order[h]])
    img_array = np.array(img).astype('float64')
    k_val = kk[h]
    y_meann = np.zeros(1440)
    
    for i in range(1440):
        y_meann[i] = np.mean(img_array[y - rangee: y + rangee, i, 0]) + np.mean(img_array[y - rangee: y + rangee, i, 1]) + np.mean(img_array[y - rangee: y + rangee, i, 2])

    
    data = np.loadtxt("spectrum.txt", delimiter=',')
    start = 1440
    if data.size == 0:
        start = 0
    else:
        last = data[-1, 0]
        for i in range(len(x)):
            if lamda(i, kk[h]) > last:
                start = i
                break
    start = 0
    print(h)
    print(start)
    print(lamda(x[start], kk[h]))

    ed = open("edges.txt", "a")
    ed.write(str(lamda(x[start], k_val)))
    ed.write(", ")
    ed.write(str(lamda(x[-1], k_val)))
    ed.write("\n")
    ed.close()

    sp = open("spectrum.txt", "a")

    for i in range(start, len(x)):
        sp.write(str(lamda(x[i], k_val)))
        sp.write(", ")
        sp.write(str(y_meann[i]))
        sp.write("\n")
    sp.close()


# %%


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
