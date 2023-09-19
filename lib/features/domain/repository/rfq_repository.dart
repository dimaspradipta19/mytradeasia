import 'package:mytradeasia/features/domain/entities/rfq_entities/rfq_entity.dart';

import '../../../core/resources/data_state.dart';

abstract class RfqRepository {
  Future<DataState<dynamic>> submitRfq(RfqEntity s);
}
