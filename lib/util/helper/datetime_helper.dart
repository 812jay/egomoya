import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeHelper {
  static DateTime timestampToDateTime(Timestamp timestamp) {
    return DateTime.parse(timestamp.toDate().toString());
  }

  static String formatRelativeDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    // 초 단위로 계산
    if (difference.inSeconds < 60) {
      return '방금';
    }

    // 분 단위로 계산
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}분 전';
    }

    // 시간 단위로 계산
    if (difference.inHours < 24) {
      return '${difference.inHours}시간 전';
    }

    // 하루가 지난 경우
    if (difference.inDays == 1) {
      return '어제';
    }

    // 이틀 이상 지난 경우
    if (difference.inDays < 31) {
      return '${difference.inDays}일 전';
    }

    // 한 달 이상 지난 경우
    if (difference.inDays < 365) {
      final months =
          (now.year - dateTime.year) * 12 + now.month - dateTime.month;
      return '$months달 전';
    }

    // 일 년 이상 지난 경우
    final years = now.year - dateTime.year;
    return '$years년 전';
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
