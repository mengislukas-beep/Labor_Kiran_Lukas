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

  for i in range(len(absorb_lines_k)):
      if i == 0:
          ax.axvline(lamda(absorb_lines_p[i], absorb_lines_k[i]), linewidth=0.5, color='r', label='absorbtion lines')
      else:
          ax.axvline(lamda(absorb_lines_p[i], absorb_lines_k[i]), linewidth=0.5, color='r')

  print(absorb_lines_p[0], absorb_lines_k[0])

  ax.plot(wavelength[1440 * fromm: 1440 * too], mov_avr_intensity[1440 * fromm: 1440 * too], linestyle='', marker='o', markersize=1)
  ax.set_title('bessere Übergänge', fontsize=18)
  ax.set_xlabel('wavelength [nm]', fontsize=16)
  ax.set_ylabel('intensity [a.u.]', fontsize=16)


```