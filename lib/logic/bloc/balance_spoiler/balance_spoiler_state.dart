part of 'balance_spoiler_bloc.dart';

@freezed
class BalanceSpoilerState with _$BalanceSpoilerState {
  const factory BalanceSpoilerState.show() = ShowBalanceSpoilerState;
  const factory BalanceSpoilerState.hide() = HideBalanceSpoilerState;
}
