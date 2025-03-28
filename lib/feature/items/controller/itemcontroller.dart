
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/items/data/implementation/item_implementation.dart';
import 'package:storekepper_desktop/feature/items/domain/models/category.dart';
import 'package:storekepper_desktop/feature/items/domain/models/group.dart';

import '../../../shared/ui/snackbars.dart';
import '../../sqlite_db.dart';
import '../domain/models/item.dart';
import '../domain/models/units.dart';
import '../domain/repository/item_repository.dart';

class ItemController extends GetxController{
  var hasOpeningBal = false.obs;
  final ItemRepository itemRepository=ItemImplementation();
  var loading = false.obs;
  @override
  Future<void> onInit() async {
    await getAllItems();
    await getAllGroups();
    await getAllUnits();
    await getAllCategory();
    super.onInit();
  }


  var allItems = <Item>[].obs;
  var allGroup = <Groups>[].obs;
  var allUnit = <Units>[].obs;
  var allCategory = <CategoryModel>[].obs;



  Future<void> getAllItems() async {
    loading.value = true;
    final results = await itemRepository.getAllItems();
    results.fold((failure) {
      loading.value = false;
      showErrorSnackbar(message: failure.message);
    }, (exists) {
      allItems.value = exists;
      loading.value = false;
    });
  }

  Future<void> getAllGroups() async {
    loading.value = true;
    final results = await itemRepository.getAllGroups();
    results.fold((failure) {
      loading.value = false;
      showErrorSnackbar(message: failure.message);
    }, (exists) {
      allGroup.value = exists;
      loading.value = false;
    });
  }

  Future<void> getAllUnits() async {
    loading.value = true;
    final results = await itemRepository.getAllUnits();
    results.fold((failure) {
      loading.value = false;
      showErrorSnackbar(message: failure.message);
    }, (exists) {
      allUnit.value = exists;
      loading.value = false;
    });
  }

  Future<void> getAllCategory() async {
    loading.value = true;
    final results = await itemRepository.getAllCategory();
    results.fold((failure) {
      loading.value = false;
      showErrorSnackbar(message: failure.message);
    }, (exists) {
     allCategory.value = exists;
      loading.value = false;
    });

  }
  Future<void> addCategory({required CategoryModel data}) async {
    loading.value = true;
    final results = await itemRepository.createSingleCategory(data: data);
    results.fold((failure) {
      loading.value = false;
      showErrorSnackbar(message: failure.message);
    }, (exists) async {
      await getAllCategory();
      showSuccessSnackbar(message: "Category created Successfully");
      loading.value = false;
    });

  }

  Future<void> addGroup({ required Groups data}) async {
    loading.value = true;
    final results = await itemRepository.createSingleGroup(data: data);
    results.fold((failure) {
      loading.value = false;
      showErrorSnackbar(message: failure.message);
    }, (exists) async {
      await getAllGroups();
      showSuccessSnackbar(message: "Group created Successfully");
      loading.value = false;
    });

  }

  addUnit({required Units data}) async {
    loading.value = true;
    final results = await itemRepository.createSingleUnit(data: data);
    results.fold((failure) {
      loading.value = false;
      showErrorSnackbar(message: failure.message);
    }, (exists) async {
      await getAllUnits();
      showSuccessSnackbar(message: "Unit created Successfully");
      loading.value = false;
    });
  }

  addItem({required Item data}) async {
    loading.value = true;
    final results = await itemRepository.createSingleItem(data: data);
    results.fold((failure) {
      loading.value = false;
      showErrorSnackbar(message: failure.message);
    }, (exists) async {
      await getAllItems();
      showSuccessSnackbar(message: "Item created Successfully");
      loading.value = false;
    });
  }
}