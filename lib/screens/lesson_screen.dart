import 'package:flutter/material.dart';
import 'package:lingo/state/app_state.dart';
import 'package:lingo/data/language_data.dart';
import 'package:lingo/widgets/flip_card.dart';
import 'package:lingo/screens/quiz_screen.dart';

class LessonScreen extends StatefulWidget {
  final AppState s; final String cat;
  const LessonScreen(this.s, this.cat, {super.key});
  @override
  State<LessonScreen> createState() => _LessonState();
}

class _LessonState extends State<LessonScreen> {
  int i = 0;
  bool flipped = false;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme, cs = Theme.of(context).colorScheme;
    final s = widget.s, l = langs[s.lang]!, words = l.cats[widget.cat]!, w = words[i];
    final last = i == words.length - 1;
    void flip() {
      setState(() => flipped = !flipped);
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.cat), actions: [
        Padding(padding: const EdgeInsets.only(right: 20), child: Center(child: Text('${i + 1}/${words.length}', style: t.titleMedium))),
      ]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
          child: Column(children: [
            LinearProgressIndicator(value: (i + 1) / words.length, minHeight: 8, borderRadius: BorderRadius.circular(8)),
            const SizedBox(height: 20),
            Expanded(
              child: FlipCard(
                flipped: flipped,
                onTap: flip,
                front: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text('English', style: t.labelLarge?.copyWith(color: cs.onSurfaceVariant)),
                  const SizedBox(height: 12),
                  Text(w[0], textAlign: TextAlign.center, style: t.headlineMedium),
                  const SizedBox(height: 20),
                  Text('Tap to see the answer', style: t.bodySmall?.copyWith(color: cs.onSurfaceVariant)),
                ]),
                back: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(l.name, style: t.labelLarge?.copyWith(color: cs.onPrimaryContainer)),
                  const SizedBox(height: 12),
                  Text(w[1], textAlign: TextAlign.center, style: t.displaySmall?.copyWith(color: cs.onPrimaryContainer)),
                  const SizedBox(height: 14),
                  Text(w[2], style: t.titleMedium?.copyWith(color: cs.onPrimaryContainer)),
                ]),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(onPressed: flip, child: Text(flipped ? 'Hide Answer' : 'Show Answer')),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: FilledButton.tonalIcon(
                style: FilledButton.styleFrom(minimumSize: const Size(0, 48)),
                onPressed: () { s.toggle(widget.cat, i); setState(() {}); },
                icon: Icon(s.isLearned(widget.cat, i) ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded),
                label: Text(s.isLearned(widget.cat, i) ? 'Learned' : 'Mark as learned'),
              ),
            ),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(child: OutlinedButton(onPressed: i == 0 ? null : () => setState(() { i--; flipped = false; }), child: const Text('Previous'))),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton(
                  onPressed: last
                      ? () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => QuizScreen(s, widget.cat)))
                      : () => setState(() { i++; flipped = false; }),
                  child: Text(last ? 'Take quiz' : 'Next'),
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
