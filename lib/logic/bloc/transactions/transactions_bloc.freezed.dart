// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionsEvent()';
}


}

/// @nodoc
class $TransactionsEventCopyWith<$Res>  {
$TransactionsEventCopyWith(TransactionsEvent _, $Res Function(TransactionsEvent) __);
}


/// @nodoc


class LoadTransactions implements TransactionsEvent {
  const LoadTransactions();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTransactions);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionsEvent.loadTransactions()';
}


}




/// @nodoc


class SetStartEndDate implements TransactionsEvent {
  const SetStartEndDate({required this.startDate, required this.endDate});
  

 final  DateTime startDate;
 final  DateTime endDate;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetStartEndDateCopyWith<SetStartEndDate> get copyWith => _$SetStartEndDateCopyWithImpl<SetStartEndDate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetStartEndDate&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate);

@override
String toString() {
  return 'TransactionsEvent.setStartEndDate(startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $SetStartEndDateCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $SetStartEndDateCopyWith(SetStartEndDate value, $Res Function(SetStartEndDate) _then) = _$SetStartEndDateCopyWithImpl;
@useResult
$Res call({
 DateTime startDate, DateTime endDate
});




}
/// @nodoc
class _$SetStartEndDateCopyWithImpl<$Res>
    implements $SetStartEndDateCopyWith<$Res> {
  _$SetStartEndDateCopyWithImpl(this._self, this._then);

  final SetStartEndDate _self;
  final $Res Function(SetStartEndDate) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? startDate = null,Object? endDate = null,}) {
  return _then(SetStartEndDate(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class SetSortOrder implements TransactionsEvent {
  const SetSortOrder({required this.sortOrder});
  

 final  SortOrder sortOrder;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetSortOrderCopyWith<SetSortOrder> get copyWith => _$SetSortOrderCopyWithImpl<SetSortOrder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetSortOrder&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}


@override
int get hashCode => Object.hash(runtimeType,sortOrder);

@override
String toString() {
  return 'TransactionsEvent.setSortOrder(sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $SetSortOrderCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $SetSortOrderCopyWith(SetSortOrder value, $Res Function(SetSortOrder) _then) = _$SetSortOrderCopyWithImpl;
@useResult
$Res call({
 SortOrder sortOrder
});




}
/// @nodoc
class _$SetSortOrderCopyWithImpl<$Res>
    implements $SetSortOrderCopyWith<$Res> {
  _$SetSortOrderCopyWithImpl(this._self, this._then);

  final SetSortOrder _self;
  final $Res Function(SetSortOrder) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sortOrder = null,}) {
  return _then(SetSortOrder(
sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as SortOrder,
  ));
}


}

/// @nodoc


class CreateTransaction implements TransactionsEvent {
  const CreateTransaction({required this.transaction});
  

 final  TransactionRequest transaction;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTransactionCopyWith<CreateTransaction> get copyWith => _$CreateTransactionCopyWithImpl<CreateTransaction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransaction&&(identical(other.transaction, transaction) || other.transaction == transaction));
}


@override
int get hashCode => Object.hash(runtimeType,transaction);

@override
String toString() {
  return 'TransactionsEvent.createTransaction(transaction: $transaction)';
}


}

/// @nodoc
abstract mixin class $CreateTransactionCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $CreateTransactionCopyWith(CreateTransaction value, $Res Function(CreateTransaction) _then) = _$CreateTransactionCopyWithImpl;
@useResult
$Res call({
 TransactionRequest transaction
});


$TransactionRequestCopyWith<$Res> get transaction;

}
/// @nodoc
class _$CreateTransactionCopyWithImpl<$Res>
    implements $CreateTransactionCopyWith<$Res> {
  _$CreateTransactionCopyWithImpl(this._self, this._then);

  final CreateTransaction _self;
  final $Res Function(CreateTransaction) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? transaction = null,}) {
  return _then(CreateTransaction(
transaction: null == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as TransactionRequest,
  ));
}

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionRequestCopyWith<$Res> get transaction {
  
  return $TransactionRequestCopyWith<$Res>(_self.transaction, (value) {
    return _then(_self.copyWith(transaction: value));
  });
}
}

/// @nodoc


class EditTransaction implements TransactionsEvent {
  const EditTransaction({required this.id, required this.transaction});
  

 final  int id;
 final  TransactionRequest transaction;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditTransactionCopyWith<EditTransaction> get copyWith => _$EditTransactionCopyWithImpl<EditTransaction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditTransaction&&(identical(other.id, id) || other.id == id)&&(identical(other.transaction, transaction) || other.transaction == transaction));
}


@override
int get hashCode => Object.hash(runtimeType,id,transaction);

@override
String toString() {
  return 'TransactionsEvent.editTransaction(id: $id, transaction: $transaction)';
}


}

/// @nodoc
abstract mixin class $EditTransactionCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $EditTransactionCopyWith(EditTransaction value, $Res Function(EditTransaction) _then) = _$EditTransactionCopyWithImpl;
@useResult
$Res call({
 int id, TransactionRequest transaction
});


$TransactionRequestCopyWith<$Res> get transaction;

}
/// @nodoc
class _$EditTransactionCopyWithImpl<$Res>
    implements $EditTransactionCopyWith<$Res> {
  _$EditTransactionCopyWithImpl(this._self, this._then);

  final EditTransaction _self;
  final $Res Function(EditTransaction) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? transaction = null,}) {
  return _then(EditTransaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transaction: null == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as TransactionRequest,
  ));
}

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionRequestCopyWith<$Res> get transaction {
  
  return $TransactionRequestCopyWith<$Res>(_self.transaction, (value) {
    return _then(_self.copyWith(transaction: value));
  });
}
}

/// @nodoc


class DeleteTransaction implements TransactionsEvent {
  const DeleteTransaction({required this.id});
  

 final  int id;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteTransactionCopyWith<DeleteTransaction> get copyWith => _$DeleteTransactionCopyWithImpl<DeleteTransaction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteTransaction&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TransactionsEvent.deleteTransaction(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteTransactionCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $DeleteTransactionCopyWith(DeleteTransaction value, $Res Function(DeleteTransaction) _then) = _$DeleteTransactionCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$DeleteTransactionCopyWithImpl<$Res>
    implements $DeleteTransactionCopyWith<$Res> {
  _$DeleteTransactionCopyWithImpl(this._self, this._then);

  final DeleteTransaction _self;
  final $Res Function(DeleteTransaction) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteTransaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SyncTransactions implements TransactionsEvent {
  const SyncTransactions();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncTransactions);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionsEvent.syncTransactions()';
}


}




/// @nodoc


class ClearSyncError implements TransactionsEvent {
  const ClearSyncError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearSyncError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionsEvent.clearSyncError()';
}


}




/// @nodoc
mixin _$TransactionsState {

 TransactionsStatus get status; List<Transaction> get transactions; List<Transaction> get transactionsToday; List<DayTransactionsDelta> get transactionsDelta; DateTime get startDate; DateTime get endDate; SortOrder get sortOrder; bool get failedSync; String? get errorMessage; String? get syncErrorMessage; FailedSyncFunction? get failedSyncFunction;
/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsStateCopyWith<TransactionsState> get copyWith => _$TransactionsStateCopyWithImpl<TransactionsState>(this as TransactionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&const DeepCollectionEquality().equals(other.transactionsToday, transactionsToday)&&const DeepCollectionEquality().equals(other.transactionsDelta, transactionsDelta)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.failedSync, failedSync) || other.failedSync == failedSync)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.syncErrorMessage, syncErrorMessage) || other.syncErrorMessage == syncErrorMessage)&&(identical(other.failedSyncFunction, failedSyncFunction) || other.failedSyncFunction == failedSyncFunction));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(transactions),const DeepCollectionEquality().hash(transactionsToday),const DeepCollectionEquality().hash(transactionsDelta),startDate,endDate,sortOrder,failedSync,errorMessage,syncErrorMessage,failedSyncFunction);

@override
String toString() {
  return 'TransactionsState(status: $status, transactions: $transactions, transactionsToday: $transactionsToday, transactionsDelta: $transactionsDelta, startDate: $startDate, endDate: $endDate, sortOrder: $sortOrder, failedSync: $failedSync, errorMessage: $errorMessage, syncErrorMessage: $syncErrorMessage, failedSyncFunction: $failedSyncFunction)';
}


}

/// @nodoc
abstract mixin class $TransactionsStateCopyWith<$Res>  {
  factory $TransactionsStateCopyWith(TransactionsState value, $Res Function(TransactionsState) _then) = _$TransactionsStateCopyWithImpl;
@useResult
$Res call({
 TransactionsStatus status, List<Transaction> transactions, List<Transaction> transactionsToday, List<DayTransactionsDelta> transactionsDelta, DateTime startDate, DateTime endDate, SortOrder sortOrder, bool failedSync, String? errorMessage, String? syncErrorMessage, FailedSyncFunction? failedSyncFunction
});




}
/// @nodoc
class _$TransactionsStateCopyWithImpl<$Res>
    implements $TransactionsStateCopyWith<$Res> {
  _$TransactionsStateCopyWithImpl(this._self, this._then);

  final TransactionsState _self;
  final $Res Function(TransactionsState) _then;

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? transactions = null,Object? transactionsToday = null,Object? transactionsDelta = null,Object? startDate = null,Object? endDate = null,Object? sortOrder = null,Object? failedSync = null,Object? errorMessage = freezed,Object? syncErrorMessage = freezed,Object? failedSyncFunction = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TransactionsStatus,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<Transaction>,transactionsToday: null == transactionsToday ? _self.transactionsToday : transactionsToday // ignore: cast_nullable_to_non_nullable
as List<Transaction>,transactionsDelta: null == transactionsDelta ? _self.transactionsDelta : transactionsDelta // ignore: cast_nullable_to_non_nullable
as List<DayTransactionsDelta>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as SortOrder,failedSync: null == failedSync ? _self.failedSync : failedSync // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,syncErrorMessage: freezed == syncErrorMessage ? _self.syncErrorMessage : syncErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,failedSyncFunction: freezed == failedSyncFunction ? _self.failedSyncFunction : failedSyncFunction // ignore: cast_nullable_to_non_nullable
as FailedSyncFunction?,
  ));
}

}


/// @nodoc


class _TransactionsState extends TransactionsState {
  const _TransactionsState({required this.status, required final  List<Transaction> transactions, required final  List<Transaction> transactionsToday, required final  List<DayTransactionsDelta> transactionsDelta, required this.startDate, required this.endDate, required this.sortOrder, required this.failedSync, this.errorMessage, this.syncErrorMessage, this.failedSyncFunction}): _transactions = transactions,_transactionsToday = transactionsToday,_transactionsDelta = transactionsDelta,super._();
  

@override final  TransactionsStatus status;
 final  List<Transaction> _transactions;
@override List<Transaction> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

 final  List<Transaction> _transactionsToday;
@override List<Transaction> get transactionsToday {
  if (_transactionsToday is EqualUnmodifiableListView) return _transactionsToday;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactionsToday);
}

 final  List<DayTransactionsDelta> _transactionsDelta;
@override List<DayTransactionsDelta> get transactionsDelta {
  if (_transactionsDelta is EqualUnmodifiableListView) return _transactionsDelta;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactionsDelta);
}

@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  SortOrder sortOrder;
@override final  bool failedSync;
@override final  String? errorMessage;
@override final  String? syncErrorMessage;
@override final  FailedSyncFunction? failedSyncFunction;

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionsStateCopyWith<_TransactionsState> get copyWith => __$TransactionsStateCopyWithImpl<_TransactionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&const DeepCollectionEquality().equals(other._transactionsToday, _transactionsToday)&&const DeepCollectionEquality().equals(other._transactionsDelta, _transactionsDelta)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.failedSync, failedSync) || other.failedSync == failedSync)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.syncErrorMessage, syncErrorMessage) || other.syncErrorMessage == syncErrorMessage)&&(identical(other.failedSyncFunction, failedSyncFunction) || other.failedSyncFunction == failedSyncFunction));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_transactions),const DeepCollectionEquality().hash(_transactionsToday),const DeepCollectionEquality().hash(_transactionsDelta),startDate,endDate,sortOrder,failedSync,errorMessage,syncErrorMessage,failedSyncFunction);

@override
String toString() {
  return 'TransactionsState(status: $status, transactions: $transactions, transactionsToday: $transactionsToday, transactionsDelta: $transactionsDelta, startDate: $startDate, endDate: $endDate, sortOrder: $sortOrder, failedSync: $failedSync, errorMessage: $errorMessage, syncErrorMessage: $syncErrorMessage, failedSyncFunction: $failedSyncFunction)';
}


}

/// @nodoc
abstract mixin class _$TransactionsStateCopyWith<$Res> implements $TransactionsStateCopyWith<$Res> {
  factory _$TransactionsStateCopyWith(_TransactionsState value, $Res Function(_TransactionsState) _then) = __$TransactionsStateCopyWithImpl;
@override @useResult
$Res call({
 TransactionsStatus status, List<Transaction> transactions, List<Transaction> transactionsToday, List<DayTransactionsDelta> transactionsDelta, DateTime startDate, DateTime endDate, SortOrder sortOrder, bool failedSync, String? errorMessage, String? syncErrorMessage, FailedSyncFunction? failedSyncFunction
});




}
/// @nodoc
class __$TransactionsStateCopyWithImpl<$Res>
    implements _$TransactionsStateCopyWith<$Res> {
  __$TransactionsStateCopyWithImpl(this._self, this._then);

  final _TransactionsState _self;
  final $Res Function(_TransactionsState) _then;

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? transactions = null,Object? transactionsToday = null,Object? transactionsDelta = null,Object? startDate = null,Object? endDate = null,Object? sortOrder = null,Object? failedSync = null,Object? errorMessage = freezed,Object? syncErrorMessage = freezed,Object? failedSyncFunction = freezed,}) {
  return _then(_TransactionsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TransactionsStatus,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<Transaction>,transactionsToday: null == transactionsToday ? _self._transactionsToday : transactionsToday // ignore: cast_nullable_to_non_nullable
as List<Transaction>,transactionsDelta: null == transactionsDelta ? _self._transactionsDelta : transactionsDelta // ignore: cast_nullable_to_non_nullable
as List<DayTransactionsDelta>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as SortOrder,failedSync: null == failedSync ? _self.failedSync : failedSync // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,syncErrorMessage: freezed == syncErrorMessage ? _self.syncErrorMessage : syncErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,failedSyncFunction: freezed == failedSyncFunction ? _self.failedSyncFunction : failedSyncFunction // ignore: cast_nullable_to_non_nullable
as FailedSyncFunction?,
  ));
}


}

// dart format on
