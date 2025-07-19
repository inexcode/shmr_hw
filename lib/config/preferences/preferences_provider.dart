import 'package:flutter/material.dart';
import 'package:shmr_hw/config/preferences/preferences_store.dart';

class PreferencesProvider extends InheritedWidget {
  const PreferencesProvider({
    required this.preferencesStore,
    required super.child,
    super.key,
  });

  final PreferencesStore preferencesStore;

  static PreferencesProvider? maybeOf(final BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PreferencesProvider>();

  static PreferencesProvider of(final BuildContext context) {
    final PreferencesProvider? result = maybeOf(context);
    if (result == null) {
      throw FlutterError(
        'No PreferencesProvider found in context. '
        'Make sure to wrap your app with PreferencesProvider.',
      );
    }
    return result;
  }

  static PreferencesStore storeOf(final BuildContext context) =>
      of(context).preferencesStore;

  @override
  bool updateShouldNotify(final PreferencesProvider oldWidget) =>
      preferencesStore != oldWidget.preferencesStore;
}
