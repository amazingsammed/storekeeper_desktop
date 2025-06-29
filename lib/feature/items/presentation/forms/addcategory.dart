import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storekepper_desktop/feature/items/controller/itemcontroller.dart';
import 'package:storekepper_desktop/feature/items/domain/models/category.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';
import 'package:uuid/uuid.dart';

import '../../../../shared/widgets/ktextfields.dart';

class AddCategory extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final ItemController controller = Get.put(ItemController());
  final bool isEdit;
  final CategoryModel? categoryModel;

  AddCategory({super.key, this.isEdit=false, this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: ListTile(
        title:isEdit?Text("Update Category"): Text("Create New Category"),
        subtitle: const Text("Fill the form below"),
      ),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 450,
        width: 600,
        child: FormBuilder(
          initialValue: isEdit?{
            "name":categoryModel?.name
          }:{},
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    KTextField(
                      title: "Category Name",
                      id: 'name',
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                 if(!isEdit) PrimaryButton(
                    onTap: () async {
                      //_formKey.currentState?.fields['name']!.invalidate('Email already taken');
                      if (_formKey.currentState!.fields['name'] == null) {
                        return _formKey.currentState?.fields['name']!
                            .invalidate('Category is empty');
                      }
                     await controller.addCategory(data: CategoryModel(name: _formKey.currentState?.fields['name']!.value, status: 1, createdby: 'createdby', uuid: Uuid().v1(), is_active: 1, storeid: '', busid: ''));
                   controller.update();
                    Navigator.of(context).pop();
                      },
                    title: "Save",
                  ),
                 if(isEdit) PrimaryButton(
                    onTap: () async {
                      //_formKey.currentState?.fields['name']!.invalidate('Email already taken');
                      if (_formKey.currentState!.fields['name'] == null) {
                        return _formKey.currentState?.fields['name']!
                            .invalidate('Category is empty');
                      }
                     await controller.updateCategory(data: CategoryModel(name: _formKey.currentState?.fields['name']!.value, status: 1, createdby: 'createdby', uuid: categoryModel!.uuid, is_active: 1, storeid: '', busid: ''));
                   controller.update();
                    Navigator.of(context).pop();
                      },
                    title: "Update",
                   icon: Icons.update,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ResizableTable extends StatefulWidget {
  @override
  _ResizableTableState createState() => _ResizableTableState();
}

class _ResizableTableState extends State<ResizableTable> {
  List<double> columnWidths = [100.0, 200.0, 150.0];
  int _resizingColumnIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resizable Table'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: List.generate(3, (index) {
            return DataColumn(
              label: MouseRegion(
                cursor: SystemMouseCursors.resizeColumn,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onHorizontalDragStart: (details) {
                    setState(() {
                      _resizingColumnIndex = index;
                    });
                  },
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      columnWidths[_resizingColumnIndex] += details.delta.dx;
                      columnWidths[_resizingColumnIndex] = columnWidths[_resizingColumnIndex].clamp(50.0, 300.0);
                    });
                  },
                  onHorizontalDragEnd: (details) {
                    setState(() {
                      _resizingColumnIndex = -1;
                    });
                  },
                  child: Container(
                    width: columnWidths[index],
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: _resizingColumnIndex ==index?Colors.blue:Colors.grey
                        )
                      )
                    ),
                    child: Text('Column ${index + 1}'),
                  ),
                ),
              ),
            );
          }),
          rows: [
            DataRow(cells: [
              DataCell(Container(width: columnWidths[0], child: Text('Row 1 Cell 1'))),
              DataCell(Container(width: columnWidths[1], child: Text('Row 1 Cell 2'))),
              DataCell(Container(width: columnWidths[2], child: Text('Row 1 Cell 3'))),
            ]),
            DataRow(cells: [
              DataCell(Container(width: columnWidths[0], child: Text('Row 2 Cell 1'))),
              DataCell(Container(width: columnWidths[1], child: Text('Row 2 Cell 2'))),
              DataCell(Container(width: columnWidths[2], child: Text('Row 2 Cell 3'))),
            ]),
          ],
        ),
      ),
    );
  }
}

class CustomResizableTable extends StatefulWidget {
  @override
  _CustomResizableTableState createState() => _CustomResizableTableState();
}

class _CustomResizableTableState extends State<CustomResizableTable> {
  // Column widths (initial values)
  List<double> columnWidths = [150.0, 200.0, 150.0, 100.0];
  int _resizingColumnIndex = -1;

  // Sample data
  final List<List<String>> data = [
    ['ID', 'Name', 'Role', 'Salary'],
    ['1', 'John Doe', 'Manager', '\$5000'],
    ['2', 'Jane Smith', 'Developer', '\$4000'],
    ['3', 'Alice Johnson', 'Designer', '\$3500'],
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Table Header
          Row(
            children: List.generate(data[0].length, (index) {
              return Container(
                width: columnWidths[index],
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                      
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: _resizingColumnIndex == index
                                  ? Colors.blue
                                  : Colors.grey[300]!,
                              width: 2.0,
                            ),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Text(
                          data[0][index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.resizeColumn,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onHorizontalDragStart: (details) {
                          setState(() {
                            _resizingColumnIndex = index;
                          });
                        },
                        onHorizontalDragUpdate: (details) {
                          setState(() {
                            columnWidths[_resizingColumnIndex] += details.delta.dx;
                            columnWidths[_resizingColumnIndex] =
                                columnWidths[_resizingColumnIndex].clamp(50.0, 500.0);
                          });
                        },
                        onHorizontalDragEnd: (details) {
                          setState(() {
                            _resizingColumnIndex = -1;
                          });
                        },
                        child: Container(

                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: _resizingColumnIndex == index
                                    ? Colors.blue
                                    : Colors.grey[300]!,
                                width: 2.0,
                              ),
                            ),
                            color: Colors.grey[200],
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          // Table Rows
          ...List.generate(data.length - 1, (rowIndex) {
            return Row(
              children: List.generate(data[rowIndex + 1].length, (colIndex) {
                return Container(
                  width: columnWidths[colIndex],
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Colors.grey[300]!,
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        color: Colors.grey[300]!,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Text(
                    data[rowIndex + 1][colIndex],
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                );
              }),
            );
          }),
        ],
      ),
    );
  }
}
