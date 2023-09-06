abstract class SearchProductEvent {
  const SearchProductEvent();
}

class SearchProduct extends SearchProductEvent {
  final String query;
  const SearchProduct(this.query);
}
