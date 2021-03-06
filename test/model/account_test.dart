import 'package:shadertoy_api/src/model/account.dart';
import 'package:test/test.dart';

void main() {
  test('Create a account', () {
    var account = Account(
        name: 'account1',
        type: AccountType.api,
        system: false,
        credentials: 'password1',
        displayName: 'Account1',
        picture: 'Picture1');
    expect(account.name, 'account1');
    expect(account.type, AccountType.api);
    expect(account.system, false);
    expect(account.credentials, 'password1');
    expect(account.displayName, 'Account1');
    expect(account.picture, 'Picture1');
  });

  test('Create a anonymous account', () {
    var account = Account.anonymous(
        system: false, displayName: 'Account1', picture: 'Picture1');
    expect(account.name, 'anonymous');
    expect(account.type, AccountType.site);
    expect(account.system, false);
    expect(account.credentials, isNull);
    expect(account.displayName, 'Account1');
    expect(account.picture, 'Picture1');
  });

  test('Create a registered account', () {
    var account = Account.registered(
        user: 'account1',
        system: false,
        password: 'password1',
        displayName: 'Account1',
        picture: 'Picture1');
    expect(account.name, 'account1');
    expect(account.type, AccountType.site);
    expect(account.system, false);
    expect(account.credentials, 'password1');
    expect(account.displayName, 'Account1');
    expect(account.picture, 'Picture1');
  });

  test('Create a api account', () {
    var account = Account.api(
        user: 'api1',
        system: false,
        apiKey: 'apiKey1',
        displayName: 'Account1',
        picture: 'Picture1');
    expect(account.name, 'api1');
    expect(account.type, AccountType.api);
    expect(account.system, false);
    expect(account.credentials, 'apiKey1');
    expect(account.displayName, 'Account1');
    expect(account.picture, 'Picture1');
  });

  test('Convert the account to a JSON serializable map and back', () {
    var account1 = Account(
        name: 'account1',
        type: AccountType.api,
        system: false,
        credentials: 'password1',
        displayName: 'Account1',
        picture: 'Picture1');
    var json = account1.toJson();
    var account2 = Account.fromJson(json);
    expect(account1, equals(account2));
  });

  test('Create a account from a json map', () {
    var json = {
      'name': 'account1',
      'type': 'api',
      'system': false,
      'credentials': 'password1',
      'displayName': 'Account1',
      'picture': 'Picture1'
    };

    expect(() => Account.fromJson(json), returnsNormally);
  });

  test('Create a account from a json map with a invalid type', () {
    var json = {
      'name': 'account1',
      'type': 'xx',
      'system': false,
      'credentials': 'password1',
      'displayName': 'Account1',
      'picture': 'Picture1'
    };

    expect(() => Account.fromJson(json), throwsArgumentError);
  });
}
