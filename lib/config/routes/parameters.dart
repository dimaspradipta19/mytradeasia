import 'package:mytradeasia/features/domain/entities/product_entities/product_to_rfq_entity.dart';

class TrackingDocumentParameter {
  String product;
  int indexProducts;
  TrackingDocumentParameter(
      {required this.product, required this.indexProducts});
}

class TrackingShipmentParameter {
  String product;
  int indexProducts;
  TrackingShipmentParameter(
      {required this.product, required this.indexProducts});
}

class QuotationDetailParameter {
  String status;
  bool? isSales;
  QuotationDetailParameter({required this.status, this.isSales});
}

class MessageDetailParameter {
  String otherUserId;
  String currentUserId;
  String chatId;
  String channelUrl;
  MessageDetailParameter(
      {required this.otherUserId,
      required this.currentUserId,
      required this.chatId,
      required this.channelUrl});
}

class BiodataParameter {
  String email;
  String phone;
  BiodataParameter({required this.email, required this.phone});
}

class RequestQuotationParameter {
  List<ProductToRfq> products;
  RequestQuotationParameter({required this.products});
}
