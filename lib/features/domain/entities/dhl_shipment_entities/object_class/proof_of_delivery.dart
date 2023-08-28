class ProofOfDelivery {
  final DateTime? timestamp;
  final String? signatureUrl;
  final String? documentUrl;

  const ProofOfDelivery({
    required this.timestamp,
    required this.signatureUrl,
    required this.documentUrl,
  });
}
