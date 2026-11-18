from pathlib import Path
import numpy as np
import pandas as pd
from PIL import Image

# ===================== EINSTELLUNGEN =====================
BILDER_ORDNER = Path(__file__).parent / 'bilder'
K_LISTE_DATEI = Path(__file__).parent / 'k_werte.csv'
AUSGABE = Path(__file__).parent / 'libs_spektrum.csv'

# k-Differenz zwischen ganz links und ganz rechts eines Bildes.
# Vorzeichen beachten: negativ, wenn k nach rechts kleiner wird.
DELTA_K = 10.0  # BEISPIEL! Mit eurem tatsächlichen Wert ersetzen.

# Hier eure eigene Kalibrierfunktion k -> Wellenlänge in nm einsetzen.
def k_zu_nm(k):
    # BEISPIEL! Nicht als echte Kalibrierung verwenden.
    return k

# Optional: Zeilenbereich (relativ zur Bildhöhe) für die Auswertung
ZEILEN_VON = 0.35
ZEILEN_BIS = 0.65
# Zusammenführen auf ein gleichmäßiges nm-Raster
SCHRITT_NM = 0.1
# ========================================================


def intensitaet_pro_spalte(pfad):
    with Image.open(pfad) as im:
        a = np.asarray(im)
    if a.ndim == 3:
        # Für RGB: Helligkeit aus den drei Kanälen
        a = a[..., :3].astype(np.float64)
        a = 0.2126*a[..., 0] + 0.7152*a[..., 1] + 0.0722*a[..., 2]
    else:
        a = a.astype(np.float64)
    if a.ndim != 2:
        raise ValueError(f'Unerwartete Bildform: {a.shape}')
    h, w = a.shape
    y0 = max(0, min(h-1, int(h*ZEILEN_VON)))
    y1 = max(y0+1, min(h, int(h*ZEILEN_BIS)))
    # Median unterdrückt vereinzelte Hotpixel
    return np.mean(a[y0:y1, :], axis=0)


def main():
    if not BILDER_ORDNER.is_dir():
        raise FileNotFoundError(f'Ordner fehlt: {BILDER_ORDNER}')
    kal = pd.read_csv(K_LISTE_DATEI)
    if not {'datei','k_links'}.issubset(kal.columns):
        raise ValueError('k_werte.csv braucht die Spalten datei,k_links')
    alle = []
    for _, zeile in kal.iterrows():
        pfad = BILDER_ORDNER / str(zeile['datei'])
        if not pfad.exists():
            raise FileNotFoundError(f'Bild fehlt: {pfad}')
        y = intensitaet_pro_spalte(pfad)
        x = np.arange(len(y))
        k = float(zeile['k_links']) + x / max(len(y)-1, 1) * DELTA_K
        nm = np.asarray(k_zu_nm(k), dtype=float)
        if nm.ndim == 0:
            nm = np.full(len(y), nm.item())
        if nm.shape != y.shape or not np.all(np.isfinite(nm)):
            raise ValueError(f'Ungueltige Kalibrierung fuer {pfad.name}')
        # Spektralbereich sortieren und doppelte Wellenlängen vermeiden
        df = pd.DataFrame({'wavelength':nm,'intensity':y})
        df = df.groupby('wavelength', as_index=False).mean().sort_values('wavelength')
        alle.append(df)
        print(f'{pfad.name}: {len(y)} Pixel, {nm.min():.2f} bis {nm.max():.2f} nm')
    if not alle:
        raise ValueError('Keine Bilder in k_werte.csv angegeben')
    lo = min(df.wavelength.min() for df in alle)
    hi = max(df.wavelength.max() for df in alle)
    raster = np.arange(lo, hi + SCHRITT_NM / 2, SCHRITT_NM)
    werte = np.zeros_like(raster)
    anzahl = np.zeros_like(raster)
    for df in alle:
        x = df.wavelength.to_numpy()
        y = df.intensity.to_numpy()
        maske = (raster >= x.min()) & (raster <= x.max())
        if len(x) > 1:
            werte[maske] += np.interp(raster[maske], x, y)
            anzahl[maske] += 1
    gueltig = anzahl > 0
    ergebnis = pd.DataFrame({'wavelength':raster[gueltig],
                             'intensity':werte[gueltig]/anzahl[gueltig]})
    ergebnis.to_csv(AUSGABE, index=False, float_format='%.5f')
    print(f'Fertig: {AUSGABE} ({len(ergebnis)} Datenpunkte)')
    print('Hinweis: Helligkeitsunterschiede zwischen Aufnahmen werden nicht automatisch korrigiert.')

if __name__ == '__main__':
    main()
