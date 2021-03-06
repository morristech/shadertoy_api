import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'comment.g.dart';

@JsonSerializable()

/// A shader comment
class Comment extends Equatable {
  @JsonKey(name: 'shaderId')

  /// The shader id of the target Shader
  final String shaderId;

  @JsonKey(name: 'userId')

  /// The user who posted the comment
  final String userId;

  @JsonKey(name: 'date')

  /// The date the comment was posted
  final DateTime date;

  @JsonKey(name: 'text')

  /// The text of the comment
  final String text;

  /// Builds a comment
  ///
  /// [shaderId]: The id of the shader
  /// [userId]: The user id of user that posted the comment
  /// [date]: The date the comment was posted
  /// [text]: The text of the comment
  const Comment(
      {@required this.shaderId,
      @required this.userId,
      @required this.date,
      @required this.text})
      : assert(shaderId != null),
        assert(userId != null),
        assert(date != null),
        assert(text != null);

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List<Object> get props => [shaderId, userId, date, text];

  /// Creates a [Comment] from json map
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  /// Creates a json map from a [Comment]
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
