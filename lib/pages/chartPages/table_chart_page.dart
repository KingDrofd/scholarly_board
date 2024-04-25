import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarly_board/utils/variables_dev.dart';

class TableChartPage extends StatefulWidget {
  const TableChartPage({super.key});

  @override
  State<TableChartPage> createState() => _TableChartPageState();
}

class _TableChartPageState extends State<TableChartPage> {
  List<dynamic> data = []; // Define the data variable
  bool _ascending = true;
  int _sortColumnIndex = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    String jsonData =
        await DefaultAssetBundle.of(context).loadString('$sampleJSON');
    setState(() {
      data = json.decode(jsonData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: data.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Transform.translate(
                  offset: Offset(0, 50),
                  child: DataTable(
                    sortAscending: _ascending,
                    sortColumnIndex: 0, // Default sorting by the first column
                    columns: _buildColumns(data.first.keys.toList()),
                    rows: _buildRows(data.first.keys.toList()),
                  ),
                ),
        ),
      ),
    );
  }

  List<DataColumn> _buildColumns(List<String> keys) {
    return keys
        .asMap()
        .entries
        .map(
          (entry) => DataColumn(
            label: Text(entry.value),
            onSort: (columnIndex, ascending) {
              setState(() {
                _sort(entry.key, ascending);
              });
            },
          ),
        )
        .toList();
  }

  List<DataRow> _buildRows(List<String> keys) {
    return data.map((item) {
      return DataRow(
        cells: keys.map((key) => DataCell(Text(item[key].toString()))).toList(),
      );
    }).toList();
  }

  void _sort(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _ascending = ascending;

      data.sort((a, b) {
        final aValue = a.values.toList()[columnIndex];
        final bValue = b.values.toList()[columnIndex];
        if (aValue is Comparable && bValue is Comparable) {
          return ascending
              ? Comparable.compare(aValue, bValue)
              : Comparable.compare(bValue, aValue);
        } else {
          return 0;
        }
      });

      // Toggle the sorting order for next time
      _ascending = !_ascending;
    });
  }
}
