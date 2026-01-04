class ResponseWrapper<T> {
  final dynamic status;
  final dynamic code;
  final dynamic message;
  final T? data;
  final dynamic timestamp;
  final dynamic path;
  final dynamic totalCount;
  final dynamic sub;
  final dynamic journeyId;

  ResponseWrapper({
    this.status,
    this.code,
    this.message,
    this.data,
    this.timestamp,
    this.totalCount,
    this.path,
    this.sub,
    this.journeyId,
  });

  factory ResponseWrapper.fromJson(Map<String, dynamic> json,T Function(Object?) fromDataJson) {
    return ResponseWrapper(
      status: json['status'],
      code: json['code'],
      message: json['message'].toString(),
      timestamp: json['timestamp'],
      totalCount: json['totalCount'],
      data: json['data'] != null ? fromDataJson(json['data']) : null,
      path: json['path'],
      sub: json['sub'],
      journeyId: json['journeyId'],
    );
  }
}