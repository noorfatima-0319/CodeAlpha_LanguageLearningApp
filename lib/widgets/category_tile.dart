import 'package:flutter/material.dart';
import 'package:lingo/state/app_state.dart';
import 'package:lingo/data/language_data.dart';
import 'package:lingo/core/constants.dart';
import 'package:lingo/screens/lesson_screen.dart';
import 'package:lingo/screens/quiz_screen.dart';

class CategoryTile extends StatelessWidget {
  final AppState s; final String cat;
  const CategoryTile(this.s, this.cat);
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme, cs = Theme.of(context).colorScheme;
    final n = langs[s.lang]!.cats[cat]!.length, done = s.learnedCount(cat);
    final color = catColors[cat]!;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cs.surfaceContainerHigh, borderRadius: BorderRadius.circular(22)),
      child: Column(children: [
        Row(children: [
          CircleAvatar(backgroundColor: color.withOpacity(.18), child: Icon(catIcons[cat], color: color)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(cat, style: t.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
              Text('$done/$n learned  •  best quiz ${s.bestScore(cat)}/5',
                  style: t.bodySmall?.copyWith(color: cs.onSurfaceVariant)),
            ]),
          ),
        ]),
        const SizedBox(height: 12),
        LinearProgressIndicator(value: done / n, minHeight: 8, color: color, backgroundColor: color.withOpacity(.18), borderRadius: BorderRadius.circular(8)),
        const SizedBox(height: 14),
        Row(children: [
          Expanded(
            child: FilledButton.tonal(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LessonScreen(s, cat))),
              child: const Text('Learn'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => QuizScreen(s, cat))),
              child: const Text('Take quiz'),
            ),
          ),
        ]),
      ]),
    );
  }
}
