// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'socket_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SocketMessage _$SocketMessageFromJson(Map<String, dynamic> json) {
  return _SocketMessage.fromJson(json);
}

/// @nodoc
mixin _$SocketMessage {
  Data? get data => throw _privateConstructorUsedError;
  String? get action => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SocketMessageCopyWith<SocketMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocketMessageCopyWith<$Res> {
  factory $SocketMessageCopyWith(
          SocketMessage value, $Res Function(SocketMessage) then) =
      _$SocketMessageCopyWithImpl<$Res, SocketMessage>;
  @useResult
  $Res call({Data? data, String? action});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SocketMessageCopyWithImpl<$Res, $Val extends SocketMessage>
    implements $SocketMessageCopyWith<$Res> {
  _$SocketMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SocketMessageCopyWith<$Res>
    implements $SocketMessageCopyWith<$Res> {
  factory _$$_SocketMessageCopyWith(
          _$_SocketMessage value, $Res Function(_$_SocketMessage) then) =
      __$$_SocketMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Data? data, String? action});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_SocketMessageCopyWithImpl<$Res>
    extends _$SocketMessageCopyWithImpl<$Res, _$_SocketMessage>
    implements _$$_SocketMessageCopyWith<$Res> {
  __$$_SocketMessageCopyWithImpl(
      _$_SocketMessage _value, $Res Function(_$_SocketMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? action = freezed,
  }) {
    return _then(_$_SocketMessage(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SocketMessage implements _SocketMessage {
  _$_SocketMessage({this.data, this.action});

  factory _$_SocketMessage.fromJson(Map<String, dynamic> json) =>
      _$$_SocketMessageFromJson(json);

  @override
  final Data? data;
  @override
  final String? action;

  @override
  String toString() {
    return 'SocketMessage(data: $data, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SocketMessage &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SocketMessageCopyWith<_$_SocketMessage> get copyWith =>
      __$$_SocketMessageCopyWithImpl<_$_SocketMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SocketMessageToJson(
      this,
    );
  }
}

abstract class _SocketMessage implements SocketMessage {
  factory _SocketMessage({final Data? data, final String? action}) =
      _$_SocketMessage;

  factory _SocketMessage.fromJson(Map<String, dynamic> json) =
      _$_SocketMessage.fromJson;

  @override
  Data? get data;
  @override
  String? get action;
  @override
  @JsonKey(ignore: true)
  _$$_SocketMessageCopyWith<_$_SocketMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
