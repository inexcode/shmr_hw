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
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TransactionsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TransactionsEvent()';
  }
}

/// @nodoc
class $TransactionsEventCopyWith<$Res> {
  $TransactionsEventCopyWith(
      TransactionsEvent _, $Res Function(TransactionsEvent) __);
}

/// @nodoc

class _LoadTransactions implements TransactionsEvent {
  const _LoadTransactions();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadTransactions);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TransactionsEvent.loadTransactions()';
  }
}

/// @nodoc

class _SetStartEndDate implements TransactionsEvent {
  const _SetStartEndDate({required this.startDate, required this.endDate});

  final DateTime startDate;
  final DateTime endDate;

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SetStartEndDateCopyWith<_SetStartEndDate> get copyWith =>
      __$SetStartEndDateCopyWithImpl<_SetStartEndDate>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetStartEndDate &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  @override
  String toString() {
    return 'TransactionsEvent.setStartEndDate(startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class _$SetStartEndDateCopyWith<$Res>
    implements $TransactionsEventCopyWith<$Res> {
  factory _$SetStartEndDateCopyWith(
          _SetStartEndDate value, $Res Function(_SetStartEndDate) _then) =
      __$SetStartEndDateCopyWithImpl;
  @useResult
  $Res call({DateTime startDate, DateTime endDate});
}

/// @nodoc
class __$SetStartEndDateCopyWithImpl<$Res>
    implements _$SetStartEndDateCopyWith<$Res> {
  __$SetStartEndDateCopyWithImpl(this._self, this._then);

  final _SetStartEndDate _self;
  final $Res Function(_SetStartEndDate) _then;

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_SetStartEndDate(
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$TransactionsState {
  TransactionsStatus get status;
  List<Transaction> get transactions;
  List<Transaction> get transactionsToday;
  DateTime get startDate;
  DateTime get endDate;
  String? get errorMessage;

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TransactionsStateCopyWith<TransactionsState> get copyWith =>
      _$TransactionsStateCopyWithImpl<TransactionsState>(
          this as TransactionsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransactionsState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.transactions, transactions) &&
            const DeepCollectionEquality()
                .equals(other.transactionsToday, transactionsToday) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(transactions),
      const DeepCollectionEquality().hash(transactionsToday),
      startDate,
      endDate,
      errorMessage);

  @override
  String toString() {
    return 'TransactionsState(status: $status, transactions: $transactions, transactionsToday: $transactionsToday, startDate: $startDate, endDate: $endDate, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $TransactionsStateCopyWith<$Res> {
  factory $TransactionsStateCopyWith(
          TransactionsState value, $Res Function(TransactionsState) _then) =
      _$TransactionsStateCopyWithImpl;
  @useResult
  $Res call(
      {TransactionsStatus status,
      List<Transaction> transactions,
      List<Transaction> transactionsToday,
      DateTime startDate,
      DateTime endDate,
      String? errorMessage});
}

/// @nodoc
class _$TransactionsStateCopyWithImpl<$Res>
    implements $TransactionsStateCopyWith<$Res> {
  _$TransactionsStateCopyWithImpl(this._self, this._then);

  final TransactionsState _self;
  final $Res Function(TransactionsState) _then;

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? transactions = null,
    Object? transactionsToday = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionsStatus,
      transactions: null == transactions
          ? _self.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      transactionsToday: null == transactionsToday
          ? _self.transactionsToday
          : transactionsToday // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _TransactionsState implements TransactionsState {
  const _TransactionsState(
      {required this.status,
      required final List<Transaction> transactions,
      required final List<Transaction> transactionsToday,
      required this.startDate,
      required this.endDate,
      this.errorMessage})
      : _transactions = transactions,
        _transactionsToday = transactionsToday;

  @override
  final TransactionsStatus status;
  final List<Transaction> _transactions;
  @override
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  final List<Transaction> _transactionsToday;
  @override
  List<Transaction> get transactionsToday {
    if (_transactionsToday is EqualUnmodifiableListView)
      return _transactionsToday;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionsToday);
  }

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String? errorMessage;

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TransactionsStateCopyWith<_TransactionsState> get copyWith =>
      __$TransactionsStateCopyWithImpl<_TransactionsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransactionsState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            const DeepCollectionEquality()
                .equals(other._transactionsToday, _transactionsToday) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_transactions),
      const DeepCollectionEquality().hash(_transactionsToday),
      startDate,
      endDate,
      errorMessage);

  @override
  String toString() {
    return 'TransactionsState(status: $status, transactions: $transactions, transactionsToday: $transactionsToday, startDate: $startDate, endDate: $endDate, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$TransactionsStateCopyWith<$Res>
    implements $TransactionsStateCopyWith<$Res> {
  factory _$TransactionsStateCopyWith(
          _TransactionsState value, $Res Function(_TransactionsState) _then) =
      __$TransactionsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {TransactionsStatus status,
      List<Transaction> transactions,
      List<Transaction> transactionsToday,
      DateTime startDate,
      DateTime endDate,
      String? errorMessage});
}

/// @nodoc
class __$TransactionsStateCopyWithImpl<$Res>
    implements _$TransactionsStateCopyWith<$Res> {
  __$TransactionsStateCopyWithImpl(this._self, this._then);

  final _TransactionsState _self;
  final $Res Function(_TransactionsState) _then;

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? transactions = null,
    Object? transactionsToday = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_TransactionsState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionsStatus,
      transactions: null == transactions
          ? _self._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      transactionsToday: null == transactionsToday
          ? _self._transactionsToday
          : transactionsToday // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
