// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_point_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuizPointEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Option option, Quiz quiz) checkQuizOption,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Option option, Quiz quiz)? checkQuizOption,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Option option, Quiz quiz)? checkQuizOption,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckQuizOption value) checkQuizOption,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckQuizOption value)? checkQuizOption,
    TResult? Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckQuizOption value)? checkQuizOption,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizPointEventCopyWith<$Res> {
  factory $QuizPointEventCopyWith(
          QuizPointEvent value, $Res Function(QuizPointEvent) then) =
      _$QuizPointEventCopyWithImpl<$Res, QuizPointEvent>;
}

/// @nodoc
class _$QuizPointEventCopyWithImpl<$Res, $Val extends QuizPointEvent>
    implements $QuizPointEventCopyWith<$Res> {
  _$QuizPointEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckQuizOptionImplCopyWith<$Res> {
  factory _$$CheckQuizOptionImplCopyWith(_$CheckQuizOptionImpl value,
          $Res Function(_$CheckQuizOptionImpl) then) =
      __$$CheckQuizOptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Option option, Quiz quiz});

  $OptionCopyWith<$Res> get option;
  $QuizCopyWith<$Res> get quiz;
}

/// @nodoc
class __$$CheckQuizOptionImplCopyWithImpl<$Res>
    extends _$QuizPointEventCopyWithImpl<$Res, _$CheckQuizOptionImpl>
    implements _$$CheckQuizOptionImplCopyWith<$Res> {
  __$$CheckQuizOptionImplCopyWithImpl(
      _$CheckQuizOptionImpl _value, $Res Function(_$CheckQuizOptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? option = null,
    Object? quiz = null,
  }) {
    return _then(_$CheckQuizOptionImpl(
      option: null == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as Option,
      quiz: null == quiz
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as Quiz,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $OptionCopyWith<$Res> get option {
    return $OptionCopyWith<$Res>(_value.option, (value) {
      return _then(_value.copyWith(option: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizCopyWith<$Res> get quiz {
    return $QuizCopyWith<$Res>(_value.quiz, (value) {
      return _then(_value.copyWith(quiz: value));
    });
  }
}

/// @nodoc

class _$CheckQuizOptionImpl implements _CheckQuizOption {
  const _$CheckQuizOptionImpl({required this.option, required this.quiz});

  @override
  final Option option;
  @override
  final Quiz quiz;

  @override
  String toString() {
    return 'QuizPointEvent.checkQuizOption(option: $option, quiz: $quiz)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckQuizOptionImpl &&
            (identical(other.option, option) || other.option == option) &&
            (identical(other.quiz, quiz) || other.quiz == quiz));
  }

  @override
  int get hashCode => Object.hash(runtimeType, option, quiz);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckQuizOptionImplCopyWith<_$CheckQuizOptionImpl> get copyWith =>
      __$$CheckQuizOptionImplCopyWithImpl<_$CheckQuizOptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Option option, Quiz quiz) checkQuizOption,
    required TResult Function() reset,
  }) {
    return checkQuizOption(option, quiz);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Option option, Quiz quiz)? checkQuizOption,
    TResult? Function()? reset,
  }) {
    return checkQuizOption?.call(option, quiz);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Option option, Quiz quiz)? checkQuizOption,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (checkQuizOption != null) {
      return checkQuizOption(option, quiz);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckQuizOption value) checkQuizOption,
    required TResult Function(_Reset value) reset,
  }) {
    return checkQuizOption(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckQuizOption value)? checkQuizOption,
    TResult? Function(_Reset value)? reset,
  }) {
    return checkQuizOption?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckQuizOption value)? checkQuizOption,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (checkQuizOption != null) {
      return checkQuizOption(this);
    }
    return orElse();
  }
}

abstract class _CheckQuizOption implements QuizPointEvent {
  const factory _CheckQuizOption(
      {required final Option option,
      required final Quiz quiz}) = _$CheckQuizOptionImpl;

  Option get option;
  Quiz get quiz;
  @JsonKey(ignore: true)
  _$$CheckQuizOptionImplCopyWith<_$CheckQuizOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$QuizPointEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetImpl implements _Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'QuizPointEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Option option, Quiz quiz) checkQuizOption,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Option option, Quiz quiz)? checkQuizOption,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Option option, Quiz quiz)? checkQuizOption,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckQuizOption value) checkQuizOption,
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckQuizOption value)? checkQuizOption,
    TResult? Function(_Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckQuizOption value)? checkQuizOption,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements QuizPointEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$QuizPointState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int totalPoints, Option currentOption) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int totalPoints, Option currentOption)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int totalPoints, Option currentOption)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizPointStateCopyWith<$Res> {
  factory $QuizPointStateCopyWith(
          QuizPointState value, $Res Function(QuizPointState) then) =
      _$QuizPointStateCopyWithImpl<$Res, QuizPointState>;
}

/// @nodoc
class _$QuizPointStateCopyWithImpl<$Res, $Val extends QuizPointState>
    implements $QuizPointStateCopyWith<$Res> {
  _$QuizPointStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$QuizPointStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'QuizPointState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int totalPoints, Option currentOption) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int totalPoints, Option currentOption)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int totalPoints, Option currentOption)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements QuizPointState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int totalPoints, Option currentOption});

  $OptionCopyWith<$Res> get currentOption;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$QuizPointStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPoints = null,
    Object? currentOption = null,
  }) {
    return _then(_$LoadedImpl(
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      currentOption: null == currentOption
          ? _value.currentOption
          : currentOption // ignore: cast_nullable_to_non_nullable
              as Option,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $OptionCopyWith<$Res> get currentOption {
    return $OptionCopyWith<$Res>(_value.currentOption, (value) {
      return _then(_value.copyWith(currentOption: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required this.totalPoints, required this.currentOption});

  @override
  final int totalPoints;
  @override
  final Option currentOption;

  @override
  String toString() {
    return 'QuizPointState.loaded(totalPoints: $totalPoints, currentOption: $currentOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.currentOption, currentOption) ||
                other.currentOption == currentOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalPoints, currentOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int totalPoints, Option currentOption) loaded,
  }) {
    return loaded(totalPoints, currentOption);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int totalPoints, Option currentOption)? loaded,
  }) {
    return loaded?.call(totalPoints, currentOption);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int totalPoints, Option currentOption)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(totalPoints, currentOption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements QuizPointState {
  const factory _Loaded(
      {required final int totalPoints,
      required final Option currentOption}) = _$LoadedImpl;

  int get totalPoints;
  Option get currentOption;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
