import 'package:mvvm/data/response/status.dart';

// Fixed: Renamed class from ApiRespone to ApiResponse
class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.message, this.data);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.complete(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;
}
