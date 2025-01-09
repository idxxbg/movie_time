import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EpisodeShimmerWidget extends StatelessWidget {
  const EpisodeShimmerWidget(
      {super.key, required this.size, required this.theme});
  final Size size;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      // margin: const EdgeInsets.only(),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        border: Border.all(color: Colors.black12, width: 1.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.primaryFixedDim,
        highlightColor: Theme.of(context).colorScheme.secondary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              title: Container(
                height: 10,
                width: 1,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.grey,
                ),
              ),
              trailing: const Icon(Icons.arrow_drop_down_circle_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
