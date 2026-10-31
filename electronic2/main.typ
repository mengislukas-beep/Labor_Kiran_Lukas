#import "../style.typ": *

#show: setup
= Peak-Value/ effective values<hier>
$I_0slash U_0$ are the peak values and the $U_("eff")= U_0 slash sqrt(2)$ same for $I_0$ and $I_("eff")$. Effective values allow direct comparison of alternating current and direct current.
= Was eilt was voraus?
Mit *Kondensator*
\
Der Strom eilt der Spannung um $90°$ voraus. (Strom ist nach links verschoben)
\
*Spule*\
Die Spannuang eilt dem Stromum $90°$ voraus. (Spannung ist nach links verschoben)
= Komplexe Wechselstromrechnung

#table(
  columns: 3,
  align: center,
  stroke: .4pt,

  table.header(
    [Bauteil],
    [$Y$],
    [$Z$]
  ),

  [$R$], [$(1)/(R)$], [$R$],
  [$L$], [$(1)/(j omega L)$], [$j omega L$],
  [$C$], [$j omega C$], [$(1)/(j omega C)$],
)

Parallelschaltung: $
Y
=
sum Y_i$

Reihenschaltung: $
Z
=
sum Z_i$

= Hochpas / Tiefpass
+ R C & L R Hochpass  (C L)
+ C R & R L Tiefpass (L C)

= Grenzfrequenz
$
  U_("out")/U_("in") = 1/sqrt(2) approx 0.707
$
-3 dB
\
Das ist die Grenze bei der das Signal deutlich abschwächt.
\
Häuffig auch 
$
  tau = R C 1/(omega_(g r)) = 1/(2 pi f_(g r))
$
= Bandbreite
Serieschaltung. Man legt die untere $omega_u $ und obere $omega_o$ Grenzfrequenz so fest das $1 slash sqrt(2)$- fache des Maximalwertees abgefallen ist. Sozusagen ist es die breite bei der der Strom mind das $1 slash sqrt(2)$ fache Wert von $I_("max")$ hat. Die mitte des $omega$ is immer die Resonazfrequenz.
$
  Delta omega = omega_o - omega_u = R/L slash 1/(C L)
$
= Gütefaktor 
Das Verhältnis zwischen Resonanzfrequenz und Bandbreite
$
  Q = omega_0 /(Delta omega) = cases("serei" => &1/R sqrt(L/C),"Parallel" => & R sqrt(C/L))
$
= Aufgaben

+ @hier 
+ a $
    => U_("out")/U_("in") = 1/(omega C i ( R + 1/(omega C i))) = 1/(i omega R + 1) < 1 => "Tiefpassfilter"
  $
  b $
      U_("out")/U_("in") = (i omega L) /(R + i omega L) = 1/(R/(i omega L) + 1) = 1/(1 - (R i )/(omega L)) >1=> "Hochpassfilter"
    $
+ Freiwillig
= Frequenzabhängige Spannungsteiler und Filter
$
  C = 100 "n F"\
  R = 1 k Omega\
  U_("in") = 1 V\
  f in [10 "kHz", 100 "kHz"]
$
$
  phi = ?\
  U_("out") =?
$


Die funktion als $log(omega)$ Zeichnen

= Roll-off
miest als Dezibel pro Dekade (dB / Dek) oder Dezibel pr Oktave (dB / Okt) angegeben ist die "Steilheit" der Kurve (RLC $approx$ 40 db / Dekade)