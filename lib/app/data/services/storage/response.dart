class CacheResponse<T> {
  final T data;
  final bool success;
  final String? message;

  CacheResponse(this.data, this.success, {this.message = 'Success'});
}
