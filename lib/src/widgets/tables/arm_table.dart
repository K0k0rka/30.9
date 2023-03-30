import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class ArmTable extends StatelessWidget {
  final List<DataRow> dataRowList;

  const ArmTable({Key? key, required this.dataRowList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 4,
        child: DataTable2(
          columns: [
            DataColumn2(label: Text(''), fixedWidth: 30),
            DataColumn2(label: Text('№'),fixedWidth: 30),
            DataColumn2(label: Text('Инв. номер'),fixedWidth: 100),
            DataColumn2(label: Text('Сотрудник'),size: ColumnSize.S),
            DataColumn2(label: Text(''))
          ],
          rows: [],
        ) ,
        );
  }
}

