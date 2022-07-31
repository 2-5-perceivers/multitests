String printDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  if (duration.inHours > 0) {
    return '${twoDigits(duration.inHours)} hours $twoDigitMinutes minutes';
  } else {
    return '$twoDigitMinutes minutes';
  }
}
