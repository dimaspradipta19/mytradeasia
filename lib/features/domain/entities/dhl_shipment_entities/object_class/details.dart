import 'package:mytradeasia/features/domain/entities/dhl_shipment_entities/object_class/proof_of_delivery.dart';

class Details {
  final ProofOfDelivery? proofOfDelivery;
  final bool? proofOfDeliverySignedAvailable;
  final int? totalNumberOfPieces;
  final List<String>? pieceIds;

  const Details({
    required this.proofOfDelivery,
    required this.proofOfDeliverySignedAvailable,
    required this.totalNumberOfPieces,
    required this.pieceIds,
  });
}
