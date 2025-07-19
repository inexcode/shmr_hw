import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shmr_hw/config/localization.dart';
import 'package:shmr_hw/config/preferences/language_notifier.dart';
import 'package:shmr_hw/config/preferences/preferences_provider.dart';
import 'package:shmr_hw/config/preferences/shared_preferences_store.dart';
import 'package:shmr_hw/config/preferences/theme_notifier.dart';
import 'package:shmr_hw/config/security/authentication_service.dart';
import 'package:shmr_hw/logic/bloc/accounts/accounts_bloc.dart';
import 'package:shmr_hw/logic/bloc/balance_spoiler/balance_spoiler_bloc.dart';
import 'package:shmr_hw/logic/bloc/categories/categories_bloc.dart';
import 'package:shmr_hw/logic/bloc/transactions/transactions_bloc.dart';
import 'package:shmr_hw/logic/repositories/rest_api/client.dart';
import 'package:shmr_hw/ui/components/authentication_guard.dart';
import 'package:shmr_hw/ui/components/transactions_loading_status.dart';
import 'package:shmr_hw/ui/router/router.dart';
import 'package:shmr_hw/ui/utils/error_dialog_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await EasyLocalization.ensureInitialized();

  // Initialize the worker manager for JSON deserialization
  await RestApiClient.initialize();

  runApp(const Localization(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = RootRouter();
  late final ThemeNotifier _themeNotifier;
  late final AuthenticationService _authenticationService;

  @override
  void initState() {
    super.initState();
    _themeNotifier = ThemeNotifier(SharedPreferencesStore());
    _authenticationService = AuthenticationService();
    unawaited(_authenticationService.initialize());
  }

  @override
  void dispose() {
    // Dispose the worker manager when the app is disposed
    unawaited(RestApiClient.dispose());
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context) => PreferencesProvider(
    preferencesStore: SharedPreferencesStore(),
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>.value(value: _themeNotifier),
        ChangeNotifierProvider<AuthenticationService>.value(
          value: _authenticationService,
        ),
        ChangeNotifierProvider<LanguageNotifier>.value(
          value: LanguageNotifier(
            preferencesStore: SharedPreferencesStore(),
            setDelegateLocale: EasyLocalization.of(context)!.setLocale,
            resetDelegateLocale: EasyLocalization.of(context)!.resetLocale,
            getDelegateLocale: () => EasyLocalization.of(context)!.locale,
            getSupportedLocales: () =>
                EasyLocalization.of(context)!.supportedLocales,
          ),
        ),
      ],
      child: Consumer2<ThemeNotifier, LanguageNotifier>(
        builder:
            (
              final context,
              final themeNotifier,
              final languageNotifier,
              final child,
            ) => AuthenticationGuard(
              child: _ThemeAwareApp(
                appRouter: _appRouter,
                themeMode: themeNotifier.themeMode,
                lightTheme: themeNotifier.lightTheme,
                darkTheme: themeNotifier.darkTheme,
                languageNotifier: languageNotifier,
              ),
            ),
      ),
    ),
  );
}

class _ThemeAwareApp extends StatelessWidget {
  const _ThemeAwareApp({
    required this.appRouter,
    required this.themeMode,
    required this.lightTheme,
    required this.darkTheme,
    required this.languageNotifier,
  });

  final RootRouter appRouter;
  final ThemeMode themeMode;
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final LanguageNotifier languageNotifier;

  @override
  Widget build(final BuildContext context) => BlocProvider(
    create: (final context) => AccountsBloc(),
    child: BlocBuilder<AccountsBloc, AccountsState>(
      builder: (final context, final state) {
        final accountsState = context.watch<AccountsBloc>().state;

        if (accountsState is LoadingAccountsState ||
            accountsState is InitialAccountsState) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            home: const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (accountsState is ErrorAccountsState) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            home: Scaffold(
              body: Center(child: Text('Error: ${accountsState.errorMessage}')),
            ),
          );
        }

        if (accountsState is NotSelectedAccountsState) {
          return MaterialApp(
            title: 'Finance Tracker',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            // A simple placeholder to select an account to use
            home: Scaffold(
              appBar: AppBar(title: const Text('Select account')),
              body: Builder(
                builder: (final context) =>
                    BlocListener<AccountsBloc, AccountsState>(
                      listenWhen: (final previous, final current) =>
                          previous is NotSelectedAccountsState &&
                          current is NotSelectedAccountsState &&
                          previous.syncErrorMessage !=
                              current.syncErrorMessage &&
                          current.syncErrorMessage != null,
                      listener: (final context, final state) {
                        if (state is NotSelectedAccountsState) {
                          if (state.syncErrorMessage != null) {
                            showSyncErrorDialog(
                              context: context,
                              errorMessage: state.syncErrorMessage!,
                              onRetryCallback: () =>
                                  context.read<AccountsBloc>()
                                    ..add(const AccountsEvent.clearSyncError())
                                    ..add(const AccountsEvent.loadAccounts()),
                              onCloseCallback: () {},
                            );
                          }
                        }
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: accountsState.accounts.length,
                              itemBuilder: (final context, final index) {
                                final account = accountsState.accounts[index];
                                return ListTile(
                                  title: Text(
                                    '${account.name} [${account.id}]',
                                  ),
                                  subtitle: Text(
                                    '${account.balance} ${account.currency}',
                                  ),
                                  onTap: () {
                                    context.read<AccountsBloc>().add(
                                      SelectAccount(account: account),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          if (accountsState.fromCache &&
                              accountsState.syncErrorMessage != null)
                            const OfflineModeIndicator(),
                          if (accountsState.fromCache &&
                              accountsState.syncErrorMessage == null)
                            const SynchronizingIndicator(),
                        ],
                      ),
                    ),
              ),
            ),
          );
        }

        if (accountsState is SelectedAccountsState) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<TransactionsBloc>(
                create: (final context) => TransactionsBloc(
                  accountId: accountsState.selectedAccount.id,
                ),
              ),
              BlocProvider<CategoriesBloc>(
                create: (final context) => CategoriesBloc(),
              ),
              BlocProvider<BalanceSpoilerBloc>(
                create: (final context) => BalanceSpoilerBloc(),
              ),
            ],
            child: MaterialApp.router(
              title: 'Finance Tracker',
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeMode,
              routerConfig: appRouter.config(),
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
            ),
          );
        }

        return MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          home: Scaffold(
            body: Center(child: Text('Unexpected state: $accountsState')),
          ),
        );
      },
    ),
  );
}
