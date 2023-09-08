abstract class SalesforceDataEvent {
  const SalesforceDataEvent();
}

class GetDataSalesforce extends SalesforceDataEvent {
  final String token;
  const GetDataSalesforce(this.token);
}
