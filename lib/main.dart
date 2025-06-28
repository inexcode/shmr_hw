import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shmr_hw/config/localization.dart';
import 'package:shmr_hw/logic/bloc/accounts/accounts_bloc.dart';
import 'package:shmr_hw/logic/bloc/balance_spoiler/balance_spoiler_bloc.dart';
import 'package:shmr_hw/logic/bloc/categories/categories_bloc.dart';
import 'package:shmr_hw/logic/bloc/transactions/transactions_bloc.dart';
import 'package:shmr_hw/ui/router/router.dart';
import 'package:shmr_hw/ui/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await EasyLocalization.ensureInitialized();

  runApp(
    const Localization(child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = RootRouter();

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context) => BlocProvider(
        create: (final context) => AccountsBloc(),
        child: BlocBuilder<AccountsBloc, AccountsState>(
          builder: (final context, final state) {
            final accountsState = context.watch<AccountsBloc>().state;

            if (accountsState is LoadingAccountsState ||
                accountsState is InitialAccountsState) {
              return MaterialApp(
                theme: themeData,
                home: const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                ),
              );
            }

            if (accountsState is ErrorAccountsState) {
              return MaterialApp(
                theme: themeData,
                home: Scaffold(
                  body: Center(
                    child: Text('Error: ${accountsState.errorMessage}'),
                  ),
                ),
              );
            }

            if (accountsState is NotSelectedAccountsState) {
              return MaterialApp(
                title: 'Finance Tracker',
                theme: themeData,
                locale: context.locale,
                supportedLocales: context.supportedLocales,
                localizationsDelegates: context.localizationDelegates,
                // A simple placeholder to select an account to use
                builder: (final context, final child) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Select account'),
                  ),
                  body: ListView.builder(
                    itemCount: accountsState.accounts.length,
                    itemBuilder: (final context, final index) {
                      final account = accountsState.accounts[index];
                      return ListTile(
                        title: Text('${account.name} [${account.id}]'),
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
                  theme: themeData,
                  routerConfig: _appRouter.config(),
                  locale: context.locale,
                  supportedLocales: context.supportedLocales,
                  localizationsDelegates: context.localizationDelegates,
                ),
              );
            }

            return MaterialApp(
              theme: themeData,
              home: Scaffold(
                body: Center(
                  child: Text('Unexpected state: $accountsState'),
                ),
              ),
            );
          },
        ),
      );
}
