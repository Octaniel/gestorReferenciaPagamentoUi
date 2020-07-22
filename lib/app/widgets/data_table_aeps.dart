import 'package:flutter/material.dart';

void onSortColum(
    int columnIndex, bool ascending, List ficheirodetalheclientes) {
  if (columnIndex == 0) {
    if (ascending) {
      ficheirodetalheclientes.sort((a, b) => a.entidade.compareTo(b.entidade));
    } else {
      ficheirodetalheclientes.sort((a, b) => b.entidade.compareTo(a.entidade));
    }
  }
}

DataColumn dataColumn(String n) {
  return DataColumn(
    label: Text(
      "$n",
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    ),
    numeric: false,
  );
}

DataCell dataCell(String n) {
  return DataCell(
    Text(n),
    showEditIcon: false,
    placeholder: false,
  );
}
