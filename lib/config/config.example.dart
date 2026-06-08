// Backend Configuration
// DO NOT commit .env.local file - it contains sensitive information
// Copy config.example.dart to config.dart and update with your actual values

const String backendUrl = const String.fromEnvironment(
  'BACKEND_URL',
  defaultValue: 'http://localhost:3000',
);
