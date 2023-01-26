class UnknowErrorException implements Exception {
  final String tentativeError;
  UnknowErrorException({
    required this.tentativeError,
  });
}
