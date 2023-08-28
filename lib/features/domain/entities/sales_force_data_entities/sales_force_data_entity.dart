import 'package:equatable/equatable.dart';

class SalesforceDataModel extends Equatable {
  final int totalSize;
  final bool done;
  final String nextRecordsUrl;
  final List<Record> records;

  SalesforceDataModel({
    required this.totalSize,
    required this.done,
    required this.nextRecordsUrl,
    required this.records,
  });

  @override
  List<Object?> get props {
    return [
      this.totalSize,
      this.done,
      this.nextRecordsUrl,
      this.records,
    ];
  }
}

class Record {
  final Attributes attributes;
  final String id;
  final String name;
  final String? phone;

  Record({
    required this.attributes,
    required this.id,
    required this.name,
    required this.phone,
  });
}

class Attributes {
  final Type type;
  final String url;

  Attributes({
    required this.type,
    required this.url,
  });
}
