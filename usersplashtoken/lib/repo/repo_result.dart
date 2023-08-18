import 'package:equatable/equatable.dart';

abstract class Result implements Equatable {
  @override
  bool get stringify => false;
}

abstract class DataResult<TModel> extends Result implements Equatable {
  @override
  bool get stringify => false;
}

class Success extends Result {
  @override
  List<Object> get props => [];
}

class SuccessData<TModel> extends DataResult<TModel> {
  final TModel model;

  SuccessData(this.model);

  @override
  List<Object?> get props => [model];
}

class Fail extends Result {
  final RepoError error;
  final String? message;

  Fail(this.error, {this.message});

  @override
  List<Object?> get props => [error, message];
}

class FailData<TModel> extends DataResult<TModel> {
  final RepoError error;
  final String? message;

  FailData(this.error, {this.message});

  @override
  List<Object?> get props => [error, message];
}

class RepoError implements Equatable {
  final int statusCode;

  RepoError(this.statusCode);

  @override
  List<Object> get props => [statusCode];

  @override
  bool get stringify => false;
}
