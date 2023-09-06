import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mytradeasia/features/domain/entities/all_industry_entities/all_industry_entity.dart';

abstract class IndustryState extends Equatable {
  final AllIndustryEntity? industry;
  final DioException? error;

  const IndustryState({this.industry, this.error});

  @override
  List<Object> get props => [industry!, error!];
}

class IndustryLoading extends IndustryState {
  const IndustryLoading();
}

class IndustryDone extends IndustryState {
  const IndustryDone(AllIndustryEntity industry) : super(industry: industry);
}

class IndustryError extends IndustryState {
  const IndustryError(DioException error) : super(error: error);
}
