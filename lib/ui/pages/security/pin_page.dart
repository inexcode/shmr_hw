import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:shmr_hw/config/security/authentication_service.dart';
import 'package:shmr_hw/config/security/pin_service.dart';

enum PinScreenMode {
  setup, // Setting up a new PIN
  verify, // Verifying existing PINZ
  confirm, // Confirming new PIN during setup
}

@RoutePage()
class PinPage extends StatefulWidget {
  const PinPage({super.key, this.mode = PinScreenMode.verify, this.onSuccess});

  final PinScreenMode mode;
  final VoidCallback? onSuccess;

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> with TickerProviderStateMixin {
  String _enteredPin = '';
  String _firstPin = '';
  PinScreenMode _currentMode = PinScreenMode.verify;
  bool _isLoading = false;
  String? _errorMessage;
  bool _isBiometricAvailable = false;
  bool _isBiometricEnabled = false;
  List<BiometricType> _availableBiometrics = [];

  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _currentMode = widget.mode;
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _shakeAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.elasticIn),
    );

    if (_currentMode == PinScreenMode.verify) {
      unawaited(_checkBiometricAvailability());
    }
  }

  Future<void> _checkBiometricAvailability() async {
    try {
      final isAvailable = await PinService.isBiometricAvailable();
      final isEnabled = await PinService.isBiometricEnabled();
      final availableBiometrics = await PinService.getAvailableBiometrics();

      if (mounted) {
        setState(() {
          _isBiometricAvailable = isAvailable;
          _isBiometricEnabled = isEnabled;
          _availableBiometrics = availableBiometrics;
        });

        // Auto-trigger biometric authentication if available and enabled
        if (isAvailable && isEnabled && _currentMode == PinScreenMode.verify) {
          await _authenticateWithBiometrics();
        }
      }
    } catch (e) {
      // Silently fail
    }
  }

  Future<void> _authenticateWithBiometrics() async {
    if (!_isBiometricAvailable || !_isBiometricEnabled) {
      return;
    }

    try {
      final authService = context.read<AuthenticationService>();
      final success = await authService.authenticateWithBiometrics(
        localizedFallbackTitle: 'security.biometric.fallback_title'.tr(),
        signInTitle: 'security.biometric.sign_in_title'.tr(),
      );

      if (success && mounted) {
        _showSuccessAndExit();
      }
    } catch (e) {
      // Biometric authentication failed
    }
  }

  IconData _getBiometricIcon() {
    if (_availableBiometrics.contains(BiometricType.face)) {
      return Icons.face;
    } else if (_availableBiometrics.contains(BiometricType.fingerprint)) {
      return Icons.fingerprint;
    } else if (_availableBiometrics.contains(BiometricType.iris)) {
      return Icons.visibility;
    }
    return Icons.fingerprint;
  }

  String get _title {
    switch (_currentMode) {
      case PinScreenMode.setup:
        return 'security.pin.setup_title'.tr();
      case PinScreenMode.confirm:
        return 'security.pin.confirm_title'.tr();
      case PinScreenMode.verify:
        return 'security.pin.enter_title'.tr();
    }
  }

  String get _subtitle {
    switch (_currentMode) {
      case PinScreenMode.setup:
        return 'security.pin.setup_subtitle'.tr();
      case PinScreenMode.confirm:
        return 'security.pin.confirm_subtitle'.tr();
      case PinScreenMode.verify:
        return 'security.pin.enter_subtitle'.tr();
    }
  }

  Future<void> _onNumberPressed(final String number) async {
    if (_enteredPin.length < 4) {
      setState(() {
        _enteredPin += number;
        _errorMessage = null;
      });

      if (_enteredPin.length == 4) {
        await _handlePinComplete();
      }
    }
  }

  void _onBackspacePressed() {
    if (_enteredPin.isNotEmpty) {
      setState(() {
        _enteredPin = _enteredPin.substring(0, _enteredPin.length - 1);
        _errorMessage = null;
      });
    }
  }

  Future<void> _handlePinComplete() async {
    setState(() {
      _isLoading = true;
    });

    try {
      switch (_currentMode) {
        case PinScreenMode.setup:
          _firstPin = _enteredPin;
          setState(() {
            _currentMode = PinScreenMode.confirm;
            _enteredPin = '';
            _isLoading = false;
          });

        case PinScreenMode.confirm:
          if (_enteredPin == _firstPin) {
            await PinService.setPin(_enteredPin);
            _showSuccessAndExit();
          } else {
            await _showError('security.pin.error_mismatch'.tr());
            setState(() {
              _currentMode = PinScreenMode.setup;
              _enteredPin = '';
              _firstPin = '';
            });
          }

        case PinScreenMode.verify:
          final isCorrect = await PinService.verifyPin(_enteredPin);
          if (isCorrect) {
            _showSuccessAndExit();
          } else {
            await _showError('security.pin.error_incorrect'.tr());
          }
      }
    } catch (e) {
      await _showError('security.pin.error_generic'.tr());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _showError(final String message) async {
    setState(() {
      _errorMessage = message;
      _enteredPin = '';
    });
    await _shakeController.forward().then((_) => _shakeController.reset());
  }

  void _showSuccessAndExit() {
    widget.onSuccess?.call();
    if (context.mounted) {
      context.router.pop(true);
    }
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
    backgroundColor: Theme.of(context).colorScheme.surface,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Spacer(),

            _buildHeader(),
            const SizedBox(height: 40),

            AnimatedBuilder(
              animation: _shakeAnimation,
              builder: (final context, final child) => Transform.translate(
                offset: Offset(_shakeAnimation.value, 0),
                child: _buildPinDots(),
              ),
            ),

            if (_errorMessage != null) ...[
              const SizedBox(height: 16),
              Text(
                _errorMessage!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ] else
              const SizedBox(height: 36),

            const Spacer(),
            _buildKeypad(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    ),
  );

  Widget _buildHeader() => Column(
    children: [
      Text(
        _title,
        style: Theme.of(
          context,
        ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 8),
      Text(
        _subtitle,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );

  Widget _buildPinDots() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(4, (final index) {
      final isFilled = index < _enteredPin.length;
      return AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isFilled
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }),
  );

  Widget _buildKeypad() => Column(
    children: [
      for (int row = 0; row < 3; row++)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int col = 1; col <= 3; col++)
                _buildKeypadButton('${row * 3 + col}'),
            ],
          ),
        ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (_currentMode == PinScreenMode.verify) ...[
              _buildBiometricButton(),
            ] else
              const SizedBox(width: 80, height: 80),
            _buildKeypadButton('0'),
            _buildBackspaceButton(),
          ],
        ),
      ),
    ],
  );

  Widget _buildKeypadButton(final String number) => InkWell(
    onTap: _isLoading ? null : () => _onNumberPressed(number),
    borderRadius: BorderRadius.circular(40),
    child: Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
      ),
      child: Center(
        child: Text(
          number,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    ),
  );

  Widget _buildBiometricButton() {
    if (!_isBiometricAvailable || !_isBiometricEnabled) {
      return const SizedBox(width: 80, height: 80);
    }
    return InkWell(
      onTap: _authenticateWithBiometrics,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
          shape: BoxShape.circle,
        ),
        child: Icon(
          _getBiometricIcon(),
          size: 40,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() => InkWell(
    onTap: _isLoading ? null : _onBackspacePressed,
    borderRadius: BorderRadius.circular(40),
    child: Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
      ),
      child: Center(
        child: Icon(
          Icons.backspace_outlined,
          size: 24,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    ),
  );
}
