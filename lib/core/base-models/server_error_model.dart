class ServerException {
  final String message;
  final int code;

  const ServerException({
    required this.message,
    required this.code,
  });
}
