import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_time/core/common/style/style.dart';
import 'package:film_time/feature/home/domain/entity/movie_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:soft_edge_blur/soft_edge_blur.dart';

class ExampleAppBar extends SliverPersistentHeaderDelegate {
  final bottomHeight = 60;
  final extraRadius = 5;
  final MovieInfoEntity movie;
  ExampleAppBar(this.movie);
  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    final imageTop =
        -shrinkOffset.clamp(0.0, maxExtent - minExtent - bottomHeight);

    final double clowsingRate = (shrinkOffset == 0
            ? 0.0
            : (shrinkOffset / (maxExtent - minExtent - bottomHeight)))
        .clamp(0, 1);

    final double opacity = shrinkOffset == minExtent
        ? 0
        : 1 - (shrinkOffset.clamp(minExtent, minExtent + 30) - minExtent) / 30;

    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: 20,
          left: 45,
          child: Row(
            children: [
              Transform.scale(
                scale: 1.9 - clowsingRate,
                alignment: Alignment.bottomCenter,
                child: _Avatar(image: movie.posterUrl.toString()),
              ),
              const Spacer(),
              const LikeButton(),
              // const _Button(),
            ],
          ),
        ),
        Positioned(
          top: imageTop,
          left: 0,
          right: 0,
          child: ClipPath(
            clipper: InvertedCircleClipper(
              radius: (1.9 - clowsingRate) * bottomHeight / 2 + extraRadius,
              offset: Offset(
                bottomHeight / 2 + 45,
                (maxExtent - bottomHeight + extraRadius / 2) +
                    clowsingRate * bottomHeight / 2,
              ),
            ),
            child: SoftEdgeBlur(
              edges: [
                EdgeBlur(
                  type: EdgeType.topEdge,
                  size: 50,
                  sigma: 50,
                  controlPoints: [
                    ControlPoint(
                      position: 0.3,
                      type: ControlPointType.visible,
                    ),
                    ControlPoint(
                      position: 1,
                      type: ControlPointType.transparent,
                    )
                  ],
                )
              ],
              child: SizedBox(
                height: maxExtent - bottomHeight,
                child: ColoredBox(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Opacity(
                    opacity: opacity,
                    child: CachedNetworkImage(
                      errorWidget: (context, url, error) => const Icon(
                        Icons.image_not_supported_sharp,
                        size: 50,
                      ),
                      imageUrl: completeImageUrl(movie.thumbUrl.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: MediaQuery.of(context).padding.top + 5,
            left: 10,
            right: 10,
            child: Row(
              children: [
                _IconButton(
                  icon: Icons.arrow_back,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
                _IconButton(
                  onTap: () {},
                  icon: Icons.more_vert,
                ),
              ],
            )),
      ],
    );
  }

  @override
  double get maxExtent => 250;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class _IconButton extends StatelessWidget {
  const _IconButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.5),
        ),
        padding: const EdgeInsets.all(4),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

class InvertedCircleClipper extends CustomClipper<Path> {
  const InvertedCircleClipper({
    required this.offset,
    required this.radius,
  });
  final Offset offset;
  final double radius;

  @override
  Path getClip(size) {
    return Path()
      ..addOval(Rect.fromCircle(
        center: offset,
        radius: radius,
      ))
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: CachedNetworkImage(
          errorWidget: (context, url, error) => const Icon(
            Icons.image_not_supported_sharp,
            size: 50,
          ),
          imageUrl: completeImageUrl(image.toString()),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
