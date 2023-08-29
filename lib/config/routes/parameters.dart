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
