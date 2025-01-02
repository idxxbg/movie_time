import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SlideViewShimmerWidget extends StatelessWidget {
  const SlideViewShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 2 / 7,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: size.height / 4,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.grey),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 5,
              child: Container(
                height: size.height / 4,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.grey),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Container(
                height: size.height / 4,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
