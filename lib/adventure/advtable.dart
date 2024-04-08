import 'package:flutter/material.dart';

Table mytable = Table(
  columnWidths: const <int, TableColumnWidth>{
    0: FractionColumnWidth(0.25),
    1: FlexColumnWidth(0.75),
  },
  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
  children: [
    TableRow(children: [
      Container(
        padding: const EdgeInsets.all(8),
        color: const Color(0xFFF7A81A),
        child: const Text(
          'Day',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      const TableCell(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          '1',
        ),
      )),
    ]),
    TableRow(children: [
      Container(
        padding: const EdgeInsets.all(8),
        color: const Color(0xFFF7A81A),
        child: const Text(
          'Activity',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      const TableCell(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Skardu'),
      )),
    ]),
    TableRow(children: [
      Container(
        padding: const EdgeInsets.all(8),
        color: const Color(0xFFF7A81A),
        child: const Text(
          'Traffic',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      const TableCell(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Jeep'),
      )),
    ]),
    TableRow(children: [
      Container(
        padding: const EdgeInsets.all(8),
        color: const Color(0xFFF7A81A),
        child: const Text(
          'Time',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      const TableCell(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('5-6 Hours'),
      )),
    ]),
    TableRow(children: [
      Container(
        padding: const EdgeInsets.all(8),
        color: const Color(0xFFF7A81A),
        child: const Text(
          'Height',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      const TableCell(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('3050m'),
      )),
    ]),
    TableRow(children: [
      Container(
        padding: const EdgeInsets.all(8),
        color: const Color(0xFFF7A81A),
        child: const Text(
          'Condition',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      const TableCell(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Camp'),
      )),
    ])
  ],
);
