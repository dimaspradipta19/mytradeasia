import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mytradeasia/features/domain/entities/searates_entities/searates_route_entity.dart';

abstract class SearatesRouteState extends Equatable {
  final SearatesRouteEntity? route;
  final DioException? error;

  const SearatesRouteState({this.route, this.error});

  @override
  List<Object?> get props => [route, error];
}

class SearatesRouteLoading extends SearatesRouteState {
  const SearatesRouteLoading();
}

class SearatesRouteDone extends SearatesRouteState {
  const SearatesRouteDone(SearatesRouteEntity route) : super(route: route);
}

class SearatesRouteError extends SearatesRouteState {
  const SearatesRouteError(DioException error) : super(error: error);
}
