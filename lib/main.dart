import 'package:flutter/material.dart';
import 'package:lingo/app.dart';
import 'package:lingo/state/app_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final state = AppState();
  await state.load();
  state.lang = null;
  runApp(LingoApp(state));
}
