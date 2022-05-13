// import 'package:flutter/material.dart';
// import 'package:collection/collection.dart';

// class PlayerListColumn extends StatefulWidget {
//   @override
//   _PlayerListColumnState createState() => _PlayerListColumnState();
// }

// class _PlayerListColumnState extends State<PlayerListColumn> {
//   // The following list is already sorted by id
//   List<Map> _books = [
//     {'id': 100, 'title': 'Flutter Basics', 'author': 'David John'},
//     {'id': 101, 'title': 'Flutter Basics', 'author': 'David John'},
//     {'id': 102, 'title': 'Git and GitHub', 'author': 'Merlin Nick'}
//   ];
//   List<bool> _selected = [];
//   @override
//   void initState() {
//     super.initState();
//     _selected = List<bool>.generate(_books.length, (int index) => false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('DataTable Demo'),
//         ),
//         body: ListView(
//           children: [_createDataTable()],
//         ),
//       ),
//     );
//   }

//   DataTable _createDataTable() {
//     return DataTable(columns: _createColumns(), rows: _createRows());
//   }

//   List<DataColumn> _createColumns() {
//     return [
//       DataColumn(label: Text('ID')),
//       DataColumn(label: Text('Book')),
//       DataColumn(label: Text('Author'))
//     ];
//   }

//   List<DataRow> _createRows() {
//     return _books
//         .mapIndexed((index, book) => DataRow(
//                 cells: [
//                   DataCell(Text('#' + book['id'].toString())),
//                   DataCell(Text(book['title'])),
//                   DataCell(Text(book['author']))
//                 ],
//                 selected: _selected[index],
//                 onSelectChanged: (bool? selected) {
//                   setState(() {
//                     _selected[index] = selected!;
//                   });
//                 }))
//         .toList();
//   }
// }
