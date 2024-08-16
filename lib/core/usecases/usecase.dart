import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// The [NoParams] class is used when a use case does not require any parameters.
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
