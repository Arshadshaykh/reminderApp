import 'dart:math';

int generateUniqueId() {
  int randomNumber = Random().nextInt(pow(2, 20).toInt());
  int uniqueId = randomNumber;
  return uniqueId;
}
String extractTimeFromString(String timeOfDayString) {
    if (!timeOfDayString.startsWith("TimeOfDay(") ||
        !timeOfDayString.endsWith(")")) {
      return ""; // Handle invalid input gracefully (optional)
    }

    // Extract the time part within parentheses
    return timeOfDayString.substring(10, timeOfDayString.length - 1);
  }