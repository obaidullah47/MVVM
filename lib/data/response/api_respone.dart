import 'package:mvvm/data/response/status.dart';

class ApiRespone<T> {
  Status? status;
  T? data;
  String? message;

  ApiRespone(this.status, this.message, this.data);
  ApiRespone.loading() : status = Status.LOADING;
  ApiRespone.complete() : status = Status.COMPLETED;
  ApiRespone.error() : status = Status.ERROR;
  @override
  String toString() {
    return 'Status : $status \n Message : $message \n Data : $data';
  }
}
