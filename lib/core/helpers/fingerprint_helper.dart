import 'package:local_auth/local_auth.dart';

class FingerprintHelper {
  final LocalAuthentication _localAuth = LocalAuthentication();

  FingerprintHelper._();

  static final FingerprintHelper _instance = FingerprintHelper._();

  factory FingerprintHelper() => _instance;

  Future<bool> authenticate() async {
    try {
      bool isFingerprintAvailable = await _localAuth.canCheckBiometrics;
      if (!isFingerprintAvailable) {
        throw Exception('Fingerprint authentication not available.');
      }

      bool isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'Please authenticate using fingerprint.',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
          useErrorDialogs: true,
          sensitiveTransaction: false,
        ),
      );

      return isAuthenticated;
    } catch (e) {
      return false;
    }
  }

  Future<bool> isDeviceSupport() async {
    return await _localAuth.canCheckBiometrics ||
        await _localAuth.isDeviceSupported();
  }
}
