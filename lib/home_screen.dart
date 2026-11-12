import 'package:flutter/material.dart';
import 'data.dart';
import 'detail_screen.dart';
import 'widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _city = 'Jakarta';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
              child: Row(
                children: [
                  const Text(
                    'TonTonin',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 3,
                      color: kCyan,
                      shadows: [Shadow(color: kCyan, blurRadius: 12)],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, color: kCyan),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: kMag),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: kMag.withOpacity(0.35), blurRadius: 12)],
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _city,
                    isExpanded: true,
                    dropdownColor: kPanel,
                    icon: const Icon(Icons.keyboard_arrow_down, color: kMag),
                    items: ['Jakarta', 'Bandung', 'Surabaya']
                        .map((c) => DropdownMenuItem<String>(
                              value: c,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.location_on, color: kMag, size: 18),
                                  const SizedBox(width: 8),
                                  Text(c),
                                ],
                              ),
                            ))
                        .toList(),
                    onChanged: (v) => setState(() => _city = v!),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: kCyan,
                        side: const BorderSide(color: kCyan),
                      ),
                      child: const Text('Masuk'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {},
                      child: const Text('Daftar'),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text('Film Pilihan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 2, 16, 0),
              child: Text('Yang lagi paling ramai minggu ini',
                  style: TextStyle(fontSize: 12, color: kMuted)),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 24),
                children: [
                  _buildRow('MINGGU INI', 0),
                  _buildRow('SEGERA TAYANG', 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, int start) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
              color: kCyan,
            ),
          ),
        ),
        SizedBox(
          height: 212,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 5,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, j) => FilmCard(index: start + j),
          ),
        ),
      ],
    );
  }
}

class FilmCard extends StatelessWidget {
  final int index;

  const FilmCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final film = films[index];
    return SizedBox(
      width: 116,
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailScreen(index: index)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'poster-$index',
              child: Container(
                height: 166,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: kCyan),
                  boxShadow: [BoxShadow(color: kCyan.withOpacity(0.35), blurRadius: 12)],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      PosterImage(path: posterPath(index), hue: film.hue),
                      Positioned(
                        left: 6,
                        bottom: 4,
                        child: OutlineNumber(text: '${index + 1}'),
                      ),
                      if (film.presale)
                        const Positioned(
                          top: 6,
                          right: 6,
                          child: PresaleTag(),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              film.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, height: 1.35),
            ),
          ],
        ),
      ),
    );
  }
}
