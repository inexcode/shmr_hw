import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance_spoiler_event.dart';
part 'balance_spoiler_state.dart';
part 'balance_spoiler_bloc.freezed.dart';

class BalanceSpoilerBloc
    extends Bloc<BalanceSpoilerEvent, BalanceSpoilerState> {
  BalanceSpoilerBloc() : super(const BalanceSpoilerState.show()) {
    on<ShowBalanceSpoilerEvent>((final event, final emit) {
      emit(const BalanceSpoilerState.show());
    });
    on<HideBalanceSpoilerEvent>((final event, final emit) {
      emit(const BalanceSpoilerState.hide());
    });
    on<ToggleBalanceSpoilerEvent>((final event, final emit) {
      if (state is ShowBalanceSpoilerState) {
        emit(const BalanceSpoilerState.hide());
      } else {
        emit(const BalanceSpoilerState.show());
      }
    });
  }
}
