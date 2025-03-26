// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QuizResponse _$QuizResponseFromJson(Map<String, dynamic> json) {
  return _QuizResponse.fromJson(json);
}

/// @nodoc
mixin _$QuizResponse {
  @JsonKey(name: 'quiz')
  List<QuizItem> get quiz => throw _privateConstructorUsedError;

  /// Serializes this QuizResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizResponseCopyWith<QuizResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizResponseCopyWith<$Res> {
  factory $QuizResponseCopyWith(
    QuizResponse value,
    $Res Function(QuizResponse) then,
  ) = _$QuizResponseCopyWithImpl<$Res, QuizResponse>;
  @useResult
  $Res call({@JsonKey(name: 'quiz') List<QuizItem> quiz});
}

/// @nodoc
class _$QuizResponseCopyWithImpl<$Res, $Val extends QuizResponse>
    implements $QuizResponseCopyWith<$Res> {
  _$QuizResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? quiz = null}) {
    return _then(
      _value.copyWith(
            quiz:
                null == quiz
                    ? _value.quiz
                    : quiz // ignore: cast_nullable_to_non_nullable
                        as List<QuizItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuizResponseImplCopyWith<$Res>
    implements $QuizResponseCopyWith<$Res> {
  factory _$$QuizResponseImplCopyWith(
    _$QuizResponseImpl value,
    $Res Function(_$QuizResponseImpl) then,
  ) = __$$QuizResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'quiz') List<QuizItem> quiz});
}

/// @nodoc
class __$$QuizResponseImplCopyWithImpl<$Res>
    extends _$QuizResponseCopyWithImpl<$Res, _$QuizResponseImpl>
    implements _$$QuizResponseImplCopyWith<$Res> {
  __$$QuizResponseImplCopyWithImpl(
    _$QuizResponseImpl _value,
    $Res Function(_$QuizResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? quiz = null}) {
    return _then(
      _$QuizResponseImpl(
        quiz:
            null == quiz
                ? _value._quiz
                : quiz // ignore: cast_nullable_to_non_nullable
                    as List<QuizItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizResponseImpl implements _QuizResponse {
  const _$QuizResponseImpl({
    @JsonKey(name: 'quiz') required final List<QuizItem> quiz,
  }) : _quiz = quiz;

  factory _$QuizResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizResponseImplFromJson(json);

  final List<QuizItem> _quiz;
  @override
  @JsonKey(name: 'quiz')
  List<QuizItem> get quiz {
    if (_quiz is EqualUnmodifiableListView) return _quiz;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quiz);
  }

  @override
  String toString() {
    return 'QuizResponse(quiz: $quiz)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizResponseImpl &&
            const DeepCollectionEquality().equals(other._quiz, _quiz));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_quiz));

  /// Create a copy of QuizResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizResponseImplCopyWith<_$QuizResponseImpl> get copyWith =>
      __$$QuizResponseImplCopyWithImpl<_$QuizResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizResponseImplToJson(this);
  }
}

abstract class _QuizResponse implements QuizResponse {
  const factory _QuizResponse({
    @JsonKey(name: 'quiz') required final List<QuizItem> quiz,
  }) = _$QuizResponseImpl;

  factory _QuizResponse.fromJson(Map<String, dynamic> json) =
      _$QuizResponseImpl.fromJson;

  @override
  @JsonKey(name: 'quiz')
  List<QuizItem> get quiz;

  /// Create a copy of QuizResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizResponseImplCopyWith<_$QuizResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizItem _$QuizItemFromJson(Map<String, dynamic> json) {
  return _QuizItem.fromJson(json);
}

/// @nodoc
mixin _$QuizItem {
  @JsonKey(name: 'image')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_a')
  String get answerA => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_b')
  String get answerB => throw _privateConstructorUsedError;
  @JsonKey(name: 'right_answer')
  String get rightAnswer => throw _privateConstructorUsedError;

  /// Serializes this QuizItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizItemCopyWith<QuizItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizItemCopyWith<$Res> {
  factory $QuizItemCopyWith(QuizItem value, $Res Function(QuizItem) then) =
      _$QuizItemCopyWithImpl<$Res, QuizItem>;
  @useResult
  $Res call({
    @JsonKey(name: 'image') String image,
    @JsonKey(name: 'answer_a') String answerA,
    @JsonKey(name: 'answer_b') String answerB,
    @JsonKey(name: 'right_answer') String rightAnswer,
  });
}

/// @nodoc
class _$QuizItemCopyWithImpl<$Res, $Val extends QuizItem>
    implements $QuizItemCopyWith<$Res> {
  _$QuizItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? answerA = null,
    Object? answerB = null,
    Object? rightAnswer = null,
  }) {
    return _then(
      _value.copyWith(
            image:
                null == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String,
            answerA:
                null == answerA
                    ? _value.answerA
                    : answerA // ignore: cast_nullable_to_non_nullable
                        as String,
            answerB:
                null == answerB
                    ? _value.answerB
                    : answerB // ignore: cast_nullable_to_non_nullable
                        as String,
            rightAnswer:
                null == rightAnswer
                    ? _value.rightAnswer
                    : rightAnswer // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuizItemImplCopyWith<$Res>
    implements $QuizItemCopyWith<$Res> {
  factory _$$QuizItemImplCopyWith(
    _$QuizItemImpl value,
    $Res Function(_$QuizItemImpl) then,
  ) = __$$QuizItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'image') String image,
    @JsonKey(name: 'answer_a') String answerA,
    @JsonKey(name: 'answer_b') String answerB,
    @JsonKey(name: 'right_answer') String rightAnswer,
  });
}

/// @nodoc
class __$$QuizItemImplCopyWithImpl<$Res>
    extends _$QuizItemCopyWithImpl<$Res, _$QuizItemImpl>
    implements _$$QuizItemImplCopyWith<$Res> {
  __$$QuizItemImplCopyWithImpl(
    _$QuizItemImpl _value,
    $Res Function(_$QuizItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? answerA = null,
    Object? answerB = null,
    Object? rightAnswer = null,
  }) {
    return _then(
      _$QuizItemImpl(
        image:
            null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String,
        answerA:
            null == answerA
                ? _value.answerA
                : answerA // ignore: cast_nullable_to_non_nullable
                    as String,
        answerB:
            null == answerB
                ? _value.answerB
                : answerB // ignore: cast_nullable_to_non_nullable
                    as String,
        rightAnswer:
            null == rightAnswer
                ? _value.rightAnswer
                : rightAnswer // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizItemImpl implements _QuizItem {
  const _$QuizItemImpl({
    @JsonKey(name: 'image') required this.image,
    @JsonKey(name: 'answer_a') required this.answerA,
    @JsonKey(name: 'answer_b') required this.answerB,
    @JsonKey(name: 'right_answer') required this.rightAnswer,
  });

  factory _$QuizItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizItemImplFromJson(json);

  @override
  @JsonKey(name: 'image')
  final String image;
  @override
  @JsonKey(name: 'answer_a')
  final String answerA;
  @override
  @JsonKey(name: 'answer_b')
  final String answerB;
  @override
  @JsonKey(name: 'right_answer')
  final String rightAnswer;

  @override
  String toString() {
    return 'QuizItem(image: $image, answerA: $answerA, answerB: $answerB, rightAnswer: $rightAnswer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizItemImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.answerA, answerA) || other.answerA == answerA) &&
            (identical(other.answerB, answerB) || other.answerB == answerB) &&
            (identical(other.rightAnswer, rightAnswer) ||
                other.rightAnswer == rightAnswer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, image, answerA, answerB, rightAnswer);

  /// Create a copy of QuizItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizItemImplCopyWith<_$QuizItemImpl> get copyWith =>
      __$$QuizItemImplCopyWithImpl<_$QuizItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizItemImplToJson(this);
  }
}

abstract class _QuizItem implements QuizItem {
  const factory _QuizItem({
    @JsonKey(name: 'image') required final String image,
    @JsonKey(name: 'answer_a') required final String answerA,
    @JsonKey(name: 'answer_b') required final String answerB,
    @JsonKey(name: 'right_answer') required final String rightAnswer,
  }) = _$QuizItemImpl;

  factory _QuizItem.fromJson(Map<String, dynamic> json) =
      _$QuizItemImpl.fromJson;

  @override
  @JsonKey(name: 'image')
  String get image;
  @override
  @JsonKey(name: 'answer_a')
  String get answerA;
  @override
  @JsonKey(name: 'answer_b')
  String get answerB;
  @override
  @JsonKey(name: 'right_answer')
  String get rightAnswer;

  /// Create a copy of QuizItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizItemImplCopyWith<_$QuizItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
