import '../models/user_model.dart';
import '../utils/hash_helper.dart';
import '../utils/file_helper.dart';

class AuthService {
  static const _userFile = 'user_data.json';

  static Future<bool> cadastrar(UserModel user) async {
    final data = await FileHelper.readJson(_userFile) ?? {};
    if (data.containsKey(user.email)) return false;

    data[user.email] = user.toMap();
    await FileHelper.writeJson(_userFile, data);
    return true;
  }

  static Future<UserModel?> login(String email, String senha) async {
    final data = await FileHelper.readJson(_userFile) ?? {};
    if (!data.containsKey(email)) return null;

    final userData = data[email];
    final hashedPassword = HashHelper.hash(senha);

    if (userData['senha'] != hashedPassword) return null;

    return UserModel.fromMap(userData);
  }
}
