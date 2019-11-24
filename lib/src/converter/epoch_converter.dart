import 'package:json_annotation/json_annotation.dart';

/// The epoch unit
enum EpochUnit {
  /// Seconds unit
  seconds,

  /// Miliseconds unit
  miliseconds,

  /// Microseconds unit
  microseconds
}

/// Base class for epoch converters
abstract class EpochConverter {
  /// The unit that should be used
  final EpochUnit unit;

  /// If the calculations are in utc
  final bool isUtc;

  /// Builds a [EpochConverter] with:
  ///
  /// * [unit]: the converter unit, defaults to [EpochUnit.miliseconds]
  /// * [isUtc]: the utc indicator, defaults to false
  const EpochConverter({this.unit = EpochUnit.miliseconds, this.isUtc = false});

  /// Converts [value] to a Datetime using the configured [unit] and [isUtc] indicator
  ///
  /// * [value]: the epoch
  DateTime from(int value) {
    if (this.unit == EpochUnit.seconds) {
      return DateTime.fromMillisecondsSinceEpoch(value * 1000, isUtc: isUtc);
    } else if (this.unit == EpochUnit.miliseconds) {
      return DateTime.fromMillisecondsSinceEpoch(value, isUtc: isUtc);
    }

    return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: isUtc);
  }

  /// Converts [value] to a int value using the configured [unit]
  ///
  /// * [value]: the datetime
  int to(DateTime value) {
    if (this.unit == EpochUnit.seconds) {
      return value.millisecondsSinceEpoch ~/ 1000;
    } else if (this.unit == EpochUnit.miliseconds) {
      return value.millisecondsSinceEpoch;
    }

    return value.microsecondsSinceEpoch;
  }
}

/// Base class for the conversion of integers to epoch
abstract class IntEpochConverter extends EpochConverter
    implements JsonConverter<DateTime, int> {
  /// Builds a [IntEpochConverter] with:
  ///
  /// * [unit]: the converter unit, defaults to [EpochUnit.miliseconds]
  /// * [isUtc]: the utc indicator, defaults to false
  const IntEpochConverter({unit = EpochUnit.miliseconds, isUtc = false})
      : super(unit: unit, isUtc: isUtc);

  @override

  /// Converts [json] to a epoch using the configured [unit] and [isUtc] indicator
  ///
  /// * [json]: the epoch
  DateTime fromJson(int json) => super.from(json);

  @override

  /// Converts [object] to a int value using the configured [unit]
  ///
  /// * [object]: the datetime
  int toJson(DateTime object) => super.to(object);
}

/// Base class for the conversion of Strings to epoch
abstract class StringEpochConverter extends EpochConverter
    implements JsonConverter<DateTime, String> {
  /// Builds a [StringEpochConverter] with:
  ///
  /// * [unit]: the converter unit, defaults to [EpochUnit.miliseconds]
  /// * [isUtc]: the utc indicator, defaults to false
  const StringEpochConverter({unit = EpochUnit.miliseconds, isUtc = false})
      : super(unit: unit, isUtc: isUtc);

  /// Converts [json] to a epoch using the configured [unit] and [isUtc] indicator
  ///
  /// * [json]: the epoch
  DateTime fromJson(String json) => super.from(int.parse(json));

  /// Converts [object] to a String value using the configured [unit]
  ///
  /// * [object]: the datetime
  String toJson(DateTime object) => super.to(object).toString();
}

/// Converts a value in seconds to a datetime and vice-versa
class IntEpochInSecondsConverter extends IntEpochConverter {
  /// Builds a [IntEpochInSecondsConverter]
  const IntEpochInSecondsConverter() : super(unit: EpochUnit.seconds);
}

/// Converts a value in miliseconds to a datetime and vice-versa
class IntEpochInMilisecondsConverter extends IntEpochConverter {
  /// Builds a [IntEpochInMilisecondsConverter]
  const IntEpochInMilisecondsConverter() : super(unit: EpochUnit.miliseconds);
}

/// Converts a value in microseconds to a datetime and vice-versa
class IntEpochInMicrocondsConverter extends IntEpochConverter {
  /// Builds a [IntEpochInMicrocondsConverter]
  const IntEpochInMicrocondsConverter() : super(unit: EpochUnit.microseconds);
}

/// Converts a String in seconds to a datetime and vice-versa
class StringEpochInSecondsConverter extends StringEpochConverter {
  /// Builds a [StringEpochInSecondsConverter]
  const StringEpochInSecondsConverter() : super(unit: EpochUnit.seconds);
}

/// Converts a String in miliseconds to a datetime and vice-versa
class StringEpochInMilisecondsConverter extends StringEpochConverter {
  /// Builds a [StringEpochInMilisecondsConverter]
  const StringEpochInMilisecondsConverter()
      : super(unit: EpochUnit.miliseconds);
}

/// Converts a String in microseconds to a datetime and vice-versa
class StringEpochInMicrocondsConverter extends StringEpochConverter {
  /// Builds a [StringEpochInMicrocondsConverter]
  const StringEpochInMicrocondsConverter()
      : super(unit: EpochUnit.microseconds);
}
