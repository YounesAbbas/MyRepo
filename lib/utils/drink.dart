
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

/// Represents a caffeinated drink and contains the logic for
/// calculating safe and lethal dosages.
class Drink {
  const Drink({
    @required this.caffeineAmount,
    @required this.servingSize,
    this.name,
  })  : assert(caffeineAmount != null),
        assert(servingSize != null);

  final String? name;

  /// The caffeine amount (in milligrams) of this [Drink].
  final int? caffeineAmount;

  /// The serving size (in fl. oz) of this [Drink].
  final double? servingSize;

  /// Calculates the lethal dosage of this [Drink] for the specified body
  /// weight (in pounds).
  double lethalDosage(int bodyWeight) {
    final caffeineTolerance = bodyWeight * 68.22;
    return caffeineTolerance / caffeineAmount!;
  }

  /// Calculates the safe dosage of this [Drink] for the specified body weight
  /// (in pounds).
  double safeDosage(int bodyWeight) {
    final caffeineTolerance = bodyWeight * 2.72155;
    return caffeineTolerance / caffeineAmount!;
  }
}
