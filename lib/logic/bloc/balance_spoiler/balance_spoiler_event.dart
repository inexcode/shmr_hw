part of 'balance_spoiler_bloc.dart';

@freezed
class BalanceSpoilerEvent with _$BalanceSpoilerEvent {
  const factory BalanceSpoilerEvent.show() = ShowBalanceSpoilerEvent;
  const factory BalanceSpoilerEvent.hide() = HideBalanceSpoilerEvent;
  const factory BalanceSpoilerEvent.toggle() = ToggleBalanceSpoilerEvent;
}
