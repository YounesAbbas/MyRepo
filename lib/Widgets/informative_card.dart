
import 'package:flutter/material.dart';

/// Card containing a leading [Image.asset], a title and a description
/// [Text].
class InformativeCard extends StatelessWidget {
  const InformativeCard({
    Key? key,
    this.title,
    this.message,
    this.leadingAssetName,
  }) : super(key: key);
  final String? title;
  final String? message;
  final String? leadingAssetName;

  @override
  Widget build(BuildContext context) => Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (leadingAssetName != null)
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 16,
                  right: 16,
                ),
                child: Image.asset(
                  leadingAssetName!,
                ),
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null)
                      Text(
                        title!,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    if (message != null)
                      const SizedBox(
                        height: 8,
                      ),
                    if (message != null)
                      Text(
                        message!,
                        style: Theme.of(context).textTheme.bodyText2!.apply(
                              color: Theme.of(context).textTheme.caption!.color,
                            ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
