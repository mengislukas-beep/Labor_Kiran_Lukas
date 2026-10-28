#import "../style.typ": *

#show: setup
= Measurement with the Multimeter
== Internal resistance of  the Voltmeter
Expected value
$
  U = R I => I = U_0 /(R_1 + R_2)
$
$
  U_("out") = R_2 I
$
$
  => U_("out") = U_0 dot R_2/(R_2 + R_1)
$

With internal resitor

$

  1/R_i = 1/R_E - 1/R_2
$
$
  U_0 = I dot R_("tot")
$
$
  I = U_0 /(R_1 + R_E) = U_("out")/(R_E)
$

$
  => R_i = (R_1 R_2 U_("out"))/(R_2 (U_0 - U_("out"))- R_1 U_("out"))
$
== Compensation Circuit
== Internal resistance of the Amperemeter

$
  R_E = R_i + R_3
$
$
  U_0 = I (R_1 + (R_E R_2)/(R_E + R_2))
$
$
  I = I_("meas") (1 + R_E/R_2)
$
$
  => R_i = ((R_2 U_0)/(I_("meas")) - R_1 R_2)/(R_1 + R_2 ) - R_3
$

== Four probe Measurement

= Measurement woth the Oscilloscope
==
==
==
#image("Bilder_electronics/WhatsApp Image 2026-10-21 at 18.19.47 (9).jpeg", width: 60%,)
==
#image("Bilder_electronics/WhatsApp Image 2026-10-21 at 18.19.47 (7).jpeg", width: 60%,)
#image("Bilder_electronics/WhatsApp Image 2026-10-21 at 18.19.47 (4).jpeg", width: 60%,)
==
#image("Bilder_electronics/WhatsApp Image 2026-10-21 at 18.19.32 (2).jpeg", width: 60%,)
