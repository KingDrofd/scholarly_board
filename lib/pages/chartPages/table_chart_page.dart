import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarly_board/models/student_model.dart';
import 'package:scholarly_board/utils/variables_dev.dart';

class TableChartPage extends StatefulWidget {
  const TableChartPage({super.key});

  @override
  State<TableChartPage> createState() => _TableChartPageState();
}

class _TableChartPageState extends State<TableChartPage> {
  Future<String> _loadJsonFile() async {
    return await File(sampleJSON).readAsString();
  }

  Future _parseJson() async {
    String jsonString = await _loadJsonFile();
    List data = jsonDecode(jsonString);

    List students = data.map((json) {
      return Student.fromJson(json);
    }).toList();

    return students;
  }

  @override
  void initState() {
    _loadJsonFile();
    _parseJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FutureBuilder(
          future: Future.delayed(Duration(seconds: 1), () => _parseJson()),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                  width: 300, child: const LinearProgressIndicator());
            } else if (snapshot.hasError) {
              return SelectableText("Error: ${snapshot.error}");
            } else {
              return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: StudentsDataTable(students: snapshot.data!));
            }
          },
        ),
      ),
    );
  }
}

class StudentList extends StatelessWidget {
  final List students;

  const StudentList({super.key, required this.students});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        print('Student: ${student.name}');
        return ListTile(
          title: Text(student.name),
        );
      },
    );
  }
}

class StudentsDataTable extends StatelessWidget {
  final List students;

  const StudentsDataTable({super.key, required this.students});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Age')),
        DataColumn(label: Text('Gender')),
        DataColumn(label: Text('Race/Ethnicity')),
        DataColumn(label: Text('Parental Level of Education')),
        DataColumn(label: Text('Lunch')),
        DataColumn(label: Text('Test Preparation Course')),
        DataColumn(label: Text('Math Score')),
        DataColumn(label: Text('Reading Score')),
        DataColumn(label: Text('Physics Score')),
        DataColumn(label: Text('Writing Score')),
      ],
      rows: students.map((student) {
        return DataRow(cells: [
          DataCell(Text(student.name)),
          DataCell(Text(student.age.toString())),
          DataCell(Text(student.gender)),
          DataCell(Text(student.raceEthnicity)),
          DataCell(Text(student.parentalLevelOfEducation)),
          DataCell(Text(student.lunch)),
          DataCell(Text(student.testPreparationCourse)),
          DataCell(Text(student.mathScore.toString())),
          DataCell(Text(student.readingScore.toString())),
          DataCell(Text(student.physicsScore.toString())),
          DataCell(Text(student.writingScore.toString())),
        ]);
      }).toList(),
    );
  }
}
