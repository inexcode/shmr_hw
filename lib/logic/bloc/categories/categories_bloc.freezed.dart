// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoriesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesEvent()';
}


}

/// @nodoc
class $CategoriesEventCopyWith<$Res>  {
$CategoriesEventCopyWith(CategoriesEvent _, $Res Function(CategoriesEvent) __);
}


/// @nodoc


class LoadCategories implements CategoriesEvent {
  const LoadCategories();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadCategories);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesEvent.loadCategories()';
}


}




/// @nodoc
mixin _$CategoriesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState()';
}


}

/// @nodoc
class $CategoriesStateCopyWith<$Res>  {
$CategoriesStateCopyWith(CategoriesState _, $Res Function(CategoriesState) __);
}


/// @nodoc


class InitialCategoriesState implements CategoriesState {
  const InitialCategoriesState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialCategoriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState.initial()';
}


}




/// @nodoc


class LoadingCategoriesState implements CategoriesState {
  const LoadingCategoriesState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingCategoriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState.loading()';
}


}




/// @nodoc


class LoadingWithCacheCategoriesState implements CategoriesState {
  const LoadingWithCacheCategoriesState({required final  Map<int, Category> categories, required this.isFailedToLoad}): _categories = categories;
  

 final  Map<int, Category> _categories;
 Map<int, Category> get categories {
  if (_categories is EqualUnmodifiableMapView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_categories);
}

 final  bool isFailedToLoad;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingWithCacheCategoriesStateCopyWith<LoadingWithCacheCategoriesState> get copyWith => _$LoadingWithCacheCategoriesStateCopyWithImpl<LoadingWithCacheCategoriesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingWithCacheCategoriesState&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.isFailedToLoad, isFailedToLoad) || other.isFailedToLoad == isFailedToLoad));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),isFailedToLoad);

@override
String toString() {
  return 'CategoriesState.loadingWithCache(categories: $categories, isFailedToLoad: $isFailedToLoad)';
}


}

/// @nodoc
abstract mixin class $LoadingWithCacheCategoriesStateCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory $LoadingWithCacheCategoriesStateCopyWith(LoadingWithCacheCategoriesState value, $Res Function(LoadingWithCacheCategoriesState) _then) = _$LoadingWithCacheCategoriesStateCopyWithImpl;
@useResult
$Res call({
 Map<int, Category> categories, bool isFailedToLoad
});




}
/// @nodoc
class _$LoadingWithCacheCategoriesStateCopyWithImpl<$Res>
    implements $LoadingWithCacheCategoriesStateCopyWith<$Res> {
  _$LoadingWithCacheCategoriesStateCopyWithImpl(this._self, this._then);

  final LoadingWithCacheCategoriesState _self;
  final $Res Function(LoadingWithCacheCategoriesState) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? isFailedToLoad = null,}) {
  return _then(LoadingWithCacheCategoriesState(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as Map<int, Category>,isFailedToLoad: null == isFailedToLoad ? _self.isFailedToLoad : isFailedToLoad // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class LoadedCategoriesState implements CategoriesState {
  const LoadedCategoriesState({required final  Map<int, Category> categories}): _categories = categories;
  

 final  Map<int, Category> _categories;
 Map<int, Category> get categories {
  if (_categories is EqualUnmodifiableMapView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_categories);
}


/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCategoriesStateCopyWith<LoadedCategoriesState> get copyWith => _$LoadedCategoriesStateCopyWithImpl<LoadedCategoriesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedCategoriesState&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'CategoriesState.loaded(categories: $categories)';
}


}

/// @nodoc
abstract mixin class $LoadedCategoriesStateCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory $LoadedCategoriesStateCopyWith(LoadedCategoriesState value, $Res Function(LoadedCategoriesState) _then) = _$LoadedCategoriesStateCopyWithImpl;
@useResult
$Res call({
 Map<int, Category> categories
});




}
/// @nodoc
class _$LoadedCategoriesStateCopyWithImpl<$Res>
    implements $LoadedCategoriesStateCopyWith<$Res> {
  _$LoadedCategoriesStateCopyWithImpl(this._self, this._then);

  final LoadedCategoriesState _self;
  final $Res Function(LoadedCategoriesState) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categories = null,}) {
  return _then(LoadedCategoriesState(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as Map<int, Category>,
  ));
}


}

/// @nodoc


class ErrorCategoriesState implements CategoriesState {
  const ErrorCategoriesState({required this.errorMessage, final  Map<int, Category>? categories}): _categories = categories;
  

 final  String errorMessage;
 final  Map<int, Category>? _categories;
 Map<int, Category>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableMapView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCategoriesStateCopyWith<ErrorCategoriesState> get copyWith => _$ErrorCategoriesStateCopyWithImpl<ErrorCategoriesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorCategoriesState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'CategoriesState.error(errorMessage: $errorMessage, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $ErrorCategoriesStateCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory $ErrorCategoriesStateCopyWith(ErrorCategoriesState value, $Res Function(ErrorCategoriesState) _then) = _$ErrorCategoriesStateCopyWithImpl;
@useResult
$Res call({
 String errorMessage, Map<int, Category>? categories
});




}
/// @nodoc
class _$ErrorCategoriesStateCopyWithImpl<$Res>
    implements $ErrorCategoriesStateCopyWith<$Res> {
  _$ErrorCategoriesStateCopyWithImpl(this._self, this._then);

  final ErrorCategoriesState _self;
  final $Res Function(ErrorCategoriesState) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,Object? categories = freezed,}) {
  return _then(ErrorCategoriesState(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as Map<int, Category>?,
  ));
}


}

// dart format on
