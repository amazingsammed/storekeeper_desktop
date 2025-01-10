



import 'dart:math';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:storekepper_desktop/feature/sales/presentation/saleslisting.dart';

class SalesTab extends StatefulWidget {

  const SalesTab({super.key});

  @override
  State<SalesTab> createState() => _SalesTabState();
}

class _SalesTabState extends State<SalesTab> {
  int currentIndex = 0;
  List<Tab> tabs = [];

  /// Creates a tab for the given index
  Tab generateTab(int index) {
    late Tab tab;
    tab = Tab(
      text: Text('Document $index'),
      semanticLabel: 'Document #$index',
      icon: const FlutterLogo(),
      body: Saleslisting(),
      onClosed: () {
        // setState(() {
        //   tabs!.remove(tab);
        //   if (currentIndex > 0) currentIndex--;
        // });
      },
    );
    return tab;
  }
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      home: TabView(
        tabs: tabs,
        currentIndex: currentIndex,
        onChanged: (index) => setState(() => currentIndex = index),
        tabWidthBehavior: TabWidthBehavior.sizeToContent,
        closeButtonVisibility: CloseButtonVisibilityMode.always,
        showScrollButtons: true,
        onNewPressed: () {
          setState(() {
            final index = tabs.length + 1;
            final tab = generateTab(index);
            tabs.add(tab);
          });
        },
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final item = tabs!.removeAt(oldIndex);
            tabs!.insert(newIndex, item);

            if (currentIndex == newIndex) {
              currentIndex = oldIndex;
            } else if (currentIndex == oldIndex) {
              currentIndex = newIndex;
            }
          });
        },
      ),
    );
  }
}
