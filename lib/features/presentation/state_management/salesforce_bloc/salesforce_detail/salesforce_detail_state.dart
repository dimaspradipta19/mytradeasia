import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mytradeasia/features/domain/entities/sales_force_detail_entities/sales_force_detail_entity.dart';

abstract class SalesforceDetailState extends Equatable {
  final SalesforceDetailEntity? detailEntity;
  final DioException? error;

  const SalesforceDetailState({this.detailEntity, this.error});

  @override
  List<Object?> get props => [detailEntity, error];
}

class SalesforceDetailLoading extends SalesforceDetailState {
  const SalesforceDetailLoading();
}

class SalesforceDetailDone extends SalesforceDetailState {
  const SalesforceDetailDone(SalesforceDetailEntity detailEntity)
      : super(detailEntity: detailEntity);
}

class SalesforceDetailError extends SalesforceDetailState {
  const SalesforceDetailError(DioException error) : super(error: error);
}
