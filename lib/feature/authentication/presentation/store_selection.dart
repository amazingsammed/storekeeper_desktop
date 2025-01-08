import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

class StoreSelectionScreen extends StatelessWidget {
  final RxString selectedStore = '7890'.obs;

  @override
  Widget build(BuildContext context) {
    selectedStore.value ="ffg";
    return ScaffoldPage(
      header: Text('Select Your Store'),
      content: Column(
        children: [
          SizedBox(height: 20),
          Button(
            onPressed: () {
              if (selectedStore.value.isNotEmpty) {
                Get.toNamed('/dashboard');
              } else {
                // Show an error message
                print("Please select a store");
              }
            },
            child: Text('Go to Dashboard'),
          ),
        ],
      ),
    );
  }
}