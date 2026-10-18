import 'package:flutter/material.dart';

/// Animated launch screen. Fades into [next] after a short delay.
class SplashScreen extends StatefulWidget {
  final Widget next;
  const SplashScreen({super.key, required this.next});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
  late final Animation<double> _logo =
      CurvedAnimation(parent: _c, curve: const Interval(0, .6, curve: Curves.elasticOut));
  late final Animation<double> _text =
      CurvedAnimation(parent: _c, curve: const Interval(.5, 1, curve: Curves.easeOut));

  @override
  void initState() {
    super.initState();
    _c.forward();
    Future.delayed(const Duration(milliseconds: 2800), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) => widget.next,
        transitionsBuilder: (_, a, __, child) => FadeTransition(opacity: a, child: child),
      ));
    });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme, t = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [cs.primary, cs.tertiary],
          ),
        ),
        child: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ScaleTransition(
              scale: _logo,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: cs.onPrimary.withOpacity(.18),
                  border: Border.all(color: cs.onPrimary.withOpacity(.5), width: 3),
                ),
                child: Icon(Icons.translate_rounded, size: 58, color: cs.onPrimary),
              ),
            ),
            const SizedBox(height: 28),
            FadeTransition(
              opacity: _text,
              child: Column(children: [
                Text('Lingo', style: t.displaySmall?.copyWith(color: cs.onPrimary, fontSize: 46)),
                const SizedBox(height: 8),
                Text('Learn a language, one word at a time',
                    style: t.bodyLarge?.copyWith(color: cs.onPrimary.withOpacity(.9))),
                const SizedBox(height: 28),
                Text('Hello  •  Hola  •  Bonjour  •  مرحبا  •  नमस्ते',
                    style: t.bodyMedium?.copyWith(color: cs.onPrimary.withOpacity(.75))),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
