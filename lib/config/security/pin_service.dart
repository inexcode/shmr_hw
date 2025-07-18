// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

class PinService {
  static const _pinKey = 'user_pin';
  static const _biometricEnabledKey = 'biometric_enabled';
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );
  static final _localAuth = LocalAuthentication();

  /// Check if a PIN is set
  static Future<bool> isPinSet() async {
    final pin = await _storage.read(key: _pinKey);
    return pin != null && pin.isNotEmpty;
  }

  /// Set a new PIN
  static Future<void> setPin(final String pin) async {
    if (pin.length != 4 || !RegExp(r'^\d{4}$').hasMatch(pin)) {
      throw ArgumentError('PIN must be exactly 4 digits');
    }
    await _storage.write(key: _pinKey, value: pin);
  }

  /// Verify if the provided PIN is correct
  static Future<bool> verifyPin(final String pin) async {
    final storedPin = await _storage.read(key: _pinKey);
    return storedPin == pin;
  }

  /// Check if biometric authentication is available
  static Future<bool> isBiometricAvailable() async {
    try {
      final isAvailable = await _localAuth.canCheckBiometrics;
      final isDeviceSupported = await _localAuth.isDeviceSupported();
      return isAvailable && isDeviceSupported;
    } catch (e) {
      return false;
    }
  }

  /// Check if biometric authentication is enabled by user
  static Future<bool> isBiometricEnabled() async {
    final enabled = await _storage.read(key: _biometricEnabledKey);
    return enabled == 'true';
  }

  /// Enable or disable biometric authentication
  static Future<void> setBiometricEnabled({required final bool enabled}) async {
    if (enabled && !await isPinSet()) {
      throw StateError(
        'PIN must be set before enabling biometric authentication',
      );
    }
    await _storage.write(key: _biometricEnabledKey, value: enabled.toString());
  }

  static Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _localAuth.getAvailableBiometrics();
    } catch (e) {
      return [];
    }
  }

  static Future<bool> authenticateWithBiometrics({
    required final String localizedFallbackTitle,
    required final String signInTitle,
  }) async {
    try {
      if (!await isBiometricAvailable() || !await isBiometricEnabled()) {
        return false;
      }

      final authenticated = await _localAuth.authenticate(
        options: const AuthenticationOptions(
          biometricOnly: false,
          stickyAuth: true,
        ),
        localizedReason: signInTitle,
      );

      return authenticated;
    } catch (e) {
      return false;
    }
  }

  static Future<void> removePin() async {
    await _storage.delete(key: _pinKey);
    await _storage.delete(key: _biometricEnabledKey);
  }
}
