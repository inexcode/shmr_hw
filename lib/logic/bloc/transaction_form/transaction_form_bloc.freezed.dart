// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionFormEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionFormEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionFormEvent()';
}


}

/// @nodoc
class $TransactionFormEventCopyWith<$Res>  {
$TransactionFormEventCopyWith(TransactionFormEvent _, $Res Function(TransactionFormEvent) __);
}


/// @nodoc


class SetAccountIdTransactionFormEvent implements TransactionFormEvent {
  const SetAccountIdTransactionFormEvent({required this.accountId});
  

 final  int accountId;

/// Create a copy of TransactionFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetAccountIdTransactionFormEventCopyWith<SetAccountIdTransactionFormEvent> get copyWith => _$SetAccountIdTransactionFormEventCopyWithImpl<SetAccountIdTransactionFormEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetAccountIdTransactionFormEvent&&(identical(other.accountId, accountId) || other.accountId == accountId));
}


@override
int get hashCode => Object.hash(runtimeType,accountId);

@override
String toString() {
  return 'TransactionFormEvent.setAccountId(accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class $SetAccountIdTransactionFormEventCopyWith<$Res> implements $TransactionFormEventCopyWith<$Res> {
  factory $SetAccountIdTransactionFormEventCopyWith(SetAccountIdTransactionFormEvent value, $Res Function(SetAccountIdTransactionFormEvent) _then) = _$SetAccountIdTransactionFormEventCopyWithImpl;
@useResult
$Res call({
 int accountId
});




}
/// @nodoc
class _$SetAccountIdTransactionFormEventCopyWithImpl<$Res>
    implements $SetAccountIdTransactionFormEventCopyWith<$Res> {
  _$SetAccountIdTransactionFormEventCopyWithImpl(this._self, this._then);

  final SetAccountIdTransactionFormEvent _self;
  final $Res Function(SetAccountIdTransactionFormEvent) _then;

/// Create a copy of TransactionFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accountId = null,}) {
  return _then(SetAccountIdTransactionFormEvent(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SetCategoryIdTransactionFormEvent implements TransactionFormEvent {
  const SetCategoryIdTransactionFormEvent({required this.categoryId});
  

 final  int categoryId;

/// Create a copy of TransactionFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetCategoryIdTransactionFormEventCopyWith<SetCategoryIdTransactionFormEvent> get copyWith => _$SetCategoryIdTransactionFormEventCopyWithImpl<SetCategoryIdTransactionFormEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetCategoryIdTransactionFormEvent&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId);

@override
String toString() {
  return 'TransactionFormEvent.setCategoryId(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $SetCategoryIdTransactionFormEventCopyWith<$Res> implements $TransactionFormEventCopyWith<$Res> {
  factory $SetCategoryIdTransactionFormEventCopyWith(SetCategoryIdTransactionFormEvent value, $Res Function(SetCategoryIdTransactionFormEvent) _then) = _$SetCategoryIdTransactionFormEventCopyWithImpl;
@useResult
$Res call({
 int categoryId
});




}
/// @nodoc
class _$SetCategoryIdTransactionFormEventCopyWithImpl<$Res>
    implements $SetCategoryIdTransactionFormEventCopyWith<$Res> {
  _$SetCategoryIdTransactionFormEventCopyWithImpl(this._self, this._then);

  final SetCategoryIdTransactionFormEvent _self;
  final $Res Function(SetCategoryIdTransactionFormEvent) _then;

/// Create a copy of TransactionFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,}) {
  return _then(SetCategoryIdTransactionFormEvent(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SetAmountTransactionFormEvent implements TransactionFormEvent {
  const SetAmountTransactionFormEvent({required this.amount});
  

 final  Decimal? amount;

/// Create a copy of TransactionFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetAmountTransactionFormEventCopyWith<SetAmountTransactionFormEvent> get copyWith => _$SetAmountTransactionFormEventCopyWithImpl<SetAmountTransactionFormEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetAmountTransactionFormEvent&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'TransactionFormEvent.setAmount(amount: $amount)';
}


}

/// @nodoc
abstract mixin class $SetAmountTransactionFormEventCopyWith<$Res> implements $TransactionFormEventCopyWith<$Res> {
  factory $SetAmountTransactionFormEventCopyWith(SetAmountTransactionFormEvent value, $Res Function(SetAmountTransactionFormEvent) _then) = _$SetAmountTransactionFormEventCopyWithImpl;
@useResult
$Res call({
 Decimal? amount
});




}
/// @nodoc
class _$SetAmountTransactionFormEventCopyWithImpl<$Res>
    implements $SetAmountTransactionFormEventCopyWith<$Res> {
  _$SetAmountTransactionFormEventCopyWithImpl(this._self, this._then);

  final SetAmountTransactionFormEvent _self;
  final $Res Function(SetAmountTransactionFormEvent) _then;

/// Create a copy of TransactionFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amount = freezed,}) {
  return _then(SetAmountTransactionFormEvent(
amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Decimal?,
  ));
}


}

/// @nodoc


class SetDateTransactionFormEvent implements TransactionFormEvent {
  const SetDateTransactionFormEvent({required this.date});
  

 final  DateTime date;

/// Create a copy of TransactionFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetDateTransactionFormEventCopyWith<SetDateTransactionFormEvent> get copyWith => _$SetDateTransactionFormEventCopyWithImpl<SetDateTransactionFormEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetDateTransactionFormEvent&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,date);

@override
String toString() {
  return 'TransactionFormEvent.setDate(date: $date)';
}


}

/// @nodoc
abstract mixin class $SetDateTransactionFormEventCopyWith<$Res> implements $TransactionFormEventCopyWith<$Res> {
  factory $SetDateTransactionFormEventCopyWith(SetDateTransactionFormEvent value, $Res Function(SetDateTransactionFormEvent) _then) = _$SetDateTransactionFormEventCopyWithImpl;
@useResult
$Res call({
 DateTime date
});




}
/// @nodoc
class _$SetDateTransactionFormEventCopyWithImpl<$Res>
    implements $SetDateTransactionFormEventCopyWith<$Res> {
  _$SetDateTransactionFormEventCopyWithImpl(this._self, this._then);

  final SetDateTransactionFormEvent _self;
  final $Res Function(SetDateTransactionFormEvent) _then;

/// Create a copy of TransactionFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = null,}) {
  return _then(SetDateTransactionFormEvent(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class SetTimeTransactionFormEvent implements TransactionFormEvent {
  const SetTimeTransactionFormEvent({required this.time});
  

 final  TimeOfDay time;

/// Create a copy of TransactionFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetTimeTransactionFormEventCopyWith<SetTimeTransactionFormEvent> get copyWith => _$SetTimeTransactionFormEventCopyWithImpl<SetTimeTransactionFormEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetTimeTransactionFormEvent&&(identical(other.time, time) || other.time == time));
}


@override
int get hashCode => Object.hash(runtimeType,time);

@override
String toString() {
  return 'TransactionFormEvent.setTime(time: $time)';
}


}

/// @nodoc
abstract mixin class $SetTimeTransactionFormEventCopyWith<$Res> implements $TransactionFormEventCopyWith<$Res> {
  factory $SetTimeTransactionFormEventCopyWith(SetTimeTransactionFormEvent value, $Res Function(SetTimeTransactionFormEvent) _then) = _$SetTimeTransactionFormEventCopyWithImpl;
@useResult
$Res call({
 TimeOfDay time
});




}
/// @nodoc
class _$SetTimeTransactionFormEventCopyWithImpl<$Res>
    implements $SetTimeTransactionFormEventCopyWith<$Res> {
  _$SetTimeTransactionFormEventCopyWithImpl(this._self, this._then);

  final SetTimeTransactionFormEvent _self;
  final $Res Function(SetTimeTransactionFormEvent) _then;

/// Create a copy of TransactionFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? time = null,}) {
  return _then(SetTimeTransactionFormEvent(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as TimeOfDay,
  ));
}


}

/// @nodoc


class SetDescriptionTransactionFormEvent implements TransactionFormEvent {
  const SetDescriptionTransactionFormEvent({required this.description});
  

 final  String? description;

/// Create a copy of TransactionFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetDescriptionTransactionFormEventCopyWith<SetDescriptionTransactionFormEvent> get copyWith => _$SetDescriptionTransactionFormEventCopyWithImpl<SetDescriptionTransactionFormEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetDescriptionTransactionFormEvent&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,description);

@override
String toString() {
  return 'TransactionFormEvent.setDescription(description: $description)';
}


}

/// @nodoc
abstract mixin class $SetDescriptionTransactionFormEventCopyWith<$Res> implements $TransactionFormEventCopyWith<$Res> {
  factory $SetDescriptionTransactionFormEventCopyWith(SetDescriptionTransactionFormEvent value, $Res Function(SetDescriptionTransactionFormEvent) _then) = _$SetDescriptionTransactionFormEventCopyWithImpl;
@useResult
$Res call({
 String? description
});




}
/// @nodoc
class _$SetDescriptionTransactionFormEventCopyWithImpl<$Res>
    implements $SetDescriptionTransactionFormEventCopyWith<$Res> {
  _$SetDescriptionTransactionFormEventCopyWithImpl(this._self, this._then);

  final SetDescriptionTransactionFormEvent _self;
  final $Res Function(SetDescriptionTransactionFormEvent) _then;

/// Create a copy of TransactionFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? description = freezed,}) {
  return _then(SetDescriptionTransactionFormEvent(
description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$TransactionFormState {

 int get accountId; int? get categoryId; Decimal? get amount; DateTime? get date; TimeOfDay? get time; String? get description; bool get isIncome;
/// Create a copy of TransactionFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionFormStateCopyWith<TransactionFormState> get copyWith => _$TransactionFormStateCopyWithImpl<TransactionFormState>(this as TransactionFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionFormState&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.description, description) || other.description == description)&&(identical(other.isIncome, isIncome) || other.isIncome == isIncome));
}


@override
int get hashCode => Object.hash(runtimeType,accountId,categoryId,amount,date,time,description,isIncome);

@override
String toString() {
  return 'TransactionFormState(accountId: $accountId, categoryId: $categoryId, amount: $amount, date: $date, time: $time, description: $description, isIncome: $isIncome)';
}


}

/// @nodoc
abstract mixin class $TransactionFormStateCopyWith<$Res>  {
  factory $TransactionFormStateCopyWith(TransactionFormState value, $Res Function(TransactionFormState) _then) = _$TransactionFormStateCopyWithImpl;
@useResult
$Res call({
 int accountId, int? categoryId, Decimal? amount, DateTime? date, TimeOfDay? time, String? description, bool isIncome
});




}
/// @nodoc
class _$TransactionFormStateCopyWithImpl<$Res>
    implements $TransactionFormStateCopyWith<$Res> {
  _$TransactionFormStateCopyWithImpl(this._self, this._then);

  final TransactionFormState _self;
  final $Res Function(TransactionFormState) _then;

/// Create a copy of TransactionFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,Object? categoryId = freezed,Object? amount = freezed,Object? date = freezed,Object? time = freezed,Object? description = freezed,Object? isIncome = null,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Decimal?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isIncome: null == isIncome ? _self.isIncome : isIncome // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class NewTransactionFormState extends TransactionFormState {
  const NewTransactionFormState({required this.accountId, required this.categoryId, required this.amount, required this.date, required this.time, required this.description, required this.isIncome}): super._();
  

@override final  int accountId;
@override final  int? categoryId;
@override final  Decimal? amount;
@override final  DateTime? date;
@override final  TimeOfDay? time;
@override final  String? description;
@override final  bool isIncome;

/// Create a copy of TransactionFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewTransactionFormStateCopyWith<NewTransactionFormState> get copyWith => _$NewTransactionFormStateCopyWithImpl<NewTransactionFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewTransactionFormState&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.description, description) || other.description == description)&&(identical(other.isIncome, isIncome) || other.isIncome == isIncome));
}


@override
int get hashCode => Object.hash(runtimeType,accountId,categoryId,amount,date,time,description,isIncome);

@override
String toString() {
  return 'TransactionFormState.newTransaction(accountId: $accountId, categoryId: $categoryId, amount: $amount, date: $date, time: $time, description: $description, isIncome: $isIncome)';
}


}

/// @nodoc
abstract mixin class $NewTransactionFormStateCopyWith<$Res> implements $TransactionFormStateCopyWith<$Res> {
  factory $NewTransactionFormStateCopyWith(NewTransactionFormState value, $Res Function(NewTransactionFormState) _then) = _$NewTransactionFormStateCopyWithImpl;
@override @useResult
$Res call({
 int accountId, int? categoryId, Decimal? amount, DateTime? date, TimeOfDay? time, String? description, bool isIncome
});




}
/// @nodoc
class _$NewTransactionFormStateCopyWithImpl<$Res>
    implements $NewTransactionFormStateCopyWith<$Res> {
  _$NewTransactionFormStateCopyWithImpl(this._self, this._then);

  final NewTransactionFormState _self;
  final $Res Function(NewTransactionFormState) _then;

/// Create a copy of TransactionFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? categoryId = freezed,Object? amount = freezed,Object? date = freezed,Object? time = freezed,Object? description = freezed,Object? isIncome = null,}) {
  return _then(NewTransactionFormState(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Decimal?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isIncome: null == isIncome ? _self.isIncome : isIncome // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class EditTransactionFormState extends TransactionFormState {
  const EditTransactionFormState({required this.id, required this.accountId, required this.categoryId, required this.amount, required this.date, required this.time, required this.description, required this.isIncome}): super._();
  

 final  int id;
@override final  int accountId;
@override final  int? categoryId;
@override final  Decimal? amount;
@override final  DateTime? date;
@override final  TimeOfDay? time;
@override final  String? description;
@override final  bool isIncome;

/// Create a copy of TransactionFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditTransactionFormStateCopyWith<EditTransactionFormState> get copyWith => _$EditTransactionFormStateCopyWithImpl<EditTransactionFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditTransactionFormState&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.description, description) || other.description == description)&&(identical(other.isIncome, isIncome) || other.isIncome == isIncome));
}


@override
int get hashCode => Object.hash(runtimeType,id,accountId,categoryId,amount,date,time,description,isIncome);

@override
String toString() {
  return 'TransactionFormState.editTransaction(id: $id, accountId: $accountId, categoryId: $categoryId, amount: $amount, date: $date, time: $time, description: $description, isIncome: $isIncome)';
}


}

/// @nodoc
abstract mixin class $EditTransactionFormStateCopyWith<$Res> implements $TransactionFormStateCopyWith<$Res> {
  factory $EditTransactionFormStateCopyWith(EditTransactionFormState value, $Res Function(EditTransactionFormState) _then) = _$EditTransactionFormStateCopyWithImpl;
@override @useResult
$Res call({
 int id, int accountId, int? categoryId, Decimal? amount, DateTime? date, TimeOfDay? time, String? description, bool isIncome
});




}
/// @nodoc
class _$EditTransactionFormStateCopyWithImpl<$Res>
    implements $EditTransactionFormStateCopyWith<$Res> {
  _$EditTransactionFormStateCopyWithImpl(this._self, this._then);

  final EditTransactionFormState _self;
  final $Res Function(EditTransactionFormState) _then;

/// Create a copy of TransactionFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? accountId = null,Object? categoryId = freezed,Object? amount = freezed,Object? date = freezed,Object? time = freezed,Object? description = freezed,Object? isIncome = null,}) {
  return _then(EditTransactionFormState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Decimal?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isIncome: null == isIncome ? _self.isIncome : isIncome // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
