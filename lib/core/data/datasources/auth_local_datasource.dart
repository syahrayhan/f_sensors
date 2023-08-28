import 'package:flutter_sensor/core/data/datasources/db/database_helper.dart';
import 'package:flutter_sensor/core/data/models/user_table.dart';
import 'package:flutter_sensor/core/helpers/preferences.dart';
import 'package:flutter_sensor/core/utils/exception.dart';

abstract class AuthLocalDataSource {
  Future<UserTable> signInWithEmail(String account, String password);
  Future<String> signOut();
  Future<UserTable> signUp(UserTable user);
}

class AuthLocalDatasourceImpl extends AuthLocalDataSource {
  final DatabaseHelper databaseHelper;
  final Preferences preferences = Preferences();

  AuthLocalDatasourceImpl(this.databaseHelper);

  @override
  Future<UserTable> signInWithEmail(String account, String password) async {
    try {
      final result =
          await databaseHelper.findUserByAccountAndPassword(account, password);
      if (result == null) {
        throw DatabaseException(
          "Account not found or wrong password",
        );
      }

      await preferences.saveString('account', account);
      return UserTable.fromMap(result);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> signOut() async {
    try {
      await preferences.clearAll();
      return "sign out success";
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future<UserTable> signUp(UserTable user) async {
    try {
      final hasDataUser = await databaseHelper.findUserByAccount(user.account!);
      if (hasDataUser != null) {
        throw DatabaseException(
          "Email has been used, please use another email",
        );
      }
      await databaseHelper.insertUser(user);
      return user;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
