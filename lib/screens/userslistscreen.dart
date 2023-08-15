import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/usersprovider.dart';
import 'package:stopwatch/variables.dart';

class UsersListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);

    if (usersProvider.usersData.isEmpty) {
      usersProvider.fetchData();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Time Records'),
      ),
      body: usersProvider.usersData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                width: MediaQuery.of(context).size.width,
                child: DataTable(
                  headingTextStyle: kheadingStyle,
                  dataTextStyle: knormalStyle,
                  columns: [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Time')),
                  ],
                  rows: usersProvider.usersData.map((userData) {
                    final uname = userData['uname'] as String;
                    final time = userData['time'] as String;

                    return DataRow(cells: [
                      DataCell(Text(uname)),
                      DataCell(Text(time)),
                    ]);
                  }).toList(),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          usersProvider.fetchData();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
