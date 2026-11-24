#import "../../style.typ": *

// cSpell:locale en

= Experiment
The experiment consists of calibrating the spectrometer. Then observing the sun specter by pointing the fibre towards the window. The difference between the "pure" sun specter and the specter we receive at the experiment is then the interesting part which we want to analyze a second part. This difference will be seen as dips in the specter which we want to identify, more in @solar_spectre. In a third step we werde given a unknown source and had to identify which atoms this could be. Doing this we want to find the spectre lines of the source and the compare to de specter of different atoms which have already been well documented in the internet.
\
The equipment used for the calibration were the spectrometer with the dial to adjust the angle, a helium lamp from which the spectral lines are well known, a CDD sensor connected to a Laptop to monitor the spectre using the "ThorImageCam" software. The dial has a measurement scale of unit. This value will be referred  to as k-value. By rotating the dial we can change the angle $alpha$ and therefore observe different parts of the specter. On the screen the picture is viewed as 1-dimensional, since this spectrometer splits the light in one dimension. The position on the screen will be referred as pixel position $p in [0 "px"; 1440 "px"]$. On the screen we see whats entering the thorough the split. To see different things we connect this with a fibre which then can be connected with a lamp (ex. Helium) or pointed towards something to capture the incoming light. The set-up is as shown in @setup.  \




#figure(
  image("expermiment.png", width: 80%, height: 25%),

  caption: [
     "(Color online) Schematic sketch of the Czerny–Turner spectrometer
    design. The spectrometer features an entrance slit, an off-center parabolic mirror that collimates the light, a ruled reflective grating that disperses the light,
    and a second off-center parabolic mirror that focuses the light on the CCD
    camera, which is then used to record the measured spectrum. The wavelength of lines visible in the spectrum is determined by the
    angle a of the grating that can be controlled by rotating a dial (not shown)."\
    Source: @manuel_skript[p. 146]
  ],

  
  
)<setup>