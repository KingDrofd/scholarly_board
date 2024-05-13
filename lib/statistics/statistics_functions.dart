class Statistics {
  Map<int, double> calculateAverages(
      String attributeName, String xAttributeName, var studentData) {
    Map<int, double> averages = {};
    Map<int, int> counts = {};

    for (var student in studentData!) {
      int attributeCount = student[xAttributeName];
      if (student.containsKey(attributeName)) {
        double value = student[attributeName].toDouble();
        if (averages.containsKey(attributeCount)) {
          averages[attributeCount] =
              (averages[attributeCount]! * counts[attributeCount]! + value) /
                  (counts[attributeCount]! + 1);
          counts[attributeCount] = counts[attributeCount]! + 1;
        } else {
          averages[attributeCount] = value;
          counts[attributeCount] = 1;
        }
      }
    }

    return averages;
  }
}
