import 'package:flutter/material.dart';
import 'package:lingo/core/theme.dart';
import 'package:lingo/screens/home_screen.dart';
import 'package:lingo/screens/language_screen.dart';
import 'package:lingo/screens/splash_screen.dart';
import 'package:lingo/state/app_state.dart';

class LingoApp extends StatelessWidget {
  final AppState state;
  const LingoApp(this.state, {super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Lingo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        home: SplashScreen(next: _Root(state)),
      );
}

/// Shows the language picker until a language is chosen, then the dashboard.
class _Root extends StatelessWidget {
  final AppState state;
  const _Root(this.state);

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: state,
        builder: (_, __) =>
            state.lang == null ? LanguageScreen(state) : HomeScreen(state),
      );
}
