class Quiz {
  final String qID;
  final String subject;
  final String expiresOn;
  final List<QuizQuestion> questions;

  Quiz(this.qID, this.subject, this.expiresOn, this.questions);
}

class QuizQuestion {
  final String question;
  final List<String> option;
  final int currentOption;

  QuizQuestion(this.question, this.option, this.currentOption);
}
