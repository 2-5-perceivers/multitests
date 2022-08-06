class QuestionResponse {
  const QuestionResponse(
    this.valueKey,
    this.value, {
    this.intChoice,
    this.boolChoice,
    this.stringResponse,
  });

  final String valueKey;
  final int value;
  final int? intChoice;
  final bool? boolChoice;
  final String? stringResponse;
}
