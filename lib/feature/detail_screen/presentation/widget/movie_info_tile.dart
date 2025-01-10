import 'package:flutter/material.dart';

class MovieInfoTile extends StatelessWidget {
  final String title;
  final Widget trailing;

  const MovieInfoTile({
    super.key,
    required this.title,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          title: Text(
            title,
            style: theme.textTheme.titleMedium,
          ),
          trailing: trailing,
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
          color: Colors.black12,
          height: 0,
        ),
      ],
    );
  }
}
