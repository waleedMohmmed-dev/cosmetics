import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static const String _tokenKey = 'auth_token';

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(_tokenKey);
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();

    /// remove = delete 1 thinck
    prefs.remove(_tokenKey);
  }

  static Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();

    ///clear = delete all data
    prefs.clear();
  }
}

// import 'package:shared_preferences/shared_preferences.dart';

// class PrefHelper {
//   //  Keys
//   static const String _tokenKey = 'auth_token';
//   static const String _nameKey = 'user_name';
//   static const String _emailKey = 'user_email';
//   static const String _imageKey = 'user_image';
//   static const String _roleKey = 'user_role';

//   //  static للوصول السريع في UI
//   static String? token;
//   static String? name;
//   static String? email;
//   static String? image;
//   static String? role;

//   static Future<void> saveToken(String t) async {
//     token = t;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_tokenKey, t);
//   }

//   static Future<void> saveName(String n) async {
//     name = n;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_nameKey, n);
//   }

//   static Future<void> saveEmail(String e) async {
//     email = e;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_emailKey, e);
//   }

//   static Future<void> saveImage(String i) async {
//     image = i;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_imageKey, i);
//   }

//   static Future<void> saveRole(String r) async {
//     role = r;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_roleKey, r);
//   }

//   static Future<String?> getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     token = prefs.getString(_tokenKey);
//     return token;
//   }

//   static Future<String?> getName() async {
//     final prefs = await SharedPreferences.getInstance();
//     name = prefs.getString(_nameKey);
//     return name;
//   }

//   static Future<String?> getEmail() async {
//     final prefs = await SharedPreferences.getInstance();
//     email = prefs.getString(_emailKey);
//     return email;
//   }

//   static Future<String?> getImage() async {
//     final prefs = await SharedPreferences.getInstance();
//     image = prefs.getString(_imageKey);
//     return image;
//   }

//   static Future<String?> getRole() async {
//     final prefs = await SharedPreferences.getInstance();
//     role = prefs.getString(_roleKey);
//     return role;
//   }

//   static Future<void> clearToken() async {
//     token = null;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_tokenKey);
//   }

//   static Future<void> clearUserData() async {
//     token = null;
//     name = null;
//     email = null;
//     image = null;
//     role = null;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_tokenKey);
//     await prefs.remove(_nameKey);
//     await prefs.remove(_emailKey);
//     await prefs.remove(_imageKey);
//     await prefs.remove(_roleKey);
//   }

//   static Future<void> clearAll() async {
//     token = null;
//     name = null;
//     email = null;
//     image = null;
//     role = null;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//   }

//   // -------------------------------
//   //  Load data عند فتح التطبيق
//   // -------------------------------
//   static Future<void> loadData() async {
//     final prefs = await SharedPreferences.getInstance();
//     token = prefs.getString(_tokenKey);
//     name = prefs.getString(_nameKey);
//     email = prefs.getString(_emailKey);
//     image = prefs.getString(_imageKey);
//     role = prefs.getString(_roleKey);
//   }
// }
