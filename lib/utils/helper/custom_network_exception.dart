class CustomNetworkException implements Exception {
  final Map<dynamic, dynamic> data;

  CustomNetworkException({required this.data});
}
