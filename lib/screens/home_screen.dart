import 'package:flutter/material.dart';
import 'package:lingo/state/app_state.dart';
import 'package:lingo/data/language_data.dart';
import 'package:lingo/core/constants.dart';
import 'package:lingo/widgets/stat_card.dart';
import 'package:lingo/widgets/category_tile.dart';

class HomeScreen extends StatelessWidget {
  final AppState s;
  const HomeScreen(this.s, {super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme, cs = Theme.of(context).colorScheme;
    final l = langs[s.lang]!;
    final all = l.cats.values.expand((e) => e).toList();
    final wotd = all[DateTime.now().difference(DateTime(2024)).inDays % all.length];
    final learned = l.cats.keys.fold<int>(0, (a, c) => a + s.learnedCount(c));
    String? lastGroup;

    return Scaffold(
      body: SafeArea(
        child: ListView(padding: const EdgeInsets.fromLTRB(20, 12, 20, 32), children: [
          Row(children: [
            Text(l.flag, style: const TextStyle(fontSize: 34)),
            const SizedBox(width: 12),
            Expanded(child: Text(l.name, style: t.displaySmall)),
            IconButton.filledTonal(
                tooltip: 'Change language',
                onPressed: () => s.setLang(null),
                icon: const Icon(Icons.translate_rounded)),
          ]),
          const SizedBox(height: 18),
          Row(children: [
            StatCard(Icons.local_fire_department_rounded, '${s.streak}', 'day streak', const Color(0xFFEF6C47)),
            const SizedBox(width: 12),
            StatCard(Icons.check_circle_rounded, '$learned/${all.length}', 'words learned', cs.primary),
          ]),
          const SizedBox(height: 16),
          // Word of the day
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(colors: [cs.primary, cs.tertiary], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Row(children: [
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Word of the day', style: t.labelLarge?.copyWith(color: cs.onPrimary.withValues(alpha: .85))),
                  const SizedBox(height: 6),
                  Text(wotd[1], style: t.headlineMedium?.copyWith(color: cs.onPrimary)),
                  Text('${wotd[0]}  •  ${wotd[2]}', style: t.bodyMedium?.copyWith(color: cs.onPrimary.withValues(alpha: .9))),
                ]),
              ),
              Icon(Icons.auto_awesome_rounded, color: cs.onPrimary, size: 34),
            ]),
          ),
          for (final c in l.cats.keys) ...[
            if (groups[c] != lastGroup)
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 10),
                child: Text(lastGroup = groups[c]!, style: t.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
              ),
            CategoryTile(s, c),
          ],
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => showDialog(
              context: context,
              builder: (d) => AlertDialog(
                title: const Text('Reset progress?'),
                content: const Text('Your learned words, quiz scores and streak will be deleted.'),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(d), child: const Text('Cancel')),
                  FilledButton(onPressed: () { s.reset(); Navigator.pop(d); }, child: const Text('Reset')),
                ],
              ),
            ),
            child: const Text('Reset progress'),
          ),
        ]),
      ),
    );
  }
}
