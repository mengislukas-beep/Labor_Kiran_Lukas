
#import "style.typ": *

#show: setup    

#set document(title: "Report Spectroscopy I")

#set text(size: 11pt)

#align(center)[
  #text(size: 17pt, weight: "bold")[
    electronics 2
  ]
]

#v(2em)

#set heading(numbering: "1.1")

=
=
 $L = 10m H, quadd C = 100n F, quadd R = 1k Omega, quadd U_"in" = 1V quad (2.8V_"pp")$


#image("electronics2/images/rlc.png", width: 65%)

==
for the phase shift between U_in and U_out we used math function

we also calculated:
$
  U_"out" / U_"in" = (R^2 (omega C - 1 / (omega L))^2 + 1)^(-1 / 2)
  => omega_0 = 1 / sqrt(C L)
$ <resonance>

==
#image("electronics2/images/plot2.2.png", width: 70%)
$
  => omega_0 approx 34000 "rad" / s
$

#pagebreak()

==
#image("electronics2/images/plot2.3.png", width: 90%)

$
  Q_"theory" = R sqrt(C / L) "(manual)"
$
since @resonance we used the following fit:
$
  f (omega, a, b, c) = (c + (omega b - 1 / (omega a))^2)^(-1/2)
  => omega_0 = 1 / sqrt(a b)
$
and got the fit parameters: $a approx 0.081, b approx 0.43, c approx 0.59$ where the inputvariable $omega$ we used for kHz.


the equation:
$
   f(omega_0, a, b, c) / sqrt(2) = U_"max" / sqrt(2) == f(omega, a, b ,c)
$
gives the quadratic:
$
  omega^2 b - omega sqrt(2 / U_"max"^2 - c) - 1 / a = 0
$
this yields:
$
  omega_"lower" approx 4.51 * 2 * pi quad k "rad" / s, quadd omega_"upper" approx 6.23 * 2 * pi quad k "rad" / s
$
$
  Q_"fit" = omega_0 / (Delta omega) = 1 / sqrt(a b) 1/((omega_"upper" - omega_"lower")) approx 3.00
$

#pagebreak()

==
To measure the phase of the current $I$ and $U_"out"$ we measured the voltage over R $U_R$, since it is in phase with th current. To measure $U_R$ we did $U_"in" - U_"out"$, so ch-1 - ch-2. We did this with the math function on the oscilloscope. To get a reading for the phase we did phase beween math and ch-2, which is $U_"out"$.
#image("electronics2/images/plot2.4.png")

#pagebreak()

==
#image("electronics2/images/plot2.5a.png", width: 70%)
#image("electronics2/images/plot2.5b.png", width: 70%)
from @resonance we get $omega_0 = 1 / sqrt(L C)$

#pagebreak()

==
#figure(
  image("electronics2/images/square_5kHz.jpg", width: 70%),

  caption: [
    square wave at $approx 5 "kHz"$
  ],
)
#figure(
  image("electronics2/images/square_50kHz.jpg", width: 70%),

  caption: [
    square wave at $approx 50 "kHz"$
  ],
)
#figure(
  image("electronics2/images/triangle_5kHz.jpg", width: 70%),

  caption: [
    triangle wave at $approx 5 "kHz"$
  ],
)
#figure(
  image("electronics2/images/triangle_50kHz.jpg", width: 70%),

  caption: [
    triangle wave at $approx 50 "kHz"$
  ],
)