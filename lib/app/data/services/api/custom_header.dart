class CustomHeaders {
  static Map<String, String> create({
    String contentType = 'application/json; charset=UTF-8',
    String authorization = 'Bearer YOUR_ACCESS_TOKEN',
    String accept = 'application/json',
  }) {
    return {
      'Content-Type': contentType,
      'Authorization': authorization,
      'Accept': accept,
    };
  }
}
