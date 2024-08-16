import 'package:equatable/equatable.dart';

/// [Failure] is the base class for all types of failures in the application.
/// It is extended by specific failure classes to represent different failure scenarios.
abstract class Failure extends Equatable {
  // If there are properties that you want to be part of equality comparison, add them to the list.
  const Failure([List properties = const <dynamic>[]]) : super();

  @override
  List<Object?> get props => [];
}

/// [ServerFailure] represents a failure due to server-side errors.
class ServerFailure extends Failure {}

/// [CacheFailure] represents a failure due to caching or local storage errors.
class CacheFailure extends Failure {}

/// [NetworkFailure] represents a failure due to network connectivity issues.
class NetworkFailure extends Failure {}

/// [NoInternetConnection] represents a failure due to lack of internet connectivity.
class NoInternetConnection extends Failure {}

/// [InvalidInputFailure] represents a failure due to invalid input provided by the user.
class InvalidInputFailure extends Failure {}

/// [UnauthorizedFailure] represents a failure due to unauthorized access or invalid credentials.
class UnauthorizedFailure extends Failure {}

/// [UnexpectedFailure] represents an unexpected or unknown failure.
class UnexpectedFailure extends Failure {}
