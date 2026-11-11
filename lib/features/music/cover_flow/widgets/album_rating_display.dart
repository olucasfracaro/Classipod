import 'package:classipod/core/theme/ipod_typography.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

class AlbumRatingDisplay extends StatelessWidget {
  final double rating;

  const AlbumRatingDisplay({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    final wholeStars = rating.floor();
    final decimalWidth = (rating - wholeStars).clamp(0.0, 1.0);
    const color = Color(0xFFFFFFFF);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var index = 0; index < 5; index++)
          SizedBox(
            width: 12,
            height: 14,
            child: Stack(
              children: [
                const Icon(CupertinoIcons.star, size: 12, color: color),
                if (index < wholeStars)
                  const Icon(CupertinoIcons.star_fill, size: 12, color: color)
                else if (index == wholeStars && decimalWidth > 0)
                  ClipRect(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      widthFactor: decimalWidth,
                      child: const Icon(
                        CupertinoIcons.star_fill,
                        size: 12,
                        color: color,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        const SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: IpodTypography.caption.copyWith(color: color),
        ),
      ],
    );
  }
}
