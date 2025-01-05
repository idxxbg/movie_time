import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedMovieShimmer extends StatelessWidget {
  const FeaturedMovieShimmer({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height * 2 / 6,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, int i) {
            return const ShimmerWidget();
          }),
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 2 / 6,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.primaryFixedDim,
        highlightColor: Theme.of(context).colorScheme.secondary,
        child: Column(
          children: [
            Container(
              height: size.height * 2 / 7,
              width: size.width * 1 / 3,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Expanded(
                child: Container(
              height: 6,
              width: size.width * 1 / 4,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
