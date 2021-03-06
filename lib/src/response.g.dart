// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    error: const ResponseErrorConverter().fromJson(json['Error'] as String),
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'Error': const ResponseErrorConverter().toJson(instance.error),
    };

LogoutResponse _$LogoutResponseFromJson(Map<String, dynamic> json) {
  return LogoutResponse(
    error: const ResponseErrorConverter().fromJson(json['Error'] as String),
  );
}

Map<String, dynamic> _$LogoutResponseToJson(LogoutResponse instance) =>
    <String, dynamic>{
      'Error': const ResponseErrorConverter().toJson(instance.error),
    };

FindShaderResponse _$FindShaderResponseFromJson(Map<String, dynamic> json) {
  return FindShaderResponse(
    shader: json['Shader'] == null
        ? null
        : Shader.fromJson(json['Shader'] as Map<String, dynamic>),
    error: const ResponseErrorConverter().fromJson(json['Error'] as String),
  );
}

Map<String, dynamic> _$FindShaderResponseToJson(FindShaderResponse instance) =>
    <String, dynamic>{
      'Error': const ResponseErrorConverter().toJson(instance.error),
      'Shader': instance.shader?.toJson(),
    };

CommentsResponse _$CommentsResponseFromJson(Map<String, dynamic> json) {
  return CommentsResponse(
    texts: (json['text'] as List)?.map((e) => e as String)?.toList(),
    dates: (json['date'] as List)?.map((e) => e as String)?.toList(),
    userIds: (json['username'] as List)?.map((e) => e as String)?.toList(),
    userPictures:
        (json['userpicture'] as List)?.map((e) => e as String)?.toList(),
    error: const ResponseErrorConverter().fromJson(json['Error'] as String),
  );
}

Map<String, dynamic> _$CommentsResponseToJson(CommentsResponse instance) =>
    <String, dynamic>{
      'Error': const ResponseErrorConverter().toJson(instance.error),
      'text': instance.texts,
      'date': instance.dates,
      'username': instance.userIds,
      'userpicture': instance.userPictures,
    };

FindUserResponse _$FindUserResponseFromJson(Map<String, dynamic> json) {
  return FindUserResponse(
    user: json['User'] == null
        ? null
        : User.fromJson(json['User'] as Map<String, dynamic>),
    error: const ResponseErrorConverter().fromJson(json['Error'] as String),
  );
}

Map<String, dynamic> _$FindUserResponseToJson(FindUserResponse instance) =>
    <String, dynamic>{
      'Error': const ResponseErrorConverter().toJson(instance.error),
      'User': instance.user?.toJson(),
    };

FindAccountResponse _$FindAccountResponseFromJson(Map<String, dynamic> json) {
  return FindAccountResponse(
    account: json['Account'] == null
        ? null
        : Account.fromJson(json['Account'] as Map<String, dynamic>),
    error: const ResponseErrorConverter().fromJson(json['Error'] as String),
  );
}

Map<String, dynamic> _$FindAccountResponseToJson(
        FindAccountResponse instance) =>
    <String, dynamic>{
      'Error': const ResponseErrorConverter().toJson(instance.error),
      'Account': instance.account?.toJson(),
    };

FindAccountsResponse _$FindAccountsResponseFromJson(Map<String, dynamic> json) {
  return FindAccountsResponse(
    accounts: (json['Accounts'] as List)
        ?.map((e) => e == null
            ? null
            : FindAccountResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    error: const ResponseErrorConverter().fromJson(json['Error'] as String),
  );
}

Map<String, dynamic> _$FindAccountsResponseToJson(
        FindAccountsResponse instance) =>
    <String, dynamic>{
      'Error': const ResponseErrorConverter().toJson(instance.error),
      'Accounts': instance.accounts?.map((e) => e?.toJson())?.toList(),
    };

FindCommentsResponse _$FindCommentsResponseFromJson(Map<String, dynamic> json) {
  return FindCommentsResponse(
    total: json['Comments'] as int,
    comments: (json['Results'] as List)
        ?.map((e) =>
            e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    error: const ResponseErrorConverter().fromJson(json['Error'] as String),
  );
}

Map<String, dynamic> _$FindCommentsResponseToJson(
        FindCommentsResponse instance) =>
    <String, dynamic>{
      'Error': const ResponseErrorConverter().toJson(instance.error),
      'Comments': instance.total,
      'Results': instance.comments?.map((e) => e?.toJson())?.toList(),
    };

FindPlaylistResponse _$FindPlaylistResponseFromJson(Map<String, dynamic> json) {
  return FindPlaylistResponse(
    playlist: json['Playlist'] == null
        ? null
        : Playlist.fromJson(json['Playlist'] as Map<String, dynamic>),
    error: const ResponseErrorConverter().fromJson(json['Error'] as String),
  );
}

Map<String, dynamic> _$FindPlaylistResponseToJson(
        FindPlaylistResponse instance) =>
    <String, dynamic>{
      'Error': const ResponseErrorConverter().toJson(instance.error),
      'Playlist': instance.playlist?.toJson(),
    };

FindShaderIdsResponse _$FindShaderIdsResponseFromJson(
    Map<String, dynamic> json) {
  return FindShaderIdsResponse(
    ids: (json['Results'] as List)?.map((e) => e as String)?.toList(),
    error: const ResponseErrorConverter().fromJson(json['Error'] as String),
  );
}

Map<String, dynamic> _$FindShaderIdsResponseToJson(
        FindShaderIdsResponse instance) =>
    <String, dynamic>{
      'Error': const ResponseErrorConverter().toJson(instance.error),
      'Results': instance.ids,
    };

FindShadersResponse _$FindShadersResponseFromJson(Map<String, dynamic> json) {
  return FindShadersResponse(
    total: json['Shaders'] as int,
    shaders: (json['Results'] as List)
        ?.map((e) => e == null
            ? null
            : FindShaderResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    error: const ResponseErrorConverter().fromJson(json['Error'] as String),
  );
}

Map<String, dynamic> _$FindShadersResponseToJson(
        FindShadersResponse instance) =>
    <String, dynamic>{
      'Error': const ResponseErrorConverter().toJson(instance.error),
      'Shaders': instance.total,
      'Results': instance.shaders?.map((e) => e?.toJson())?.toList(),
    };
