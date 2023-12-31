import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? dioException;

  const DataState({this.data, this.dioException});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFail<T> extends DataState<T> {
  const DataFail(DioException dioException) : super(dioException: dioException);
}
