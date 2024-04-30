import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeHelper {
  static DateTime timestampToDateTime(Timestamp timestamp) {
    return DateTime.parse(timestamp.toDate().toString());
  }
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

class DateTimeConverter implements JsonConverter<Timestamp, DateTime> {
  const DateTimeConverter();

  @override
  Timestamp fromJson(DateTime dateTime) {
    return Timestamp.fromDate(dateTime);
  }

  @override
  DateTime toJson(Timestamp timestamp) => timestamp.toDate();
}
