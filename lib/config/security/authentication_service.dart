import 'package:flutter/foundation.dart';
import 'package:shmr_hw/config/security/pin_service.dart';

class AuthenticationService extends ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isInitialized = false;

  bool get isAuthenticated => _isAuthenticated;
  bool get isInitialized => _isInitialized;
  bool get requiresAuthentication => _isInitialized && !_isAuthenticated;

  /// Initialize the authentication service and check if PIN is required
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      final isPinSet = await PinService.isPinSet();
      _isAuthenticated = !isPinSet;
      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      debugPrint('Error initializing authentication service: $e');
      _isAuthenticated = true;
      _isInitialized = true;
      notifyListeners();
    }
  }

  /// Mark user as authenticated after successful PIN entry
  void authenticate() {
    _isAuthenticated = true;
    notifyListeners();
  }

  /// Mark user as unauthenticated
  void unauthenticate() {
    _isAuthenticated = false;
    notifyListeners();
  }

  /// Check if PIN is set up
  Future<bool> isPinSet() => PinService.isPinSet();

  /// Check if biometric authentication is available
  Future<bool> isBiometricAvailable() => PinService.isBiometricAvailable();

  /// Check if biometric authentication is enabled
  Future<bool> isBiometricEnabled() => PinService.isBiometricEnabled();

  /// Enable or disable biometric authentication
  Future<void> setBiometricEnabled({required final bool enabled}) async {
    await PinService.setBiometricEnabled(enabled: enabled);
    notifyListeners();
  }

  /// Authenticate using biometrics
  Future<bool> authenticateWithBiometrics({
    required final String localizedFallbackTitle,
    required final String signInTitle,
  }) async {
    final success = await PinService.authenticateWithBiometrics(
      localizedFallbackTitle: localizedFallbackTitle,
      signInTitle: signInTitle,
    );

    if (success) {
      authenticate();
    }

    return success;
  }

  /// Set up a new PIN and authenticate the user
  Future<void> setupPin(final String pin) async {
    await PinService.setPin(pin);
    _isAuthenticated = true;
    notifyListeners();
  }

  /// Remove PIN and authenticate the user
  Future<void> removePin() async {
    await PinService.removePin();
    _isAuthenticated = true;
    notifyListeners();
  }

  /// Reset authentication state (useful for testing or logout)
  void reset() {
    _isAuthenticated = false;
    _isInitialized = false;
    notifyListeners();
  }
}
