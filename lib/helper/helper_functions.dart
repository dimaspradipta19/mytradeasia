dynamic parseDoubleToIntegerIfNecessary(double input) {
  String inputString = input.toString();

  // Check if the input string ends with ".0"
  if (inputString.endsWith('.0')) {
    return int.parse(inputString.split('.').first);
  } else {
    return input;
  }
}
