import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lingo/state/app_state.dart';
import 'package:lingo/models/language.dart';
import 'package:lingo/data/language_data.dart';
import 'package:lingo/screens/lesson_screen.dart';

class _Q {
  final String q, ans; final List<String> options; final bool toEnglish;
  _Q(this.q, this.ans, this.options, this.toEnglish);
}

class QuizScreen extends StatefulWidget {
  final AppState s; final String cat;
  const QuizScreen(this.s, this.cat, {super.key});
  @override
  State<QuizScreen> createState() => _QuizState();
}

class _QuizState extends State<QuizScreen> {
  late List<_Q> qs;
  int i = 0, score = 0;
  int? picked;

  @override
  void initState() {
    super.initState();
    _build();
  }

  void _build() {
    final rnd = Random();
    final l = langs[widget.s.lang]!;
    final pool = l.cats.values.expand((e) => e).toList();
    final chosen = (List<W>.of(l.cats[widget.cat]!)..shuffle(rnd)).take(5).toList();
    qs = [
      for (var k = 0; k < chosen.length; k++)
        () {
          final rev = k.isOdd, w = chosen[k], ans = rev ? w[0] : w[1];
          final opts = <String>{ans};
          for (final x in (List<W>.of(pool)..shuffle(rnd))) {
            if (opts.length >= 4) break;
            opts.add(rev ? x[0] : x[1]);
          }
          return _Q(rev ? w[1] : w[0], ans, opts.toList()..shuffle(rnd), rev);
        }()
    ];
    i = 0; score = 0; picked = null;
  }

  void _next() {
    setState(() { i++; picked = null; });
    if (i >= qs.length) widget.s.saveBest(widget.cat, score);
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme, cs = Theme.of(context).colorScheme;
    final lang = langs[widget.s.lang]!;
    if (i >= qs.length) return _results(t, cs);
    final q = qs[i];
    return Scaffold(
      appBar: AppBar(title: Text('${widget.cat} quiz'), actions: [
        Padding(padding: const EdgeInsets.only(right: 20), child: Center(child: Text('${i + 1}/${qs.length}', style: t.titleMedium))),
      ]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            LinearProgressIndicator(value: (i + 1) / qs.length, minHeight: 8, borderRadius: BorderRadius.circular(8)),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: cs.primaryContainer, borderRadius: BorderRadius.circular(24)),
              child: Column(children: [
                Text(q.toEnglish ? 'What does this mean in English?' : 'How do you say this in ${lang.name}?',
                    style: t.labelLarge?.copyWith(color: cs.onPrimaryContainer)),
                const SizedBox(height: 10),
                Text(q.q, textAlign: TextAlign.center, style: t.headlineMedium?.copyWith(color: cs.onPrimaryContainer)),
              ]),
            ),
            const SizedBox(height: 20),
            for (var j = 0; j < q.options.length; j++) _option(q, j, t, cs),
            const Spacer(),
            if (picked != null)
              FilledButton(onPressed: _next, child: Text(i + 1 == qs.length ? 'See results' : 'Next question')),
          ]),
        ),
      ),
    );
  }

  Widget _option(_Q q, int j, TextTheme t, ColorScheme cs) {
    final o = q.options[j];
    final answered = picked != null;
    final isRight = o == q.ans, isWrong = answered && picked == j && !isRight;
    final color = answered && isRight
        ? Colors.green.withValues(alpha: .22)
        : isWrong ? cs.errorContainer : cs.surfaceContainerHigh;
    final border = answered && isRight ? Colors.green : isWrong ? cs.error : Colors.transparent;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: border, width: 2)),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: answered ? null : () => setState(() { picked = j; if (isRight) score++; }),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(children: [
              Expanded(child: Text(o, style: t.titleMedium)),
              if (answered && isRight) const Icon(Icons.check_circle_rounded, color: Colors.green),
              if (isWrong) Icon(Icons.cancel_rounded, color: cs.error),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _results(TextTheme t, ColorScheme cs) {
    final msg = score == qs.length
        ? 'Perfect score!'
        : score >= qs.length / 2 ? 'Nice work. Keep practising.' : 'Review the cards and try again.';
    return Scaffold(
      appBar: AppBar(title: Text('${widget.cat} quiz')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Center(
              child: SizedBox(
                width: 180, height: 180,
                child: Stack(alignment: Alignment.center, children: [
                  SizedBox.expand(child: CircularProgressIndicator(value: score / qs.length, strokeWidth: 14, backgroundColor: cs.surfaceContainerHighest)),
                  Text('$score/${qs.length}', style: t.displaySmall),
                ]),
              ),
            ),
            const SizedBox(height: 24),
            Text(msg, textAlign: TextAlign.center, style: t.titleLarge),
            const SizedBox(height: 32),
            FilledButton(onPressed: () => setState(_build), child: const Text('Try again')),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LessonScreen(widget.s, widget.cat))),
              child: const Text('Review cards'),
            ),
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Back to home')),
          ]),
        ),
      ),
    );
  }
}

