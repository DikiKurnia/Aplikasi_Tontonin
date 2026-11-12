import 'dart:ui';
import 'package:flutter/material.dart';
import 'data.dart';
import 'widgets.dart';

class DetailScreen extends StatefulWidget {
  final int index;

  const DetailScreen({super.key, required this.index});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _expanded = false;
  int _selectedDate = 0;

  static const _days = [
    ['HARI INI', '12'], ['JUM', '13'], ['SAB', '14'], ['MIN', '15'], ['SEN', '16'],
    ['SEL', '17'], ['RAB', '18'], ['KAM', '19'], ['JUM', '20'], ['SAB', '21'],
  ];

  @override
  Widget build(BuildContext context) {
    final film = films[widget.index];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(film),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoRow('Sutradara', film.director),
                  _infoRow('Pemeran', film.cast),
                  _infoRow('Bahasa', 'Bahasa Indonesia'),
                  const SizedBox(height: 10),
                  _synopsis(film.synopsis),
                  const SizedBox(height: 16),
                  const Text(
                    'PILIH TANGGAL',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1),
                  ),
                  const SizedBox(height: 8),
                  _dates(),
                  const SizedBox(height: 12),
                  _seatButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(Film film) {
    return SizedBox(
      height: 260,
      width: double.infinity,
      child: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Stack(
              fit: StackFit.expand,
              children: [
                PosterImage(path: posterPath(widget.index), hue: film.hue),
                Container(color: Colors.black.withOpacity(0.55)),
              ],
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 56, 16, 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Hero(
                    tag: 'poster-${widget.index}',
                    child: Container(
                      width: 110,
                      height: 165,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: kCyan),
                        boxShadow: [BoxShadow(color: kCyan.withOpacity(0.5), blurRadius: 18)],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: PosterImage(path: posterPath(widget.index), hue: film.hue),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          film.title.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                            shadows: [Shadow(color: kMag, blurRadius: 10)],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: [
                            _chip('D17', hot: true),
                            _chip(film.genre),
                            _chip(film.duration),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Material(
                          color: kCyan,
                          shape: const CircleBorder(),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () {},
                            child: const SizedBox(
                              width: 40,
                              height: 40,
                              child: Icon(Icons.play_arrow, color: kBg),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: SafeArea(
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: kCyan),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, {bool hot = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: hot ? kMag : kLine),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 11, color: hot ? kMag : kMuted),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: kCyan),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 12, height: 1.5, color: kMuted),
            ),
          ),
        ],
      ),
    );
  }

  Widget _synopsis(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          maxLines: _expanded ? null : 3,
          overflow: _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12, height: 1.6, color: kMuted),
        ),
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              _expanded ? 'tutup' : '...selengkapnya',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: kMag),
            ),
          ),
        ),
      ],
    );
  }

  Widget _dates() {
    return SizedBox(
      height: 62,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _days.length,
        separatorBuilder: (context, index) => const SizedBox(width: 6),
        itemBuilder: (context, i) {
          final on = i == _selectedDate;
          return GestureDetector(
            onTap: () => setState(() => _selectedDate = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 46,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: on ? kCyan : kLine),
                boxShadow: on
                    ? [BoxShadow(color: kCyan.withOpacity(0.5), blurRadius: 12)]
                    : null,
              ),
              child: Column(
                children: [
                  Text(
                    _days[i][0],
                    style: TextStyle(fontSize: 10, color: on ? kCyan : kMuted),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    _days[i][1],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: on ? kCyan : kText,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _seatButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [kMag, Color(0xFF9D4DFF)]),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: kMag.withOpacity(0.45), blurRadius: 18)],
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: const Text(
          'PILIH KURSI',
          style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.5),
        ),
      ),
    );
  }
}
