class Student {
  final String name;
  final int age;
  final String gender;
  final String raceEthnicity;
  final String parentalLevelOfEducation;
  final String lunch;
  final String testPreparationCourse;
  final double mathScore;
  final int readingScore;
  final double physicsScore;
  final int writingScore;

  Student({
    required this.name,
    required this.age,
    required this.gender,
    required this.raceEthnicity,
    required this.parentalLevelOfEducation,
    required this.lunch,
    required this.testPreparationCourse,
    required this.mathScore,
    required this.readingScore,
    required this.physicsScore,
    required this.writingScore,
  });

  factory Student.fromJson(Map json) {
    return Student(
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      raceEthnicity: json['race/ethnicity'],
      parentalLevelOfEducation: json['parental level of education'],
      lunch: json['lunch'],
      testPreparationCourse: json['test preparation course'],
      mathScore: json['math score'] != null ? json['math score'].toDouble() : 0,
      readingScore: json['reading score'] != null ? json['reading score'] : 0,
      physicsScore:
          json['physics score'] != null ? json['physics score'].toDouble() : 0,
      writingScore: json['writing score'] != null ? json['writing score'] : 0,
    );
  }
}
