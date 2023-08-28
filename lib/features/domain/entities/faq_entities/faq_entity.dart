import 'package:equatable/equatable.dart';

class FaqEntity extends Equatable {
  final String? faqQuestion;
  final String? faqAnswer;

  const FaqEntity({
    this.faqQuestion,
    this.faqAnswer,
  });

  @override
  List<Object?> get props {
    return [
      this.faqQuestion,
      this.faqAnswer,
    ];
  }
}
