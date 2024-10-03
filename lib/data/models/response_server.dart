class ResponseServer {
  final dynamic data;
  final dynamic statusCode;

  ResponseServer({this.data, this.statusCode});

  @override
  String toString() {
    return 'statusCode: $statusCode\ndata: $data';
  }
}
