import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String? enumToString(dynamic e) {
  if (e == null) {
    return null;
  }
  return e.toString().split('.').last;
}

extension StringExtension on String {
  T? toEnum<T>(List<T> list) {
    try {
      final T item = list.firstWhere(
        (T e) {
          final String t = e.toString().split('.').last;
          return t == this;
        },
      );
      return item;
    } catch (_) {}
    return null;
  }

  String pageParams([Map<String, String> params = const {}]) {
    var router = this;
    if (params.isNotEmpty) {
      params.forEach((key, value) {
        if (key == params.keys.first) {
          router = '$router?$key=$value';
        } else {
          router = '$router&$key=$value';
        }
      });
    }
    return router;
  }
}

extension TextExtension on String {
  Text bodyMedium({Color? color}) {
    return Text(
      this,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      ),
    );
  }

  Text bodyLarge({Color? color}) {
    return Text(
      this,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      ),
    );
  }

  Text bodyMediumRed({Color? color}) {
    return Text.rich(
      TextSpan(
          text: this,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: color ?? Colors.black,
          ),
          children: [
            TextSpan(
                text: '*',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.red,
                ))
          ]),
    );
  }

  Text bodyLargeRed({Color? color}) {
    return Text.rich(
      TextSpan(
          text: this,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
            color: color ?? Colors.black,
          ),
          children: [
            TextSpan(
                text: '*',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.red,
                ))
          ]),
    );
  }
}
