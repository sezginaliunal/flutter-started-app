class ExceptionHandler {
  final String message;

  ExceptionHandler(this.message);

  @override
  String toString() {
    return "Exception: $message";
  }
}
