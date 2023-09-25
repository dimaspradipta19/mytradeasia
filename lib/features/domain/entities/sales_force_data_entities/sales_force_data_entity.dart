import 'package:equatable/equatable.dart';

class SalesforceDataEntity extends Equatable {
  final int? totalSize;
  final bool? done;
  final String? nextRecordsUrl;
  final List<Record>? records;

  const SalesforceDataEntity({
    required this.totalSize,
    required this.done,
    required this.nextRecordsUrl,
    required this.records,
  });

  @override
  List<Object?> get props {
    return [
      totalSize,
      done,
      nextRecordsUrl,
      records,
    ];
  }
}

class Record {
  final Attributes? attributes;
  final String? id;
  final String? name;
  final String? phone;

  const Record({
    required this.attributes,
    required this.id,
    required this.name,
    required this.phone,
  });
}

class Attributes {
  final String? type;
  final String? url;

  const Attributes({
    required this.type,
    required this.url,
  });
}
