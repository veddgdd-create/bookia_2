import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object> get props => [];
}

// Server Failure
class ServerFailure extends Failure {
  final String message;
  const ServerFailure(this.message);

  @override
  List<Object> get props => [message];
}

// Cache Failure
class CacheFailure extends Failure {}

// Network Failure
class NetworkFailure extends Failure {}
