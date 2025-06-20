import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shmr_hw/config/repositories.dart';
import 'package:shmr_hw/logic/models/account.dart';

part 'accounts_event.dart';
part 'accounts_state.dart';
part 'accounts_bloc.freezed.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  AccountsBloc() : super(const AccountsState.initial()) {
    on<_LoadAccounts>((final event, final emit) async {
      emit(const AccountsState.loading());
      try {
        final accounts = await Repositories.accountRepository.fetchAccounts();
        emit(AccountsState.notSelected(accounts: accounts));
      } catch (e) {
        emit(AccountsState.error(errorMessage: e.toString()));
      }
    });
    on<_SelectAccount>((final event, final emit) async {
      if (state is _NotSelected) {
        final currentState = state as _NotSelected;
        emit(
          AccountsState.selected(
            selectedAccount: event.account,
            accounts: currentState.accounts,
          ),
        );
      }
    });
    on<_DeselectAccount>((final event, final emit) async {
      if (state is _Selected) {
        final currentState = state as _Selected;
        emit(AccountsState.notSelected(accounts: currentState.accounts));
      }
    });
  }
}
