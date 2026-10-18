import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final IconData icon; final String value, label; final Color color;
  const StatCard(this.icon, this.value, this.label, this.color, {super.key});
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme, cs = Theme.of(context).colorScheme;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: cs.surfaceContainerHigh, borderRadius: BorderRadius.circular(20)),
        child: Row(children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(value, style: t.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
            Text(label, style: t.bodySmall?.copyWith(color: cs.onSurfaceVariant)),
          ]),
        ]),
      ),
    );
  }
}
