abstract class SearatesRouteEvent {
  const SearatesRouteEvent();
}

class GetRoute extends SearatesRouteEvent {
  final String number;
  final String type;
  final String sealine;

  GetRoute(this.number, this.type, this.sealine);
}
