/// Approximate map centers for Algerian wilayas (used when GPS is unavailable).
const Map<String, (double lat, double lng)> kWilayaCentroids = {
  '01': (36.7525, 3.0420), // Alger
  '02': (36.3650, 6.6147), // Chlef
  '16': (36.7538, 3.0588), // Alger (duplicate safeguard)
  '31': (35.6971, -0.6337), // Oran
  '25': (36.1911, 5.4137), // Constantine
  '09': (36.4623, 7.4331), // Blida
  '19': (36.7167, 4.9000), // Sétif
  '23': (36.9000, 7.7667), // Annaba
};

(double lat, double lng) wilayaCentroid(String? code) {
  if (code == null) return (36.7538, 3.0588);
  final padded = code.padLeft(2, '0');
  return kWilayaCentroids[padded] ?? (36.7538, 3.0588);
}
