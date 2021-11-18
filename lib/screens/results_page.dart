

import '../utils/drink.dart';
import '../Widgets/informative_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Displays lethal and safe dosages for the specified [Drink].
class ResultsPage extends StatelessWidget {
  const ResultsPage({
    @required this.drink,
    @required this.bodyWeight,
    Key? key,
  })  : assert(drink != null),
        assert(bodyWeight != null),
        super(key: key);

  final Drink? drink;

  /// The individual's body weight (in pounds).
  final int? bodyWeight;

  @override
  Widget build(BuildContext context) {
    final safeDosage = drink!.safeDosage(bodyWeight!);
    final lethalDosage = drink!.lethalDosage(bodyWeight!);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dosages',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InformativeCard(
              title: 'Lethal Dosage',
              leadingAssetName: 'images/lethal.png',
              message: lethalDosage == 1
                  ? 'One serving.'
                  : '${lethalDosage.toStringAsFixed(1)} '
                  'servings in your system at one time.',
            ),
            const SizedBox(
              height: 12,
            ),
            InformativeCard(
              title: 'Daily Safe Maximum',
              leadingAssetName: 'images/safe.png',
              message: safeDosage == 1
                  ? 'One serving per day.'
                  : '${safeDosage.toStringAsFixed(1)} '
                  'servings per day.',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
              child: Text(
                '*Based on ${drink!.servingSize} fl. oz serving.',
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .apply(color: Theme.of(context).textTheme.caption!.color),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                '*Applies to age 18 and over. This calculator '
                    'does not replace professional medical advice.',
                style: Theme.of(context).textTheme.bodyText2!.apply(
                  color: Theme.of(context).textTheme.caption!.color,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
