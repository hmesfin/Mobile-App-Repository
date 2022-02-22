class HelpModel {
  final int faqId;
  final String question;
  final String answer;
  final String createdAt;
  final String updatedAt;

  HelpModel(
      {this.faqId, this.question, this.answer, this.createdAt, this.updatedAt});

  factory HelpModel.fromJson(Map<String, dynamic> parsedJson) {
    return HelpModel(
      faqId: parsedJson['faq_id'],
      question: parsedJson['question'],
      answer: parsedJson['answer'],
      createdAt: parsedJson['createdAt'],
      updatedAt: parsedJson['updatedAt'],
    );
  }
}
