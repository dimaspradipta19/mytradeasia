class Address {
  final String? addressLocality;

  const Address({
    required this.addressLocality,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressLocality: json["addressLocality"],
      );
}
