import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {

  final String message;
  const Failure(this.message);
}

class OfflineFailure extends Failure {
  const OfflineFailure() : super("Network Error. Please try again.");

  @override
  // TODO: implement props
  List<Object?> get props => [];
}class CacheFailure extends Failure {
  const CacheFailure() : super("Cache Error. Please try again.");

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ServerFailure extends Failure{
  const ServerFailure() : super("Server Error. Try again later.");

  @override
  // TODO: implement props
  List<Object?> get props => [];

}class EmptyCacheFailure extends Failure{
  const EmptyCacheFailure() : super("Empty Data !. try again.");

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
