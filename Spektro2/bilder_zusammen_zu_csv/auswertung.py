

# ===================== EINSTELLUNGEN =====================
BILDER_ORDNER = Path(__file__).parent / 'bilder'
K_LISTE_DATEI = Path(__file__).parent / 'k_werte.csv'
AUSGABE = Path(__file__).parent / 'libs_spektrum.csv'

# k-Differenz zwischen ganz links und ganz rechts eines Bildes.
# Vorzeichen beachten: negativ, wenn k nach rechts kleiner wird.
  # BEISPIEL! Mit eurem tatsächlichen Wert ersetzen.

# Hier eure eigene Kalibrierfunktion k -> Wellenlänge in nm einsetzen.


# Optional: Zeilenbereich (relativ zur Bildhöhe) für die Auswertung
ZEILEN_VON = 0.35
ZEILEN_BIS = 0.65
# Zusammenführen auf ein gleichmäßiges nm-Raster
SCHRITT_NM = 0.1
# ========================================================






if __name__ == '__main__':
    main()
