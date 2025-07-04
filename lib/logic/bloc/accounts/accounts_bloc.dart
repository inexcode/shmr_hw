import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shmr_hw/config/repositories.dart';
import 'package:shmr_hw/logic/models/account.dart';
import 'package:shmr_hw/logic/models/enums.dart';

part 'accounts_event.dart';
part 'accounts_state.dart';
part 'accounts_bloc.freezed.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  AccountsBloc() : super(const AccountsState.initial()) {
    on<LoadAccounts>((final event, final emit) async {
      emit(const AccountsState.loading());
      try {
        final accounts = await Repositories().accountsRepository
            .fetchAccounts();
        emit(AccountsState.notSelected(accounts: accounts));
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
        final currentState = state as SelectedAccountsState;
        emit(AccountsState.notSelected(accounts: currentState.accounts));
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

    add(const LoadAccounts());
  }

  Future<void> _updateAccount(
    final AccountRequest request,
    final Emitter<AccountsState> emit,
  ) async {
    final currentState = state as SelectedAccountsState;
    emit(currentState.copyWith(isUpdating: true));

    final account = await Repositories().accountsRepository.updateAccount(
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
