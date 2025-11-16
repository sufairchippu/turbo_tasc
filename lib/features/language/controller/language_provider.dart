import 'package:flutter/cupertino.dart';

class LanguageProvider with ChangeNotifier {
  String _selectedLanguage = '';
  String get selectedLanguage => _selectedLanguage;

  changeLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }
}
