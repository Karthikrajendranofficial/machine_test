// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeatherControllerState {
  Position? get currentLocation => throw _privateConstructorUsedError;
  Future<WeatherResponseModel>? get weatherData =>
      throw _privateConstructorUsedError;

  /// Create a copy of WeatherControllerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherControllerStateCopyWith<WeatherControllerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherControllerStateCopyWith<$Res> {
  factory $WeatherControllerStateCopyWith(WeatherControllerState value,
          $Res Function(WeatherControllerState) then) =
      _$WeatherControllerStateCopyWithImpl<$Res, WeatherControllerState>;
  @useResult
  $Res call(
      {Position? currentLocation, Future<WeatherResponseModel>? weatherData});
}

/// @nodoc
class _$WeatherControllerStateCopyWithImpl<$Res,
        $Val extends WeatherControllerState>
    implements $WeatherControllerStateCopyWith<$Res> {
  _$WeatherControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherControllerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentLocation = freezed,
    Object? weatherData = freezed,
  }) {
    return _then(_value.copyWith(
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as Position?,
      weatherData: freezed == weatherData
          ? _value.weatherData
          : weatherData // ignore: cast_nullable_to_non_nullable
              as Future<WeatherResponseModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherControllerStateImplCopyWith<$Res>
    implements $WeatherControllerStateCopyWith<$Res> {
  factory _$$WeatherControllerStateImplCopyWith(
          _$WeatherControllerStateImpl value,
          $Res Function(_$WeatherControllerStateImpl) then) =
      __$$WeatherControllerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Position? currentLocation, Future<WeatherResponseModel>? weatherData});
}

/// @nodoc
class __$$WeatherControllerStateImplCopyWithImpl<$Res>
    extends _$WeatherControllerStateCopyWithImpl<$Res,
        _$WeatherControllerStateImpl>
    implements _$$WeatherControllerStateImplCopyWith<$Res> {
  __$$WeatherControllerStateImplCopyWithImpl(
      _$WeatherControllerStateImpl _value,
      $Res Function(_$WeatherControllerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherControllerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentLocation = freezed,
    Object? weatherData = freezed,
  }) {
    return _then(_$WeatherControllerStateImpl(
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as Position?,
      weatherData: freezed == weatherData
          ? _value.weatherData
          : weatherData // ignore: cast_nullable_to_non_nullable
              as Future<WeatherResponseModel>?,
    ));
  }
}

/// @nodoc

class _$WeatherControllerStateImpl implements _WeatherControllerState {
  const _$WeatherControllerStateImpl(
      {required this.currentLocation, required this.weatherData});

  @override
  final Position? currentLocation;
  @override
  final Future<WeatherResponseModel>? weatherData;

  @override
  String toString() {
    return 'WeatherControllerState(currentLocation: $currentLocation, weatherData: $weatherData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherControllerStateImpl &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.weatherData, weatherData) ||
                other.weatherData == weatherData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentLocation, weatherData);

  /// Create a copy of WeatherControllerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherControllerStateImplCopyWith<_$WeatherControllerStateImpl>
      get copyWith => __$$WeatherControllerStateImplCopyWithImpl<
          _$WeatherControllerStateImpl>(this, _$identity);
}

abstract class _WeatherControllerState implements WeatherControllerState {
  const factory _WeatherControllerState(
          {required final Position? currentLocation,
          required final Future<WeatherResponseModel>? weatherData}) =
      _$WeatherControllerStateImpl;

  @override
  Position? get currentLocation;
  @override
  Future<WeatherResponseModel>? get weatherData;

  /// Create a copy of WeatherControllerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherControllerStateImplCopyWith<_$WeatherControllerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
