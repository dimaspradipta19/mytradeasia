abstract class DetailProductEvent {
  const DetailProductEvent();
}

class GetDetailProductEvent extends DetailProductEvent {
  final String product;
  const GetDetailProductEvent(this.product);
}
