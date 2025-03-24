import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DataTableV2 extends StatefulWidget {
  final String title;
  final Function(Map)? ontap;
  final Function(List<Map>)? selecteditems;
  final List<TableHead> heads;
  final List items;
  final Widget? titleWidget;
  final Widget? refreshButton;
  final TableOptions? tableOptions;

  const DataTableV2(
      {Key? key,
      this.ontap,
      required this.title,
      required this.heads,
      required this.items,
      this.titleWidget,
      this.selecteditems,
      this.tableOptions, this.refreshButton})
      : super(key: key);

  @override
  State<DataTableV2> createState() => _DataTableV2State();
}

class _DataTableV2State extends State<DataTableV2> {
  TextEditingController search = TextEditingController();

  List filteredItems = [];
  List<Map> selectedItems = [];

  handleOnChange(String e) {
    setState(() {
      filteredItems = widget.items.where((element) {
        return widget.heads.any((action) {
          return element[action.id]
              .toString()
              .toLowerCase()
              .contains(e.toLowerCase());
        });
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600 ||
        MediaQuery.of(context).size.height < 300) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(widget.title + " (${widget.items.length.toString()})"),
          actions: [widget.titleWidget ?? Container()],
        ),
        body: Container(
        //  padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: TextFormField(
                  controller: search,
                  onChanged: handleOnChange,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      hintText: 'Search',
                      // fillColor: Colors.white,
                      // filled: true,

                      hoverColor: Colors.transparent),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredItems.isEmpty
                      ? widget.items.length
                      : filteredItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = filteredItems.isEmpty
                        ? widget.items[index]
                        : filteredItems[index];
                    var heads = widget.heads
                        .where((element) => element.isTitle)
                        .toList();
                    String title = heads.isEmpty
                        ? item[widget.heads[0].id]
                        : item[heads[0].id] ?? "";

                    var subtitlex = widget.heads
                        .where((element) => element.isSubtitle)
                        .toList();
                    String subtitle = subtitlex.isEmpty
                        ? item[widget.heads[1].id]
                        : item[subtitlex[0].id] ?? "";
                    return Card(
                      child: ExpansionTile(
                        //dense: true,
                        shape: RoundedRectangleBorder(),
                        /* leading: CircleAvatar(
                          child: Text((index + 1).toString()),
                        ),*/
                        leading: Checkbox(
                            value: selectedItems.contains(item),
                            onChanged: (e) {
                              setState(() {
                                if (selectedItems.contains(item)) {
                                  selectedItems.remove(item);
                                } else {
                                  selectedItems.add(item);
                                }
                                widget.selecteditems!(selectedItems);
                              });
                            }),
                        title: Text(title),
                        subtitle: Text(subtitle),
                        trailing: widget.heads.any((e) => e.isbutton)
                            ? SizedBox(
                                child: widget.heads
                                    .where((e) => e.isbutton)
                                    .toList()[0]
                                    .button!(item),
                              )
                            : null,
                        children: widget.heads.map((element) {
                          if (element.isbutton) {
                            return SizedBox();
                          }
                          return ListTile(
                            title: Text(item[element.id] ?? ""),
                            subtitle: Text(element.title),
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
    }
    return Scaffold(
      body: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1377,
        ),
        child: Card(
          margin: EdgeInsets.all(40).copyWith(top: 10),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      widget.refreshButton??Container()
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          width: 300,
                          child: TextFormField(
                            controller: search,
                            onChanged: handleOnChange,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(),
                                hintText: 'Search',
                                // fillColor: Colors.white,
                                // filled: true,

                                hoverColor: Colors.transparent),
                          ),
                        ),
                      ),
                      Spacer(),
                      widget.titleWidget ?? Container(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            _ItemListHeader(
                              elements: widget.heads,
                              selectedItems: selectedItems,
                              onAccept: (number) {
                                if (number.isEmpty) return;
                                int value = int.tryParse(number) ?? 0;
                                selectedItems.clear();
                                for (int i = 1; i <= value && i<widget.items.length+1; i++) {
                                  setState(() {
                                    selectedItems.add(widget.items[i - 1]);
                                  });
                                }
                              },
                            ),
                            _ItemListBody(
                              selecteditem: widget.selecteditems,
                              head: widget.heads,
                              selectedItems: selectedItems,
                              items: filteredItems.isEmpty
                                  ? widget.items
                                  : filteredItems,
                              ontap: widget.ontap,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemListHeader extends StatelessWidget {
  final List<TableHead> elements;
  final List<Map> selectedItems;
  final Function(String) onAccept;

  const _ItemListHeader(
      {Key? key,
      required this.elements,
      required this.selectedItems,
      required this.onAccept})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController number = TextEditingController();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      decoration: BoxDecoration(
          color: Colors.black12,
          border: Border.all(color: Colors.black12),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(6), topLeft: Radius.circular(6))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 45,
              child: IconButton(
                onPressed: () {
                  Get.dialog(AlertDialog(
                    title: Text("Rows to be selected"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: number,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Enter number here"),
                              hintText: '50'),
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: ()=>onAccept(number.text),
                          child: Text("Accept"))
                    ],
                  ));
                },
                icon: Icon(Icons.menu_open),
              )),
          ...elements.map((item) {
            return Expanded(
              flex: item.size * item.width.toInt(),

              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.title,overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}

class _ItemListBody extends StatefulWidget {
  final List<TableHead> head;
  final Function(Map)? ontap;
  final Function(List<Map>)? selecteditem;
  final List<Map> selectedItems;

  final List items;

  const _ItemListBody(
      {Key? key,
      required this.head,
      required this.items,
      this.ontap,
      this.selecteditem,
      required this.selectedItems})
      : super(key: key);

  @override
  State<_ItemListBody> createState() => _ItemListBodyState();
}

class _ItemListBodyState extends State<_ItemListBody> {
  int itemsperPage = 10;
  int _currentPage = 0;
  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: widget.items.isEmpty
            ? const Center(
                child: Text(
                'No Data Available to present',
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
            : Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                        controller: pageController,
                        onPageChanged: (page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        itemCount: (widget.items.length / itemsperPage).ceil(),
                        itemBuilder: (context, pageIndex) {
                          final start = pageIndex * itemsperPage;
                          final end = start + itemsperPage;
                          final items = widget.items.sublist(
                              start,
                              end > widget.items.length
                                  ? widget.items.length
                                  : end);

                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) {
                              var item = items[index];
                              return InkWell(
                                onTap: () => widget.ontap!(item),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: widget.selectedItems.contains(item)
                                        ? Colors.blue[100]
                                        : null,
                                    // color: controller.hoverColor.value,
                                    border: Border.all(color: Colors.black12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        child: Checkbox(
                                            value: widget.selectedItems
                                                .contains(item),
                                            onChanged: (e) {
                                              setState(() {
                                                if (widget.selectedItems
                                                    .contains(item)) {
                                                  widget.selectedItems
                                                      .remove(item);
                                                } else {
                                                  widget.selectedItems
                                                      .add(item);
                                                }
                                                widget.selecteditem!(
                                                    widget.selectedItems);
                                              });
                                            }),
                                      ),
                                      ...widget.head.map((element) {
                                        var results = item[element.id];
                                        String data = "";
                                        if (element.type ==
                                            TableHeadType.String) {
                                          data = results ?? "";
                                        } else if (element.type ==
                                            TableHeadType.int) {
                                          data = "$results";
                                        } else if (element.type ==
                                            TableHeadType.double) {
                                          data = "$results";
                                        } else if (element.type ==
                                            TableHeadType.currency) {
                                          data = formatAccounting(results);
                                        }
                                        if (element.isbutton) {
                                          return Expanded(
                                            flex: element.size  * element.width.toInt(),
                                            child: Row(
                                              children: [
                                                element.button!(item) ??
                                                    Container()
                                              ],
                                            ),
                                          );
                                        }
                                        return Expanded(
                                          flex: element.size  * element.width.toInt(),
                                          child: Text(data),
                                        );
                                      })
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Row(
                            children: List.generate(
                                (widget.items.length / itemsperPage).ceil(),
                                (index) => InkWell(
                                    onTap: () {
                                      setState(() {
                                        _currentPage = index;
                                        pageController.animateToPage(index,
                                            duration:
                                                Duration(microseconds: 200),
                                            curve: Curves.ease);
                                      });
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: _currentPage == index
                                                ? Colors.blue
                                                : null),
                                        child: Text(
                                          "${index + 1}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: _currentPage == index
                                                  ? Colors.white
                                                  : null),
                                        ))))),
                      ),
                      Spacer(),
                      Text(
                        "${widget.selectedItems.length} of ${widget.items.length} Row(s) Selected",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ));
  }
}

class TableHead {
  final String title;
  final String id;
  final int size;
  final bool isbutton;
  final bool isTitle;
  final bool isSubtitle;
  final TableHeadType type;
  final double width;
  final Widget? Function(Map<String, dynamic> data)? button;

  TableHead({
    required this.title,
    required this.id,
    this.size = 1,
    this.width = 200.0,
    this.isbutton = false,
    this.isTitle = false,
    this.isSubtitle = false,
    this.type = TableHeadType.String,
    this.button,
  });
}

enum TableHeadType { String, int, double, bool, currency }

extension ABC on List {
  toJsonList() {
    return map((item) {
      try {
        return item.toMap();
      } catch (e) {
        print('check to toJsonList \n it is returning null');
        return {};
      }
    }).toList();
  }
}

class TableOptions {
  final bool selectible;

  final bool showSearch;

  final bool showOptions;

  final int headerHeight;

  final int rowHeight;
  final int rowPerPage;

  TableOptions(
      {this.selectible = false,
      this.showSearch = true,
      this.showOptions = false,
      this.headerHeight = 200,
      this.rowHeight = 40,
      this.rowPerPage = 10});
}

String formatAccounting(double value,
    {String currencySymbol = '\$', int decimalPlaces = 2}) {
  // Round the value to the desired decimal places
  double roundedValue = value.roundToDouble() +
      double.parse((value % 1).toStringAsFixed(decimalPlaces).substring(1));

  // Use the NumberFormat class to format the number with commas
  var formatter = NumberFormat("#,##0.${'0' * decimalPlaces}", "en_US");

  // Format the value and add the currency symbol
  String formattedValue = formatter.format(roundedValue);

  return "$currencySymbol$formattedValue";
}
