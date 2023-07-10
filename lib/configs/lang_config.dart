import 'package:get/get.dart';

class LanguageConfig extends Translations {
  var timeHoure = DateTime.now().hour;

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'create_an_account': 'Create an account',
          'email': 'Email',
          'password': 'Password',
          'username': 'Username',
          'termOfsService': 'By signing up,I understand and agree to',
          'term&service': 'Term of Service',
          'haveAccount': 'I already have an account',
          //
          'welcome_back': 'Welcome back',
          'login': 'Login',
          'noAccount': 'I don\'t have an account',
          'greating': getGreeting()[0],
          //
          'settings': 'Settings',
          'SaveChanges': 'Save Changes',
          'selected_langauge': 'selected language',
          'language': 'Language',
          'logout': 'Logout'
        },
        'si_LK': {
          'create_an_account': 'ගිණුමක් තනන්න',
          'email': 'විද්යුත් තැපෑල',
          'password': 'මුරපදය',
          'username': 'පරිශීලක නාමය',
          'termOfsService': 'ලියාපදිංචි වීමෙන්, මම තේරුම් ගෙන එකඟ වෙමි',
          'term&service': 'සේවා කොන්දේසි',
          'haveAccount': 'මට දැනටමත් ගිණුමක් තියෙනවා',
          //
          'welcome_back': 'ආපසු සාදරයෙන් පිළිගනිමු',
          'login': 'ඇතුල් වන්න',
          'noAccount': 'මට ගිණුමක් නැත',
          'greating': getGreeting()[1],
          //
          'settings': 'සැකසුම්',
          'SaveChanges': 'වෙනස්කම් සුරකින්න',
          'selected_langauge': 'තෝරාගත් භාෂාව',
          'language': 'භාෂාව',
          'logout': 'පිටවීම'
        }
      };
}

List<String> getGreeting() {
  var timeHoure = DateTime.now().hour;
  String greetingEN;
  String greetingSI;
  if (timeHoure < 12) {
    greetingEN = 'Good Morning';
    greetingSI = 'සුභ උදෑසනක්';
  } else if (timeHoure < 16) {
    greetingEN = 'Good Afternoon';
    greetingSI = 'සුභ දහවල්ක්';
  } else if (timeHoure < 22) {
    greetingEN = 'Good Evening';
    greetingSI = 'සුභ සන්ද්යාවක්';
  } else {
    greetingEN = 'Good Night';
    greetingSI = 'සුභ රාත්‍රියක්';
  }
  return [greetingEN, greetingSI];
}
