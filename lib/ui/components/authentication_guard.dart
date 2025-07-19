import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shmr_hw/config/security/authentication_service.dart';
import 'package:shmr_hw/ui/pages/security/pin_page.dart';

class AuthenticationGuard extends StatelessWidget {
  const AuthenticationGuard({required this.child, super.key});

  final Widget child;

  @override
  Widget build(final BuildContext context) => Consumer<AuthenticationService>(
    builder: (final context, final authService, _) {
      if (!authService.isInitialized) {
        // Show loading while initializing
        return MaterialApp(
          home: const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
        );
      }

      if (authService.requiresAuthentication) {
        // Show PIN screen if authentication is required
        return MaterialApp(
          home: PinPage(
            mode: PinScreenMode.verify,
            onSuccess: authService.authenticate,
          ),
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
        );
      }

      // Show main app if authenticated or no PIN is set
      return child;
    },
  );
}
