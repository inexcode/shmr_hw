import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shmr_hw/config/repositories.dart';
import 'package:shmr_hw/logic/models/account.dart';

part 'accounts_event.dart';
part 'accounts_state.dart';
part 'accounts_bloc.freezed.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  AccountsBloc() : super(const AccountsState.initial()) {
    on<LoadAccounts>((final event, final emit) async {
      emit(const AccountsState.loading());
      try {
        final accounts =
            await Repositories().accountsRepository.fetchAccounts();
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

    add(const LoadAccounts());
  }
}
