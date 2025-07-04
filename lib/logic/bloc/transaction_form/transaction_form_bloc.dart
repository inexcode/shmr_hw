import 'package:bloc/bloc.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shmr_hw/logic/models/transaction.dart';

part 'transaction_form_event.dart';
part 'transaction_form_state.dart';
part 'transaction_form_bloc.freezed.dart';

class TransactionFormBloc
    extends Bloc<TransactionFormEvent, TransactionFormState> {
  TransactionFormBloc({
    required final bool isIncome,
    required final int defaultAccountId,
    final Transaction? initialTransaction,
  }) : super(
         initialTransaction != null
             ? TransactionFormState.editTransaction(
                 id: initialTransaction.id,
                 accountId: initialTransaction.accountId,
                 categoryId: initialTransaction.categoryId,
                 amount: initialTransaction.amount,
                 date: initialTransaction.transactionDate,
                 time: TimeOfDay.fromDateTime(
                   initialTransaction.transactionDate,
                 ),
                 description: initialTransaction.comment,
                 isIncome: isIncome,
               )
             : TransactionFormState.newTransaction(
                 accountId: defaultAccountId,
                 categoryId: null,
                 amount: null,
                 date: null,
                 time: null,
                 description: null,
                 isIncome: isIncome,
               ),
       ) {
    on<SetAccountIdTransactionFormEvent>(_onSetAccountId);
    on<SetCategoryIdTransactionFormEvent>(_onSetCategoryId);
    on<SetAmountTransactionFormEvent>(_onSetAmount);
    on<SetDateTransactionFormEvent>(_onSetDate);
    on<SetTimeTransactionFormEvent>(_onSetTime);
    on<SetDescriptionTransactionFormEvent>(_onSetDescription);
  }

  void _onSetAccountId(
    final SetAccountIdTransactionFormEvent event,
    final Emitter<TransactionFormState> emit,
  ) {
    emit(state.copyWith(accountId: event.accountId));
  }

  void _onSetCategoryId(
    final SetCategoryIdTransactionFormEvent event,
    final Emitter<TransactionFormState> emit,
  ) {
    emit(state.copyWith(categoryId: event.categoryId));
  }

  void _onSetAmount(
    final SetAmountTransactionFormEvent event,
    final Emitter<TransactionFormState> emit,
  ) {
    if (event.amount == null) {
      emit(state.copyWith(amount: null));
      return;
    }
    if (event.amount! > Decimal.zero) {
      emit(state.copyWith(amount: event.amount));
    }
  }

  void _onSetDate(
    final SetDateTransactionFormEvent event,
    final Emitter<TransactionFormState> emit,
  ) {
    if (DateTime(
      event.date.year,
      event.date.month,
      event.date.day,
      state.time?.hour ?? 0,
      state.time?.minute ?? 0,
    ).isAfter(DateTime.now())) {
      emit(state.copyWith(date: null));
      return;
    }
    emit(state.copyWith(date: event.date));
  }

  void _onSetTime(
    final SetTimeTransactionFormEvent event,
    final Emitter<TransactionFormState> emit,
  ) {
    if (state.date != null &&
        DateTime(
          state.date!.year,
          state.date!.month,
          state.date!.day,
          event.time.hour,
          event.time.minute,
        ).isAfter(DateTime.now())) {
      emit(state.copyWith(time: null));
      return;
    }
    emit(state.copyWith(time: event.time));
  }

  void _onSetDescription(
    final SetDescriptionTransactionFormEvent event,
    final Emitter<TransactionFormState> emit,
  ) {
    emit(state.copyWith(description: event.description));
  }
}
