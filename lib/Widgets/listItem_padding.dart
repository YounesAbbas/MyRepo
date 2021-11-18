import 'package:flutter/material.dart';
class ListItemPadding extends StatelessWidget {
  const ListItemPadding({
    @required this.child,
    Key? key,
  })  : assert(child != null),
        super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 4,
    ),
    child: child,
  );
}