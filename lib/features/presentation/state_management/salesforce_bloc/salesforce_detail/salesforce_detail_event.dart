abstract class SalesforceDetailEvent {
  const SalesforceDetailEvent();
}

class GetDetailSalesforce extends SalesforceDetailEvent {
  final Map<String, dynamic> detailData;
  const GetDetailSalesforce(this.detailData);
}
