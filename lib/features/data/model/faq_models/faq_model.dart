import 'package:mytradeasia/features/domain/entities/faq_entities/faq_entity.dart';

class FaqModel extends FaqEntity {
  const FaqModel({
    String? faqQuestion,
    String? faqAnswer,
  }) : super(faqQuestion: faqQuestion, faqAnswer: faqAnswer);

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
        faqQuestion: json["faq_question"],
        faqAnswer: json["faq_answer"],
      );
}
