import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shmr_hw/logic/models/account.dart';
import 'package:shmr_hw/logic/models/enums.dart';
import 'package:shmr_hw/logic/repositories/abstract/accounts.dart';
import 'package:shmr_hw/logic/repositories/drift/accounts.dart';

part 'accounts_event.dart';
part 'accounts_state.dart';
part 'accounts_bloc.freezed.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  AccountsBloc({
    required final AccountsRepository accountsRepository,
    required final DriftAccountsRepository localAccountsRepository,
  }) : _accountsRepository = accountsRepository,
       _localAccountsRepository = localAccountsRepository,
       super(const AccountsState.initial()) {
    on<LoadAccounts>((final event, final emit) async {
      if (state is InitialAccountsState) {
        emit(const AccountsState.loading());
      }
      try {
        final localAccounts = await _localAccountsRepository.fetchAccounts();
        if (localAccounts.isNotEmpty) {
          emit(
            AccountsState.notSelected(accounts: localAccounts, fromCache: true),
          );
        }
        try {
          final accounts = await _accountsRepository.fetchAccounts();

          final localAccountIds = localAccounts
              .map((final acc) => acc.id)
              .toSet();

          final newAccounts = accounts
              .where((final acc) => !localAccountIds.contains(acc.id))
              .toList();

          if (newAccounts.isNotEmpty) {
            await _localAccountsRepository.saveAccounts(accounts: newAccounts);
          }
          final updatedLocalAccounts = localAccounts.map((final acc) {
            final remoteAccount = accounts.firstWhereOrNull(
              (final remoteAcc) => remoteAcc.id == acc.id,
            );
            if (remoteAccount != null) {
              return Account(
                id: acc.id,
                userId: acc.userId,
                name: remoteAccount.name,
                balance: remoteAccount.balance,
                currency: Currency.fromString(remoteAccount.currency).name,
                createdAt: remoteAccount.createdAt,
                updatedAt: remoteAccount.updatedAt,
              );
            }
            return acc;
          }).toList();
          for (final account in updatedLocalAccounts) {
            await _localAccountsRepository.updateAccount(
              id: account.id,
              request: AccountRequest(
                name: account.name,
                currency: account.currency,
                balance: account.balance,
              ),
            );
          }
          emit(AccountsState.notSelected(accounts: accounts, fromCache: false));
        } catch (e) {
          emit(
            AccountsState.notSelected(
              accounts: localAccounts,
              fromCache: true,
              syncErrorMessage: 'Failed to sync transactions: $e',
            ),
          );
        }
      } catch (e) {
        emit(AccountsState.error(errorMessage: e.toString()));
      }
    });
    on<SelectAccount>((final event, final emit) {
      if (state is NotSelectedAccountsState) {
        final currentState = state as NotSelectedAccountsState;
        emit(
          AccountsState.selected(
            selectedAccount: event.account,
            accounts: currentState.accounts,
            isUpdating: false,
          ),
        );
      }
    });
    on<DeselectAccount>((final event, final emit) {
      if (state is SelectedAccountsState) {
        add(const LoadAccounts());
      }
    });
    on<RenameAccount>((final event, final emit) async {
      if (state is SelectedAccountsState) {
        final currentState = state as SelectedAccountsState;
        await _updateAccount(
          AccountRequest(
            name: event.newName,
            currency: currentState.selectedAccount.currency,
            balance: currentState.selectedAccount.balance,
          ),
          emit,
        );
      }
    });
    on<ChangeCurrency>((final event, final emit) async {
      if (state is SelectedAccountsState) {
        final currentState = state as SelectedAccountsState;
        await _updateAccount(
          AccountRequest(
            name: currentState.selectedAccount.name,
            currency: event.newCurrency,
            balance: currentState.selectedAccount.balance,
          ),
          emit,
        );
      }
    });
    on<ClearAccountsSyncError>((final event, final emit) {
      if (state is NotSelectedAccountsState) {
        final currentState = state as NotSelectedAccountsState;
        emit(currentState.copyWith(syncErrorMessage: null));
      }
    });
  }
  final AccountsRepository _accountsRepository;
  final DriftAccountsRepository _localAccountsRepository;

  Future<void> _updateAccount(
    final AccountRequest request,
    final Emitter<AccountsState> emit,
  ) async {
    final currentState = state as SelectedAccountsState;
    emit(currentState.copyWith(isUpdating: true));

    final account = await _accountsRepository.updateAccount(
      id: currentState.selectedAccount.id,
      request: request,
    );

    final updatedAccounts = currentState.accounts
        .map((final acc) => acc.id == account.id ? account : acc)
        .toList();
    emit(
      AccountsState.selected(
        selectedAccount: account,
        accounts: updatedAccounts,
        isUpdating: false,
      ),
    );
  }
}
