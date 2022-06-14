import 'package:grpc/grpc.dart';

abstract class DataState<T> {
  final T? data;
  final GrpcError? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(GrpcError error) : super(error: error);
}
