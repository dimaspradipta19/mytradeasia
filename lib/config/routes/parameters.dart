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
  MessageDetailParameter(
      {required this.otherUserId,
      required this.currentUserId,
      required this.chatId});
}
