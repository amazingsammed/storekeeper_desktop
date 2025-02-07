
import 'package:fluent_ui/fluent_ui.dart';


class MyMenuBar extends StatelessWidget {
   MyMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuBar(
      items: [
        MenuBarItem(title: 'File', items: [
          MenuFlyoutSubItem(
            text: const Text('New'),
            items: (context) {
              return [
                MenuFlyoutItem(
                  text: const Text('Plain Text Documents'),
                  onPressed: () {},
                ),
                MenuFlyoutItem(
                  text: const Text('Rich Text Documents'),
                  onPressed: () {},
                ),
                MenuFlyoutItem(
                  text: const Text('Other Formats'),
                  onPressed: () {},
                ),
              ];
            },
          ),
          MenuFlyoutItem(text: const Text('Open'), onPressed: () {}),
          MenuFlyoutItem(text: const Text('Save'), onPressed: () {}),
          const MenuFlyoutSeparator(),
          MenuFlyoutItem(text: const Text('Exit'), onPressed: () {}),
        ]),
        MenuBarItem(title: 'Edit', items: [
          MenuFlyoutItem(text: const Text('Undo'), onPressed: () {}),
          MenuFlyoutItem(text: const Text('Cut'), onPressed: () {}),
          MenuFlyoutItem(text: const Text('Copy'), onPressed: () {}),
          MenuFlyoutItem(text: const Text('Paste'), onPressed: () {}),
        ]),
        MenuBarItem(title: 'View', items: [
          MenuFlyoutItem(text: const Text('Output'), onPressed: () {}),
          const MenuFlyoutSeparator(),
          // RadioMenuFlyoutItem<String>(
          //   text: const Text('Landscape'),
          //   value: 'landscape',
          //   groupValue: _orientation,
          //   onChanged: (v) => setState(() => _orientation = v),
          // ),
          // RadioMenuFlyoutItem<String>(
          //   text: const Text('Portrait'),
          //   value: 'portrait',
          //   groupValue: _orientation,
          //   onChanged: (v) => setState(() => _orientation = v),
          // ),
          // const MenuFlyoutSeparator(),
          // RadioMenuFlyoutItem<String>(
          //   text: const Text('Small icons'),
          //   value: 'small_icons',
          //   groupValue: _iconSize,
          //   onChanged: (v) => setState(() => _iconSize = v),
          // ),
          // RadioMenuFlyoutItem<String>(
          //   text: const Text('Medium icons'),
          //   value: 'medium_icons',
          //   groupValue: _iconSize,
          //   onChanged: (v) => setState(() => _iconSize = v),
          // ),
          // RadioMenuFlyoutItem<String>(
          //   text: const Text('Large icons'),
          //   value: 'large_icons',
          //   groupValue: _iconSize,
          //   onChanged: (v) => setState(() => _iconSize = v),
          // ),
        ]),
        MenuBarItem(title: 'Help', items: [
          MenuFlyoutItem(text: const Text('About'), onPressed: () {}),
        ]),
      ],
    );
  }
}
