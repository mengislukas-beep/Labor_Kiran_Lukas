
#import "../style.typ": *

#set document(title: [Report spektroscopy I])

#show title: set text(size: 17pt)
#show title: set align(center)
#title[
 Report spektroscopy I
]
#pagebreak()

= Introduction

= Experiment

= Results
$k_0$ denotes the k-value which corresponds to the 0-th order. The measured value is $k_0 = 950$. This value is wrong. More details are in the discussion section.

the first measurement is to fit the wavelength of the middle pixel position in dependance of dial position (k-value). The results are the following:
#grid(
    columns: 8,
    rows: 2,
    column-gutter: 10pt,
    row-gutter: 5pt,
    stroke: gray,

    [wavelength [nm]],
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

#grid(
    columns: 4,
    rows: 2,
    column-gutter: 10pt,
    row-gutter: 3pt,
    stroke: gray,

    [wavelength [nm]],
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

#grid(
    columns: 5,
    rows: 2,
    column-gutter: 10pt,
    row-gutter: 3pt,
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
the first column is the Balmer-Series. The are the corresponding measurements of the k-values.


= Data Analysis

The fit function used is of the form $lambda (p, k) = b k + a + (p - p_("cent")) / d$
we used this function beacause our $k_0$-value was wrong. Therefore we now use three fit-parameter instead of two like in the manualll.
with the first data-set we obtained values for a and b. we used scipy.curve_fit for the regression. For the first data-set we used the fit $lambda_c (k) = b k + a$ since $p = p_("cent")$. This gives the values $a = 1220 plus.minus 2, b = -0.663 plus.minus 0.002$ *insert plot*

for the second data-set the fit function is $lambda (p, k_("fix")) = b k_("fix") + a + (p - p_("cent")_) / d$. this is the final fit function but with a fixed $k = k#sub[fix]$ and $a, b$ from above. this gives $d = 42.6 plus.minus 0.1$. *insert plot*

from the fit we calculate the lattice constant $g$ as $g = 1 / d = (5.87 plus.minus 0.02) dot 10^(-5)$.

with the complete fit function we obtained the following wavelengths of the Balmer-Series through the fit function: $lambda_3 = 650 plus.minus 2 "nm", lambda_4 = 504 plus.minus 2 "nm", lambda_5 = 483 plus.minus 2 "nm", lambda_6_ = 477 plus.minus 2 "nm"$.

from the average of the obtained wavelengths we calculate the Rydberg-Frequency as $R#sub[H]  = (3.07 plus.minus 0.01) e 15$ therefore the limit of the Balmer-Series is $lambda#sub[min] = 391 plus.minus 2 "nm"$. From the Rydberg-Frequency we continue to calculate the ionisation energy as $E#sub[ion] = (h R#sub[H]) / e = 12.7 plus.minus 0.1 "eV"$ where $h$ is Plancks constant and $e$ is the proton charge.


= Discussion

The $k_0$-value measured in the experiment is $k_0 = 950$. This measurment does not correspond to the actual $k_0$-vlaue but to the 587.5 nm wavelength light. This wavelength is yellow and was therefore misinterpreted as the 0-th order. In order to correct for this mistake, we used for the first fit-function $lambda#sub[c] (k) = b k + a$ instead of $lambda#sub[c] (k) = b (k - k_0)$. The latter function is used in the manual.

The measurements of the Balmer-Series have given:

#grid(
    columns: 5,
    rows: 2,
    column-gutter: 10pt,
    row-gutter: 3pt,
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

#grid(
    columns: 4,
    rows: 12pt,
    column-gutter: 10pt,
    row-gutter: 5pt,
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

The errors from the Rydberg-Frequency, ionisation energy and limit of the Balmer-Series directly propagate from the errors in measurement of the H-Lines. The values obtained from the H-Lines come from the fit-function and the measured k-values for each H-Line. Both of them have their own errors, which contribute. The errors trace back to the originally set deviations of $Delta k = plus.minus 1$ and $Delta p = plus.minus 1$ where $Delta k$ is the error of the k-value and $Delta p$ the error in pixel position.

= Conclusion