/// Prototype-only flag (D-P6). Default **off** — enable in prototype config only.
bool anamnesisEnabledFromEnv() {
  const raw = String.fromEnvironment('ANAMNESIS', defaultValue: 'false');
  return raw == 'true' || raw == '1';
}
