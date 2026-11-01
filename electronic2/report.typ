#import "../style.typ": *

#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "@preview/cetz:0.4.2"


#show: setup

= Homework
== Peak Value and Effective Value


$I_0$ and $U_0$ are the peak values, representing the highest current and voltage reached during one cycle.

The effective values are given by:

$U_("eff") = U_0 / sqrt(2)$ and $I_("eff") = I_0 / sqrt(2)$.

These effective values allow a direct comparison between alternating current and direct current.
==
Fig. 6.a
$
  U_("out")/U_("in") = 1/(omega C i ( R + 1/(omega C i))) = 1/(i omega R + 1) < 1 => "low-pass-filter"
$
Fig. 6.b
$
   U_("out")/U_("in") = (i omega L) /(R + i omega L) = 1/(R/(i omega L) + 1) = 1/(1 - (R i )/(omega L)) >1=> "high-pass-filter"
$
= Part I - Frequency-dependent voltage divider and filter
In the first experiment we made a Low pass filter with a capacitor as illustrated in @erster. The combination of capacitor (C) and resistor (R) used in the circuit leads to different effects, which we want to observe in this experiment. More specifically, we look at the ration of $U_("out") slash U_("in")$ and make a graphical representation. Then compare the cut-off-frequency and some limit cases. Will talk about what the roll-off is and finally what kind of face shift between $U_("out") "and" U_("in")$ this circuit results in.



#figure(
  align(center)[
    #diagram(
      cell-size: 25mm,

      edge((0,0), (3,0), "*-*"),
      edge((0,1.25), (3,1.25), "*-*"),

      // Leitung oberhalb und unterhalb
      edge((2,0), (2,0.575), "-"),
      edge((2,0.675), (2,1.25), "-"),

      // Kondensatorplatten
      edge((1.7,0.575), (2.3,0.575), "-"),
      edge((1.7,0.675), (2.3,0.675), "-"),
      node((2.4,0.625), text(size: 16pt)[$C$]),

      node((1,0), rect(width: 15mm, height: 6mm, fill: white, stroke: black)),
      node((1,-0.17), text(size: 16pt)[$R$]),

      node((0,0.625), text(size: 16pt)[$U_("in")$]),
      node((3,0.625), text(size: 16pt)[$U_("out")$])
    )
  ],
  caption: [RC circuit],
)<erster>
== Low pass filter
We used 
$
  C = 100 "nF" quadd R = 1 "k"Omega quadd U_("in") approx 1.44 "V"
$
And got the following results:
#figure(
  table(
    columns: 9,
    align: center + horizon,
    inset: (x: 9pt, y: 8pt),
    stroke: 0.4pt + gray.lighten(40%),

    // Wavelengths
    table.cell(fill: rgb("#E8EDF3"))[
      *Ferquency $f$ [Hz]*
    ],
    [10], [100], [500], [1000], [5000], [10000], [50000], [100000],

    // k-values
    table.cell(fill: rgb("#E8EDF3"))[
      *$U_("out")$ [V]*
    ],
    [1.44], [1.44], [1.36], [1.2], [0.44], [0.248], [0.08], [0.06],
    table.cell(fill: rgb("#E8EDF3"))[
      *Phase shift $phi$ [°]*
    ],
    [0], [-3.7], [-17], [-33.5], [-73], [-83], [-89], [-90]
  ),
  

  caption: [
    Measured voltage $U_("out")$ and phase shift between $U_("in")$ and $U_("out")$ for different frequencies
  ],
)<tab:uiup>

With the measured values from @tab:uiup we can make a graphical representation of $U_("out") slash U_("in")$ of $log(f)$. 

#figure(
  image("images/rc_inter.png", width: 60%),
    caption: [The x-axis shows the angular frequency $omega = 2 pi f$ on a logarithmic scale. The y-axis shows the corresponding ratio $U_("out") slash U_("in")$. The dashed  red line is at $1 slash sqrt(2)$. The dashed green line is approximately the intersection between the graph and the dashed red line. ]
)<fig:uiuo>

In @fig:uiuo we can clearly see that up to a certain angular frequency the ration stays at approximately 1 and the drops to 0. 
== Cut-off-frequency
The cut-off-frequency is the frequency where the ratio of $U_("out") slash U_("in")$ is $0 =1/sqrt(2) approx 0.707$ @manuel_skript[p.11].

From @fig:uiuo we can estimate the cut of frequency at around:
$
  log(omega) approx 4 dot log("Hz") => omega approx 10^4 "Hz"
$
The theoretical value is @manuel_skript[p.9]
$
  U_("out")/(U_("in")) = 1/sqrt(omega^2 C^2 R^2 + 1)\
$<formel>
$
  => abs(omega) = 1/abs(R C) = 10^4 "Hz"
$
This is exactly what we measured.
== Limit cases
If $omega << omega_("cutoff")$ the ratio goes to 1 and for $omega>> omega_("cutoff")$ the ratio goes to 0. This implies that only the low frequencies go through the circuit. This is exactly what it means to be a low pass filter.
== Roll-off
The slope in @fig:uiuo equivalent to the "sharpness" of the filter is called the roll off. The roll off is given either in (dB / dec) or decibels per octave. Reading from the @fig:uiuo we get approximately 

$
  &10 -> 100 "Hz" => "roll-off" approx 0.00 "dB" slash "dec" \
  &100 -> 500 "Hz" => "roll-off" approx -0.71 "dB" slash "dec" \
  &500 -> 10^3 "Hz" => "roll-off" approx -3.61 "dB" slash "dec" \
  &10^3 -> 5 dot 10^3 "Hz" => "roll-off" approx -12.47 "dB" slash "dec" \
  &5 dot 10^3 -> 10^4 "Hz" => "roll-off" approx -16.54 "dB" slash "dec" \
  &10^4 -> 5 dot 10^4 "Hz" => "roll-off" approx -14.06 "dB" slash "dec" \
  &5 dot 10^4 -> 10^5 "Hz" => "roll-off" approx -8.30 "dB" slash "dec"
$
== Phase shift between $U_("in")$ and $U_("out")$

With the numbers in @tab:uiup we can plot the phase shift between $U_("in")$ and $U_("out")$.
#figure(
  align()[
  image("images/rc_phase.png",width: 70%),
  caption: [Added the normed phase shift between $U_("in")$ and $U_("out")$ in @fig:uiuo]
  ]
)
From there we can read off the $phi(omega_("cutoff"))$:
$
  phi(omega_("cutoff")) approx -45° = - pi/2 
$
Some other phase shifts are in @tab:uiup.

= Part II 
 $L = 10m H, quadd C = 100n F, quadd R = 1k Omega, quadd U_"in" = 1V quad (2.8V_"pp")$


#image("images/rlc.png", width: 65%)

#figure(
  align(center)[
    #diagram(
      cell-size: 25mm,

      // Horizontale Leitungen
      edge((0,0), (3.5,0), "*-*"),
      edge((0,1.25), (3.5,1.25), "*-*"),

      // Widerstand R
      node((1,0), rect(
        width: 15mm,
        height: 6mm,
        fill: white,
        stroke: black,
      )),
      node((1,-0.2), text(size: 16pt)[$R$]),

      // Spule L
      edge((2,0), (2,0.45), "-"),
      edge((2,0.45), (2,0.8), "-", "coil"),
      edge((2,0.8), (2,1.25), "-"),
      node((1.65,0.625), text(size: 16pt)[$L$]),

      // Kondensator C
      edge((2.8,0), (2.8,0.575), "-"),
      edge((2.8,0.675), (2.8,1.25), "-"),

      // Kondensatorplatten
      edge((2.55,0.575), (3.05,0.575), "-"),
      edge((2.55,0.675), (3.05,0.675), "-"),
      node((3.2,0.625), text(size: 16pt)[$C$]),

      // Spannungsbeschriftungen
      node((0,0.625), text(size: 16pt)[$U_("in")$]),
      node((3.5,0.625), text(size: 16pt)[$U_("out")$])
    )
  ],
  caption: [RLC circuit],
)<rlc-circuit>

==

for the phase shift between U_in and U_out we used math function

we also calculated:
$
  U_"out" / U_"in" = (R^2 (omega C - 1 / (omega L))^2 + 1)^(-1 / 2)
  => omega_0 = 1 / sqrt(C L)
$ <resonance>

==
#image("images/plot2.2.png", width: 70%)
$
  => omega_0 approx 34000 "rad" / s
$

#pagebreak()

==
#image("images/plot2.3.png", width: 90%)

$
  Q_"theory" = R sqrt(C / L) quadd #cite(<manuel_skript>)
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
#image("images/plot2.4.png")

#pagebreak()

==
#image("images/plot2.5a.png", width: 70%)
#image("images/plot2.5b.png", width: 70%)
from @resonance we get $omega_0 = 1 / sqrt(L C)$

#pagebreak()

==
#figure(
  image("images/square_5kHz.jpg", width: 70%),

  caption: [
    square wave at $approx 5 "kHz"$
  ],
)
#figure(
  image("images/square_50kHz.jpg", width: 70%),

  caption: [
    square wave at $approx 50 "kHz"$
  ],
)
#figure(
  image("images/triangle_5kHz.jpg", width: 70%),

  caption: [
    triangle wave at $approx 5 "kHz"$
  ],
)
#figure(
  image("images/triangle_50kHz.jpg", width: 70%),

  caption: [
    triangle wave at $approx 50 "kHz"$
  ],
)

#pagebreak()

#bibliography("source.bib")