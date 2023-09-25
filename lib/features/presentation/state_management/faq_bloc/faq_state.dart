import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mytradeasia/features/domain/entities/faq_entities/faq_entity.dart';

abstract class FaqState extends Equatable {
  final List<FaqEntity>? faqData;
  final DioException? error;

  const FaqState({this.faqData, this.error});

  @override
  List<Object> get props => [faqData!, error!];
}

class FaqLoading extends FaqState {
  const FaqLoading();
}

class FaqDone extends FaqState {
  const FaqDone(List<FaqEntity> faqData) : super(faqData: faqData);
}

class FaqError extends FaqState {
  const FaqError(DioException error) : super(error: error);
}
