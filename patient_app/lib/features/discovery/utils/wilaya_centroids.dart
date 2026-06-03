/// Approximate map centers (chef-lieu) for Algeria's 58 wilayas.
/// Codes match [geo.wilayas] in backend migration 000020 and GET /geo/wilayas.
const Map<String, (double lat, double lng)> kWilayaCentroids = {
  '01': (27.8767, -0.2836), // Adrar
  '02': (36.1650, 1.3347), // Chlef
  '03': (33.8000, 2.8650), // Laghouat
  '04': (35.8750, 7.1136), // Oum El Bouaghi
  '05': (35.5559, 6.1742), // Batna
  '06': (36.7525, 5.0556), // Béjaïa
  '07': (34.8500, 5.7333), // Biskra
  '08': (31.6167, -2.2167), // Béchar
  '09': (36.4700, 2.8277), // Blida
  '10': (36.3747, 3.9000), // Bouira
  '11': (22.7850, 5.5228), // Tamanrasset
  '12': (35.4042, 8.1242), // Tébessa
  '13': (34.8783, -1.3150), // Tlemcen
  '14': (35.3711, 1.3172), // Tiaret
  '15': (36.7167, 4.0500), // Tizi Ouzou
  '16': (36.7538, 3.0588), // Alger
  '17': (34.6728, 3.2500), // Djelfa
  '18': (36.8206, 5.7667), // Jijel
  '19': (36.1900, 5.4100), // Sétif
  '20': (34.8303, 0.1517), // Saïda
  '21': (36.8667, 6.9000), // Skikda
  '22': (35.1939, -0.6414), // Sidi Bel Abbès
  '23': (36.9000, 7.7667), // Annaba
  '24': (36.4628, 7.4258), // Guelma
  '25': (36.3650, 6.6147), // Constantine
  '26': (36.2675, 2.7500), // Médéa
  '27': (35.9311, 0.0892), // Mostaganem
  '28': (35.7058, 4.5419), // M'Sila
  '29': (35.3967, 0.1403), // Mascara
  '30': (31.9493, 5.3250), // Ouargla
  '31': (35.6971, -0.6337), // Oran
  '32': (33.6853, 1.0303), // El Bayadh
  '33': (26.4831, 8.4667), // Illizi
  '34': (36.0731, 4.7611), // Bordj Bou Arréridj
  '35': (36.7667, 3.4772), // Boumerdès
  '36': (36.7672, 8.3136), // El Tarf
  '37': (27.6742, -8.1478), // Tindouf
  '38': (35.6072, 1.8108), // Tissemsilt
  '39': (33.3683, 6.8673), // El Oued
  '40': (35.4167, 7.1333), // Khenchela
  '41': (36.2864, 7.9511), // Souk Ahras
  '42': (36.5897, 2.4472), // Tipaza
  '43': (36.4503, 6.2644), // Mila
  '44': (36.2639, 1.9681), // Aïn Defla
  '45': (33.2667, -0.3167), // Naâma
  '46': (35.2983, -1.1383), // Aïn Témouchent
  '47': (32.4833, 3.6667), // Ghardaïa
  '48': (35.7372, 0.5558), // Relizane
  '49': (29.2581, 0.2306), // Timimoun
  '50': (21.3250, 0.9500), // Bordj Badji Mokhtar
  '51': (34.4333, 5.0667), // Ouled Djellal
  '52': (30.1333, -2.1667), // Béni Abbès
  '53': (27.1972, 2.4833), // In Salah
  '54': (29.3644, 4.7750), // In Guezzam
  '55': (33.1042, 6.0639), // Touggourt
  '56': (24.5542, 9.4847), // Djanet
  '57': (33.9500, 5.9222), // El Meghaier
  '58': (30.5833, 2.8833), // El Meniaa
};

/// Default center when code is missing (Alger).
const (double, double) kDefaultWilayaCentroid = (36.7538, 3.0588);

/// Returns the approximate center for [code] (01–58), or [kDefaultWilayaCentroid].
(double lat, double lng) wilayaCentroid(String? code) {
  if (code == null) return kDefaultWilayaCentroid;
  final normalized = code.trim();
  if (normalized.isEmpty) return kDefaultWilayaCentroid;
  final padded = normalized.padLeft(2, '0');
  return kWilayaCentroids[padded] ?? kDefaultWilayaCentroid;
}
