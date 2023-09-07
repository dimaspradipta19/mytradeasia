abstract class DhlShipmentEvent {
  const DhlShipmentEvent();
}

class FetchDhlShipment extends DhlShipmentEvent {
  final String trackingNumber;
  const FetchDhlShipment(this.trackingNumber);
}
