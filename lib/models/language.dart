/// A word is [English, Translation, Pronunciation].
typedef W = List<String>;

class Lang {
  final String name, flag;
  final Map<String, List<W>> cats;
  const Lang(this.name, this.flag, this.cats);
}
