import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/domain/entities/faq_entities/faq_entity.dart';

abstract class FaqRepository {
  Future<DataState<List<FaqEntity>>> getFAQData();
}
