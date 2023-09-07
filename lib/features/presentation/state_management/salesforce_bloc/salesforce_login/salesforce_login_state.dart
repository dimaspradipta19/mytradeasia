import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mytradeasia/features/domain/entities/sales_force_login_entities/sales_force_login_entity.dart';

abstract class SalesforceLoginState extends Equatable {
  final SalesforceLoginEntity? loginEntity;
  final DioException? error;

  const SalesforceLoginState({this.loginEntity, this.error});

  @override
  List<Object?> get props => [loginEntity, error];
}

class SalesforceLoginLoading extends SalesforceLoginState {
  const SalesforceLoginLoading();
}

class SalesforceLoginDone extends SalesforceLoginState {
  const SalesforceLoginDone(SalesforceLoginEntity loginEntity)
      : super(loginEntity: loginEntity);
}

class SalesforceLoginError extends SalesforceLoginState {
  const SalesforceLoginError(DioException error) : super(error: error);
}
