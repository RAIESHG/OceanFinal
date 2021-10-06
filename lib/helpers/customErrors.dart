class CustomException implements Exception {
  final _message;
  CustomException([this._message]);
  String toString() {
    return "$_message";
  }
}
class FetchDataException extends CustomException {
  FetchDataException([String? message]) : super(message,);
}
class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message);
}
class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message);
}
class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message);
}
