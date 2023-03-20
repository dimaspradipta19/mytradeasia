class FaqModel {
  FaqModel({
    required this.faqQuestion,
    required this.faqAnswer,
  });

  String faqQuestion;
  String faqAnswer;

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
        faqQuestion: json["faq_question"],
        faqAnswer: json["faq_answer"],
      );

  Map<String, dynamic> toJson() => {
        "faq_question": faqQuestion,
        "faq_answer": faqAnswer,
      };
}
