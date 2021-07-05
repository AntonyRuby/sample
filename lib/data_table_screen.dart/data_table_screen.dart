import 'package:flutter/material.dart';
import 'package:sample/qr_scan_screen/qr_code_screen.dart';

class TableScreen extends StatefulWidget {
  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  List<Data>? users;
  List<Data>? selectedUsers;
  bool? sort;

  @override
  void initState() {
    sort = false;
    selectedUsers = [];
    // users = Data.getUsers();
    super.initState();
  }

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        datas.sort((a, b) => a.name.compareTo(b.name));
      } else {
        datas.sort((a, b) => b.name.compareTo(a.name));
      }
    }
  }

  onSelectedRow(bool selected, Data user) async {
    setState(() {
      if (selected) {
        selectedUsers!.add(user);
      } else {
        selectedUsers!.remove(user);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Table Screen"),
            actions: [
              IconButton(
                  icon: Icon(Icons.forward),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QrcodeScannerScreen()));
                  })
            ],
          ),
          body: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.black),
            child: DataTable(
                sortAscending: sort!,
                sortColumnIndex: 0,
                // showCheckboxColumn: true,
                dataRowHeight: 70,
                headingRowHeight: 60,
                headingRowColor:
                    MaterialStateColor.resolveWith((states) => Colors.grey),
                columns: [
                  DataColumn(
                      label: Text("Name"),
                      numeric: false,
                      tooltip: "Display in Ascending",
                      onSort: (columnIndex, ascending) {
                        setState(() {
                          sort = sort;
                          // datas.sort((a, b) => a.name.compareTo(b.name));
                        });
                        onSortColum(columnIndex, ascending);
                      }),
                  // onSort: (i, b) => {
                  //   print("$i, $b"),
                  //   setState(() {
                  //     datas.sort((a, b) => a.name.compareTo(b.name));
                  //   })
                  // },
                  // ),
                  DataColumn(
                    label: Text("Age"),
                    // onSort: (i, b) => {
                    //   print("$i, $b"),
                    //   setState(() {
                    //     datas.sort((a, b) => a.age.compareTo(b.age));
                    //   })
                    // },
                  ),
                  DataColumn(label: Text("Designation"))
                ],
                // rows: [
                // DataRow(

                //     // color: MaterialStateColor.resolveWith((states) {
                //     //   return index % 2 == 0
                //     //       ? Colors.red
                //     //       : Colors.black; //make tha magic!
                //     // }),
                //     cells: [
                //       DataCell(Text("Name"), placeholder: true),
                //       DataCell(Text("23")),
                //       DataCell(Text("Student")),
                //     ]),
                // DataRow(
                //     // selected: ,
                //     cells: [
                //       DataCell(Text("A"), showEditIcon: true, onTap: () {}),
                //       DataCell(Text("23")),
                //       DataCell(Text("Student")),
                //     ]),

                rows: datas
                    .map(
                      (e) => DataRow(
                          selected: selectedUsers!.contains(e),
                          onSelectChanged: (b) {
                            print("Onselect");
                            onSelectedRow(b!, e);
                          },
                          // selected: selectedData.c
                          // onSelectChanged: (val) {
                          //   setState(() {
                          //     selectedIndex = 0;
                          //   });
                          // },
                          cells: [
                            DataCell(Text(e.name),
                                showEditIcon: false, onTap: () {}),
                            DataCell(Text(e.age)),
                            DataCell(Text(e.designation)),
                          ]),
                    )
                    .toList()),
          ),
        ));
  }
}

class Data {
  String name;
  String age;
  String designation;

  Data(this.name, this.age, this.designation);
}

var datas = <Data>[
  Data("a", "24", "working"),
  Data("c", "15", "student"),
  Data("b", "23", "collage")
];
