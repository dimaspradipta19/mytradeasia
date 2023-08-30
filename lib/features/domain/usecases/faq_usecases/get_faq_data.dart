import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/entities/faq_entities/faq_entity.dart';
import 'package:mytradeasia/features/domain/repository/faq_repository.dart';

class GetFaqData implements UseCase<DataState<List<FaqEntity>>, void> {
  final FaqRepository _faqRepository;

  GetFaqData(this._faqRepository);

  @override
  Future<DataState<List<FaqEntity>>> call({void param}) {
    return _faqRepository.getFAQData();
  }
}
