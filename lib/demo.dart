import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';

class DEmoo extends StatefulWidget {
  const DEmoo({super.key});

  @override
  State<DEmoo> createState() => _DEmooState();
}

class _DEmooState extends State<DEmoo> {
  @override
  Widget build(BuildContext context) {
    final _verticalScrollController = ScrollController();
    final _horizontalScrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Container(
        height: 300,
        width: 700,
        child: AdaptiveScrollbar(
          underColor: Colors.blueGrey.withOpacity(0.3),
          sliderDefaultColor: Colors.grey.withOpacity(0.7),
          sliderActiveColor: Colors.grey,
          controller: _verticalScrollController,
          child: AdaptiveScrollbar(
            controller: _horizontalScrollController,
            position: ScrollbarPosition.bottom,
            underColor: Colors.blueGrey.withOpacity(0.3),
            sliderDefaultColor: Colors.grey.withOpacity(0.7),
            sliderActiveColor: Colors.grey,
            child: SingleChildScrollView(
              controller: _verticalScrollController,
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                controller: _horizontalScrollController,
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, bottom: 16.0),
                  child: DataTable(
                    showCheckboxColumn: true,
                    columns: [
                      DataColumn(
                        label: Text('Name'),
                      ),
                      DataColumn(
                        label: Text('Year'),
                      ),
                      DataColumn(
                        label: Text('Year'),
                      ),
                      DataColumn(
                        label: Text('Year'),
                      ),
                      DataColumn(
                        label: Text('Year'),
                      ),
                      DataColumn(
                        label: Text('Name'),
                      ),
                      DataColumn(
                        label: Text('Year'),
                      ),
                      DataColumn(
                        label: Text('Year'),
                      ),
                      DataColumn(
                        label: Text('Year'),
                      ),
                      DataColumn(
                        label: Text('Year'),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      20,
                      (int index) => DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Text('Row $index'),
                          ),
                          DataCell(
                            Text('Row $index'),
                          ),
                          DataCell(
                            Text('Row $index'),
                          ),
                          DataCell(
                            Text('Row $index'),
                          ),
                          DataCell(
                            Text('Row $index'),
                          ),
                          DataCell(
                            Text('Row $index'),
                          ),
                          DataCell(
                            Text('Row $index'),
                          ),
                          DataCell(
                            Text('Row $index'),
                          ),
                          DataCell(
                            Text('Row $index'),
                          ),
                          DataCell(
                            Text('Row $index'),
                          ),
                        ],
                        onSelectChanged: (bool? value) {},
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
}
}