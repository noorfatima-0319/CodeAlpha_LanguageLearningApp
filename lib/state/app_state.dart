import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Stores the selected language, learned words, best quiz scores and streak.
class AppState extends ChangeNotifier {
  late SharedPreferences _p;
  String? lang;
  int streak = 0;
  String last = '';
  final Map<String, List<int>> _learned = {};
  final Map<String, int> _best = {};

  String _day(int back) =>
      DateTime.now().subtract(Duration(days: back)).toIso8601String().substring(0, 10);

  Future<void> load() async {
    _p = await SharedPreferences.getInstance();
    lang = _p.getString('lang');
    streak = _p.getInt('streak') ?? 0;
    last = _p.getString('last') ?? '';
    final l = _p.getString('learned');
    if (l != null) (jsonDecode(l) as Map).forEach((k, v) => _learned[k] = List<int>.from(v));
    final b = _p.getString('best');
    if (b != null) (jsonDecode(b) as Map).forEach((k, v) => _best[k] = v as int);
    _touch();
  }

  void _touch() {
    if (last != _day(0)) {
      streak = last == _day(1) ? streak + 1 : 1;
      last = _day(0);
    }
  }

  void _save() {
    _touch();
    lang == null ? _p.remove('lang') : _p.setString('lang', lang!);
    _p.setInt('streak', streak);
    _p.setString('last', last);
    _p.setString('learned', jsonEncode(_learned));
    _p.setString('best', jsonEncode(_best));
    notifyListeners();
  }

  String _k(String cat) => '$lang|$cat';
  void setLang(String? l) { lang = l; _save(); }
  bool isLearned(String cat, int i) => _learned[_k(cat)]?.contains(i) ?? false;
  int learnedCount(String cat) => _learned[_k(cat)]?.length ?? 0;
  int bestScore(String cat) => _best[_k(cat)] ?? 0;

  void toggle(String cat, int i) {
    final list = _learned.putIfAbsent(_k(cat), () => []);
    list.contains(i) ? list.remove(i) : list.add(i);
    _save();
  }

  void saveBest(String cat, int score) {
    if (score > bestScore(cat)) _best[_k(cat)] = score;
    _save();
  }

  void reset() {
    _learned.clear();
    _best.clear();
    streak = 0;
    last = '';
    _save();
  }
}
