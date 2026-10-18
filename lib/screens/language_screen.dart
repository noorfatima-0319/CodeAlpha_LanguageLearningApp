import 'package:flutter/material.dart';
import 'package:lingo/state/app_state.dart';
import 'package:lingo/data/language_data.dart';

class LanguageScreen extends StatelessWidget {
  final AppState s;
  const LanguageScreen(this.s, {super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme, cs = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: ListView(padding: const EdgeInsets.all(24), children: [
          const SizedBox(height: 28),
          Text('Lingo', style: t.displaySmall),
          const SizedBox(height: 8),
          Text('Which language do you want to learn?',
              style: t.bodyLarge?.copyWith(color: cs.onSurfaceVariant)),
          const SizedBox(height: 28),
          for (final e in langs.entries)
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Material(
                color: cs.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(24),
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: () => s.setLang(e.key),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(children: [
                      Text(e.value.flag, style: const TextStyle(fontSize: 42)),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(e.value.name, style: t.titleLarge),
                          Text(
                              '${e.value.cats.values.fold<int>(0, (a, b) => a + b.length)} words and phrases',
                              style: t.bodyMedium?.copyWith(color: cs.onSurfaceVariant)),
                        ]),
                      ),
                      const Icon(Icons.arrow_forward_rounded),
                    ]),
                  ),
                ),
              ),
            ),
        ]),
      ),
    );
  }
}
