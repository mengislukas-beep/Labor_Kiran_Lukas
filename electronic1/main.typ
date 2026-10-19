#import "../style.typ": *

#show: setup
= Einführung
$dots$
= Experimente 

== realisation Ideal
Erwartetet Werte
$
  U = R I
$
$
  U_("out") = U_0 dot R_2/(R_2+R_1) approx 
$

=== Innenwiderstand

$
  R_("tot") = R_1 + (R_2 R_i)/(R_2 + R_i)
$
$
  R_i = (R_1 R_2 U_("out"))/(R_2 (U_0 -U_("out"))-R_1 U_("out"))
$

=== Folgerung

Bei hoch ohmigen Widerständen ok sonst ein Problem falls $R_i approx R_1,R_2$


== Fig 8 / Kompensationschaltung
Für $U_("pot")$ zwischen $R_1, R_2$ und $R_("pot")$ eintzen. $U_("diff")$ zwischen $R_1,R_2$ und *vor* $R("pot")$
\
Ohne Innenwidestand
$
  U_("diff") = U_0 (R_2/(R_1 + R_2) -x)
$
x ist die Zahl wie der potentions meter die sachen aufteilt. Die range ist egal solange man es Ideal betrachtet.
$
  U_("pot") = x dot U_0
$
Beide Spannungen müssen sich genau aufheben das $U_("diff")$ zu 0 geht.

Das ist  eine *Kompensationsschaltung* oder *Brückenschaltung*

== 
Ohne Innenwiderstand
$
  U_(2,3) = U_0(R_2 R_3)/(R_2+R_3)/(R_1 + (R_2 R_3)/(R_2+R_3)) = U_0 (R_2 R_3)/(R_1 (R_2 + R_3) + R_2 R_3)
$
===
+ $
  I_("real") = U_0/(R_1 + R_i + (R_2R_3)/(R_2+R_3))
  $
  $
    => R_i = U_0/I_("real") -R_1 - (R_2R_3)/(R_2+R_3)
  $
+ da es in serie geschten ist so wie der andere Widerstand (wahrscheinlich)
+ Der Therm $U_0/(I_("real"))$ ist Schuld

Der Innenwiderstand des Amperemeters ist im µA-Bereich höher als im mA-Bereich, weil für die Messung kleiner Ströme ein größerer Messwiderstand benötigt wird. Nach dem Ohmschen Gesetz $(R=U/I)$ ergibt sich bei gleicher Messspannung und kleinerem Strom ein größerer Widerstand. Im mA-Bereich wird dagegen ein kleinerer Messwiderstand verwendet.

=== Folgerungen
Bei ähnlichen Widerständen kann der Widerstand des Messinstrumentes nciht vernachlässigt werden.
== Widerstansmessung mit dem Ohmmeter
Übliche Handmultimeter decken für die Widerstandsmessung einen Bereich von 0 Ω bis 40 MΩ ab. Dabei
ist zu beachten ist, dass bei Widerstandswerten unter
1 Ω der Widerstand der Messleitungen ins Gewicht
fallen kann.
\
Wieder es soll nicht in der selben Grössenordnung sein.
== Vierpunktmessung

+ kleine bis sehr kleine Widerstände m$ Omega$ (Metalle)
=== Aufgabe
Literaturwert
$
  rho_("Cu") = 0.017 Omega "mm"^2 slash "m"
$

l ist das Element das man untersuchen möchte.

$
  R = rho dot l/A
$

$
  R_("gemessen") = rho l/A + R_i
$
den R_i berechnene und dann zu $rho$ schliessen

= Grundlagen zum digitalen Speicheroszilloskop (DSO)
= Übungen (DSO)
== Messung des Probe-Comp-Signals
== Mehrkanalmessungen an Dioden_Schaltungen
=== Aufgabe
ch1 sollte man einvollständige sinuswelle sehen bei ch2 nur 
$
  "ch1"(x) = A sin(x)
$
$
  "ch2"(x) = cases(A sin(x) quad & x>0, 0 & x <=0)
$
Durchlassspanung 
$
  U_D = U_("CH1")- U_("CH2")
$
== Differenzmessung
$
  U_D = U_("CH1")- U_("CH2")
$
Math-Funktion damit kann man das darstellen eventuell USB-Stick mitnehmen

=== Aufgabe
+ eifach anschauen $T/2$?
+ math dings machen udn dann irgendwie saven
+ Condensator
+ math dings machen anschauen und sagen "Wow ist das aber cool" *$<-$ ser wichitg*
+ wenn die blaue kurve steigt leitet die diode sonst sperrt sie und es kommt die Spannung aus dem Kondensazot
=== Fragen
+ der Kondensator macht lustige Sachen. Der Kondensator speichert ie Spannung, die Diode leitet erst nach einer gewissen Spannung dadurch gibt der Kondensator wie spannung ab aber zugleich kommt auch weniger Spannung (wegen der abfallenden sinuskruve)
+ stark steigend diode leitet nachher kommt der Kondensator
+ Rippelspannung $
                   U_("ripple") = I_("last")/(f dot C) 
                 $
+ veränderung der Frequenz dann anschauen $dots$

