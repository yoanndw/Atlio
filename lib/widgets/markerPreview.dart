import 'package:flutter/material.dart';
import 'package:project_ofb/showForm.dart';

import '../model/fiche.dart';

class MarkerPreview extends StatelessWidget {
  final Fiche fiche;

  const MarkerPreview({
    super.key,
    required this.fiche,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Redirect to form
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ShowForm(fiche: fiche)));
      },
      child: _buildMarkerPreview(),
    );
  }

  Widget _buildMarkerPreview() {
    return Stack(
      children: [
        Positioned(
          top: -5,
          left: -10,
          right: -10,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // if (fiche.photos.isNotEmpty)
                //   Image.network(
                //     // TODO Use user image
                //     fiche.photos[0],
                //     width: 70,
                //     height: 70,
                //     fit: BoxFit.cover,
                //   )
                // else
                //   const Icon(Icons.insert_photo_outlined,
                //       size: 70, color: Colors.grey),
              ],
            ),
          ),
        ),
        Positioned(
          top: 85,
          left: 0,
          right: 0,
          child: SizedBox(
            width: 20,
            height: 10,
            child: CustomPaint(
              painter: TrianglePainter(),
            ),
          ),
        ),
      ],
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..moveTo(size.width / 2, size.height)
      ..lineTo(size.width / 4, 0)
      ..lineTo(size.width / 4 * 3, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
