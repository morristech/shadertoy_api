import 'package:shadertoy_api/shadertoy_api.dart';
import 'package:shadertoy_api/src/response.dart';
import 'package:test/test.dart';

void main() {
  var genericResponseError1 = ResponseError(
      code: ErrorCode.UNKNOWN,
      message: 'Unknown error',
      context: CONTEXT_SHADER,
      target: 'wtd3zs');

  test('Test a generic response error', () {
    expect(genericResponseError1.code, ErrorCode.UNKNOWN);
    expect(genericResponseError1.message, 'Unknown error');
    expect(genericResponseError1.context, CONTEXT_SHADER);
    expect(genericResponseError1.target, 'wtd3zs');
  });

  test('Create a authentication response error', () {
    var responseError = ResponseError.authentication(
        message: 'Authentication error',
        context: CONTEXT_USER,
        target: 'email@email.com');
    expect(responseError.code, ErrorCode.AUTHENTICATION);
    expect(responseError.message, 'Authentication error');
    expect(responseError.context, CONTEXT_USER);
    expect(responseError.target, 'email@email.com');
  });

  test('Create a authorization response error', () {
    var responseError = ResponseError.authorization(
        message: 'Authorization error',
        context: CONTEXT_USER,
        target: 'email@email.com');
    expect(responseError.code, ErrorCode.AUTHORIZATION);
    expect(responseError.message, 'Authorization error');
    expect(responseError.context, CONTEXT_USER);
    expect(responseError.target, 'email@email.com');
  });

  test('Create a backend timeout response error', () {
    var responseError = ResponseError.backendTimeout(
        message: 'Backend timeout error',
        context: CONTEXT_SHADER,
        target: 'wtd3zs');
    expect(responseError.code, ErrorCode.BACKEND_TIMEOUT);
    expect(responseError.message, 'Backend timeout error');
    expect(responseError.context, CONTEXT_SHADER);
    expect(responseError.target, 'wtd3zs');
  });

  test('Create a backend status response error', () {
    var responseError = ResponseError.backendStatus(
        message: 'Backend status error',
        context: CONTEXT_SHADER,
        target: 'wtd3zs');
    expect(responseError.code, ErrorCode.BACKEND_STATUS);
    expect(responseError.message, 'Backend status error');
    expect(responseError.context, CONTEXT_SHADER);
    expect(responseError.target, 'wtd3zs');
  });

  test('Create a backend response response error', () {
    var responseError = ResponseError.backendResponse(
        message: 'Backend response error',
        context: CONTEXT_SHADER,
        target: 'wtd3zs');
    expect(responseError.code, ErrorCode.BACKEND_RESPONSE);
    expect(responseError.message, 'Backend response error');
    expect(responseError.context, CONTEXT_SHADER);
    expect(responseError.target, 'wtd3zs');
  });

  test('Create a not found response error', () {
    var responseError = ResponseError.notFound(
        message: 'Not found error', context: CONTEXT_SHADER, target: 'wtd3zs');
    expect(responseError.code, ErrorCode.NOT_FOUND);
    expect(responseError.message, 'Not found error');
    expect(responseError.context, CONTEXT_SHADER);
    expect(responseError.target, 'wtd3zs');
  });

  test('Create a aborted response error', () {
    var responseError = ResponseError.aborted(
        message: 'Aborted error', context: CONTEXT_SHADER, target: 'wtd3zs');
    expect(responseError.code, ErrorCode.ABORTED);
    expect(responseError.message, 'Aborted error');
    expect(responseError.context, CONTEXT_SHADER);
    expect(responseError.target, 'wtd3zs');
  });

  var loginResponse1 = LoginResponse(error: null);

  test('Test a login response', () {
    expect(loginResponse1.error, isNull);
  });

  test('Convert a login response to a JSON serializable map and back', () {
    var json = loginResponse1.toJson();
    var loginResponse2 = LoginResponse.fromJson(json);
    expect(loginResponse1, equals(loginResponse2));
  });

  var logoutResponse1 = LogoutResponse(error: null);

  test('Test a logout response', () {
    expect(logoutResponse1.error, isNull);
  });

  test('Convert a logout response to a JSON serializable map and back', () {
    var json = logoutResponse1.toJson();
    var logoutResponse2 = LogoutResponse.fromJson(json);
    expect(logoutResponse1, equals(logoutResponse2));
  });

  var date = DateTime(2000, 1, 1, 0, 0, 0);
  var info = Info(
      id: 'id1',
      date: date,
      views: 1,
      name: 'name1',
      userId: 'userId1',
      description: 'description1',
      likes: 1,
      publishStatus: PublishStatus.public_api,
      flags: 1,
      tags: ['test1'],
      hasLiked: true);
  var sampler = Sampler(
      filter: FilterType.linear,
      wrap: WrapType.clamp,
      vflip: true,
      srgb: true,
      internal: 'internal1');
  var input = Input(
      id: 'id1',
      src: 'src1',
      type: InputType.buffer,
      channel: 1,
      sampler: sampler,
      published: 1);
  var output = Output(id: 'id1', channel: 1);
  var renderPass = RenderPass(
      name: 'name1',
      type: RenderPassType.buffer,
      description: 'description1',
      code: 'code1',
      inputs: [input],
      outputs: [output]);
  var shader = Shader(version: '1', info: info, renderPasses: [renderPass]);
  var findShaderResponse1 = FindShaderResponse(shader: shader, error: null);

  test('Test a find shader response', () {
    expect(findShaderResponse1.shader, shader);
    expect(findShaderResponse1.error, isNull);
  });

  test('Convert a find shader response to a JSON serializable map and back',
      () {
    var json = findShaderResponse1.toJson();
    var findShaderResponse2 = FindShaderResponse.fromJson(json);
    expect(findShaderResponse1, equals(findShaderResponse2));
  });

  var texts = ['comment1', 'comment2'];
  var dates = ['1548620329', '1551293191'];
  var userIds = ['felipunkerito', 'webber'];
  var userPictures = [
    '/img/profile.jpg',
    '/media/users/scratch13764/profile.png'
  ];
  var commentsResponse1 = CommentsResponse(
      texts: texts,
      dates: dates,
      userIds: userIds,
      userPictures: userPictures,
      error: null);

  test('Test a comments response', () {
    expect(commentsResponse1.texts, texts);
    expect(commentsResponse1.dates, dates);
    expect(commentsResponse1.userIds, userIds);
    expect(commentsResponse1.userPictures, userPictures);
    expect(commentsResponse1.error, isNull);
  });

  test('Convert a comments response to a JSON serializable map and back', () {
    var json = commentsResponse1.toJson();
    var commentsResponse2 = CommentsResponse.fromMap(json);
    expect(commentsResponse1, equals(commentsResponse2));
  });

  var memberSince = DateTime(2000, 1, 1, 0, 0, 0);
  var user = User(
      id: 'id1',
      picture: 'picture1',
      memberSince: memberSince,
      shaders: 1,
      comments: 1,
      about: 'about1');
  var findUserResponse1 = FindUserResponse(user: user, error: null);

  test('Test a find user response', () {
    expect(findUserResponse1.user, user);
    expect(findUserResponse1.error, isNull);
  });

  test('Convert a find user response to a JSON serializable map and back', () {
    var json = findUserResponse1.toJson();
    var findUserResponse2 = FindUserResponse.fromJson(json);
    expect(findUserResponse1, equals(findUserResponse2));
  });

  var account = Account(
      name: 'account1',
      type: AccountType.api,
      system: false,
      credentials: 'password1',
      displayName: 'Account1',
      picture: 'Picture1');
  var findAccountResponse1 = FindAccountResponse(account: account, error: null);

  test('Test a find account response', () {
    expect(findAccountResponse1.account, account);
    expect(findAccountResponse1.error, isNull);
  });

  test('Convert a find account response to a JSON serializable map and back',
      () {
    var json = findAccountResponse1.toJson();
    var findAccountResponse2 = FindAccountResponse.fromJson(json);
    expect(findAccountResponse1, equals(findAccountResponse2));
  });

  var accounts = [findAccountResponse1];
  var findAccountsResponse1 =
      FindAccountsResponse(accounts: accounts, error: null);

  test('Test a find accounts response', () {
    expect(findAccountsResponse1.accounts, accounts);
    expect(findAccountsResponse1.error, isNull);
  });

  test('Convert a find accounts response to a JSON serializable map and back',
      () {
    var json = findAccountsResponse1.toJson();
    var findAccountsResponse2 = FindAccountsResponse.fromJson(json);
    expect(findAccountsResponse1, equals(findAccountsResponse2));
  });

  var now = DateTime.now();
  var comment1 = Comment(
      shaderId: 'shaderId1', userId: 'userId1', date: now, text: 'text1');
  var comment2 = Comment(
      shaderId: 'shaderId2', userId: 'userId2', date: now, text: 'text2');
  var comments = [comment1, comment2];
  var findCommentsResponse1 =
      FindCommentsResponse(total: 2, comments: comments, error: null);

  test('Test a find comments response', () {
    expect(findCommentsResponse1.total, 2);
    expect(findCommentsResponse1.comments, comments);
    expect(findCommentsResponse1.error, isNull);
  });

  test('Convert a find comments response to a JSON serializable map and back',
      () {
    var json = findCommentsResponse1.toJson();
    var findCommentsResponse2 = FindCommentsResponse.fromJson(json);
    expect(findCommentsResponse1, equals(findCommentsResponse2));
  });

  var playlist = Playlist(id: 'id1', name: 'name1', count: 1, shaders: ['1']);
  var findPlaylistResponse1 =
      FindPlaylistResponse(playlist: playlist, error: null);

  test('Test a find playlist response', () {
    expect(findPlaylistResponse1.playlist, playlist);
    expect(findPlaylistResponse1.error, isNull);
  });

  test('Convert a find playlist response to a JSON serializable map and back',
      () {
    var json = findPlaylistResponse1.toJson();
    var findPlaylistResponse2 = FindPlaylistResponse.fromJson(json);
    expect(findPlaylistResponse1, equals(findPlaylistResponse2));
  });
}