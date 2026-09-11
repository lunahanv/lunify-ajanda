import 'package:flutter/material.dart';

void main() => runApp(const LunifyAjanda());

class LunifyAjanda extends StatelessWidget {
  const LunifyAjanda({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Lunify Ajanda',
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff6750a4)), useMaterial3: true),
    home: const YearPage(),
  );
}

class YearPage extends StatefulWidget {
  const YearPage({super.key});
  @override State<YearPage> createState() => _YearPageState();
}
class _YearPageState extends State<YearPage> {
  int year = DateTime.now().year;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('$year Ajandam'), actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search)), IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle))]),
    body: LayoutBuilder(builder: (context, box) {
      final columns = box.maxWidth >= 900 ? 4 : box.maxWidth >= 560 ? 3 : 1;
      return GridView.builder(padding: const EdgeInsets.all(16), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: columns, childAspectRatio: 1.25, crossAxisSpacing: 12, mainAxisSpacing: 12), itemCount: 12, itemBuilder: (_, month) => MonthCard(year: year, month: month + 1));
    }),
    floatingActionButton: FloatingActionButton.extended(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DayPage(date: DateTime.now()))), icon: const Icon(Icons.edit), label: const Text('Bugüne yaz')),
  );
}

class MonthCard extends StatelessWidget {
  final int year, month;
  const MonthCard({super.key, required this.year, required this.month});
  static const names = ['Ocak','Şubat','Mart','Nisan','Mayıs','Haziran','Temmuz','Ağustos','Eylül','Ekim','Kasım','Aralık'];
  @override Widget build(BuildContext context) {
    final count = DateTime(year, month + 1, 0).day;
    return Card(child: Padding(padding: const EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(names[month - 1], style: Theme.of(context).textTheme.titleMedium), const SizedBox(height: 8), Expanded(child: GridView.builder(physics: const NeverScrollableScrollPhysics(), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7), itemCount: count, itemBuilder: (_, i) => InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DayPage(date: DateTime(year, month, i + 1)))), child: Center(child: Text('${i + 1}', style: const TextStyle(fontSize: 11))))))])));
  }
}

class DayPage extends StatefulWidget {
  final DateTime date;
  const DayPage({super.key, required this.date});
  @override State<DayPage> createState() => _DayPageState();
}
class _DayPageState extends State<DayPage> {
  final strokes = <List<Offset>>[];
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('${widget.date.day}.${widget.date.month}.${widget.date.year}'), actions: [IconButton(onPressed: () => setState(strokes.clear), icon: const Icon(Icons.delete_outline)), IconButton(onPressed: () {}, icon: const Icon(Icons.auto_awesome))]),
    body: GestureDetector(onPanStart: (d) => setState(() => strokes.add([d.localPosition])), onPanUpdate: (d) => setState(() => strokes.last.add(d.localPosition)), child: CustomPaint(painter: InkPainter(strokes), size: Size.infinite)),
  );
}
class InkPainter extends CustomPainter {
  final List<List<Offset>> strokes;
  InkPainter(this.strokes);
  @override void paint(Canvas canvas, Size size) {
    canvas.drawColor(const Color(0xfffffdf7), BlendMode.src);
    final grid = Paint()..color = const Color(0xffe8e2ef)..strokeWidth = 1;
    for (double y = 32; y < size.height; y += 32) { canvas.drawLine(Offset(0,y), Offset(size.width,y), grid); }
    final ink = Paint()..color = const Color(0xff35275b)..strokeWidth = 3..strokeCap = StrokeCap.round;
    for (final s in strokes) { for (var i=1; i<s.length; i++) { canvas.drawLine(s[i-1], s[i], ink); } }
  }
  @override bool shouldRepaint(covariant InkPainter oldDelegate) => true;
}
