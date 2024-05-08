import 'dart:convert';
import 'dart:io';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarly_board/models/student_model.dart';

import 'package:scholarly_board/utils/variables_dev.dart';

class BarChartPage extends StatefulWidget {
  const BarChartPage({super.key});

  @override
  State<BarChartPage> createState() => _BarChartPageState();
}

class _BarChartPageState extends State<BarChartPage> {
  List<Map<String, dynamic>> studentData = [];
  @override
  void initState() {
    _loadJsonFile();
    loadStudentData();
    super.initState();
  }

  Future<String> _loadJsonFile() async {
    return await File(sampleJSON).readAsString();
  }

  Future<List<Map<String, dynamic>>> loadStudentData() async {
    try {
      String jsonString = await _loadJsonFile();

      return jsonDecode(jsonString).cast<Map<String, dynamic>>();
    } catch (e) {
      print("Error loading data: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Data Chart'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: loadStudentData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<Map<String, dynamic>> studentData = snapshot.data ?? [];

            Map<int, double> ageAverages = {};
            Map<int, int> ageCounts = {};

            List<Map<String, dynamic>> uniqueStudentes = [];
            for (var student in studentData) {
              int age = student['age'];
              int readingScore = student['reading score'];
              if (ageAverages.containsKey(age)) {
                ageAverages[age] =
                    (ageAverages[age]! * ageCounts[age]! + readingScore) /
                        (ageCounts[age]! + 1);
              } else {
                ageAverages[age] = readingScore.toDouble();
                ageCounts[age] = 1;
              }
            }
            List<Map<String, dynamic>> chartData = [];

            ageAverages.forEach((age, average) {
              chartData.add({'age': age, 'average reading score': average});
            });

            chartData.sort((a, b) => a['age'].compareTo(b['age']));
            const maxStudentsToShow = 30;
            chartData = chartData.take(maxStudentsToShow).toList();
            print(chartData);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Note de Mathematics par Age',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.maxFinite,
                    height: 500,
                    child: BarChart(
                      BarChartData(
                        maxY: 100,
                        alignment: BarChartAlignment.spaceAround,
                        groupsSpace: 12,
                        barTouchData: BarTouchData(enabled: false),
                        titlesData: FlTitlesData(
                          show: true,
                        ),
                        borderData: FlBorderData(show: false),
                        barGroups: List.generate(
                          chartData.length,
                          (index) => BarChartGroupData(
                            x: chartData[index]['age'],
                            barRods: [
                              BarChartRodData(
                                toY: chartData[index]['average reading score'],
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class DataPoint {
  final int age;
  final int writingScore;
  DataPoint({required this.age, required this.writingScore});
  factory DataPoint.fromJson(Map json) {
    return DataPoint(age: json['age'], writingScore: json['writing score']);
  }
}
