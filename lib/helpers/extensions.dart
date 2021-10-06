import 'package:intl/intl.dart';
import 'package:nepali_utils/nepali_utils.dart';

extension Capitalize on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.inCaps).join(" ");
}

extension Currency on String {
  String get toCurrency => "Rs. $this";
}

extension HtmlTags on String {
  String get ashtmlTags => removeAllHtmlTags(this);
}

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

extension DateFormatExtension on DateTime {
  String? get format =>
      this != null ? DateFormat('yyy-MM-dd').format(this) : null;
  String? get formatInNepali => this != null
      ? NepaliDateFormat('yyy-MMM-dd').format(this.toNepaliDateTime())
      : null;
  // String get allInCaps => this.toUpperCase();
  // String get capitalizeFirstofEach =>
  //     this.split(" ").map((str) => str.inCaps).join(" ");
}
