import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardInforShimmerWidget extends StatelessWidget {
  const CardInforShimmerWidget(
      {super.key, required this.size, required this.theme});
  final Size size;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLowest,
          border: Border.all(color: Colors.black12, width: 1.2),
          borderRadius: BorderRadius.circular(10)),
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.primaryFixedDim,
        highlightColor: Theme.of(context).colorScheme.secondary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Container(
                height: 10,
                width: 1,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.grey,
                ),
              ),
              subtitle: Container(
                height: 10,
                width: size.width * 0.1,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.grey),
              ),
              trailing: const CircleAvatar(),
            ),
            // const SizedBox(height: 10),
            Container(
              height: 10,
              width: size.width * 0.3,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
