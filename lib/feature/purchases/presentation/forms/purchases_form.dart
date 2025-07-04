import 'package:datatablex/datatablex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/authentication/controller/authcontroller.dart';
import 'package:storekepper_desktop/feature/sales/controller/vouchercontroller.dart';
import 'package:storekepper_desktop/feature/sales/models/accounting.dart';
import 'package:storekepper_desktop/feature/sales/models/inventory.dart';
import 'package:storekepper_desktop/feature/sales/models/voucher.dart';
import 'package:storekepper_desktop/shared/constant/colors.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';
import 'package:uuid/uuid.dart';

import '../../../items/domain/models/item.dart';

import '../../../items/presentation/itemsearchlist.dart';
import '../../../sales/controller/mytransaction.dart';
import '../../../sales/models/transaction.dart';
import '../../controller/purchasecontroller.dart';
import '../../models/salesitem.dart';


class PurchasesForm extends StatelessWidget {
  final PurchasesController controller = Get.put(PurchasesController());

  PurchasesForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text("Purchases Form"),
        ),
        body: SafeArea(
          child: Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Obx(() {
                    return DataTableX(
                      titleWidget: Row(
                        children: [
                          SecondaryButtons(
                            onTap: () {
                              controller.purchaseItem.value = [];
                            },
                            title: "Clear All",
                            icon: Icons.clear_all,
                          ),
                          kSizedbox10,
                          PrimaryButton(
                            onTap: () {
                              if (controller.purchaseItem.value.isEmpty) return;
                              Get.dialog(CreateSale());
                            },
                            title: "Create Purchases",
                          ),
                        ],
                      ),
                      selecteditems: (e) {
                        print(e);
                      },
                      onTap: (element) {
                        print(element['id'].runtimeType);
                      },
                      title: "Purchases List",
                      heads: [
                        TableHead(title: 'Name', id: 'name'),
                        TableHead(
                            title: 'Quantity',
                            id: 'quantity',
                            type: TableHeadType.int),
                        TableHead(
                            title: 'Purchase Price',
                            id: 'salesprice',
                            type: TableHeadType.double),
                        TableHead(
                            title: 'Amount',
                            id: 'amount',
                            type: TableHeadType.double),
                        TableHead(
                            title: 'Action',
                            id: 'action',
                            isbutton: true,
                            button: (data) {
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TableButton(
                                    icon: Icons.delete,
                                    bgColor: Colors.red,
                                    variant: Variant.outline,
                                    ontap: () {
                                      controller.removeSalesItem(
                                          PurchaseItem.fromMap(data));
                                    },
                                  ),
                                ],
                              );
                            }),
                      ],
                      items: controller.purchaseItem.value
                          .map((e) => e.toMap())
                          .toList(),
                    );
                  })),
              ItemSearchList(
                isPurchases: true,
                onItemSelect: (item) {
                  Get.dialog(QuantitySelector(item));
                },
              ),
              kSizedbox5
            ],
          ),
        ));
  }
}

class QuantitySelector extends GetView<PurchasesController> {
  final TextEditingController qty = TextEditingController();

  QuantitySelector(this.item, {super.key});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [Text("Number of Quantity")],
      ),
      content: Container(
        height: 300,
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.name),
            kSizedbox5,
            Text(item.purchaseprice.toString()),
            kSizedbox10,
            FormBuilderTextField(
              controller: qty,
              name: 'quantity',
              decoration: InputDecoration(
                hintText: "Quantity",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            kSizedbox10,
            PrimaryButton(
              title: "Save",
              onTap: () {
                controller.addPurchaseItem(PurchaseItem(
                    name: item.name,
                    id: item.uuid,
                    purchaseprice: item.salesprice,
                    quantity: int.tryParse(qty.text) ?? 1,
                    uuid: item.uuid));
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

class CreateSale extends GetView<PurchasesController> {
  final AuthController authController =  Get.find();
  final VoucherController voucherController = Get.put(VoucherController());
  MyTransactionController transactionController = Get.put(MyTransactionController());
  final TextEditingController qty = TextEditingController();

  CreateSale({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AlertDialog(
        title: ListTile(
          leading: Icon(Icons.inventory),
          title: Text("Create Sales"),
          subtitle: Text("Used to save a transaction"),
        ),
        content: Container(
          height: 300,
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                subtitle: Text(controller.purchaseItem.value.length.toString()),
                title: Text("Total Cost of item "),
                trailing: Text(controller.totalAmount().toStringAsFixed(2)),
              ),
              kSizedbox10,
              FormBuilderTextField(
                controller: qty,
                name: 'amount',
                onChanged: (value) {
                  controller.balance.value = controller.totalAmount();
                  if (value!.isEmpty) {
                    controller.completed.value = false;
                    return;
                  }
                  try {
                    var data = double.parse(value);
                    controller.balance.value = controller.totalAmount() - data;
                    controller.completed.value = true;
                  } catch (a) {
                    controller.completed.value = false;
                    return;
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Amount Paid by Customer",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          qty.text =
                              controller.totalAmount().toStringAsFixed(2);
                        },
                        icon: Icon(Icons.add_circle))),
              ),
              kSizedbox10,
              Obx(() {
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  title: Text("Balance to give Customer"),
                  trailing: Text(controller.balance.value.toStringAsFixed(2)),
                );
              }),
              kSizedbox10,
              PrimaryButton(
                title: "Save",
                onTap: () async {
                  String voucherid = const Uuid().v4();
                  String storeID = authController.selectedStore.storeid;
                  String createdBy = authController.currentProfile.value.userid;
                  MyTransaction saleTransaction = MyTransaction(
                      voucher: Voucher(
                          id: 0,
                          uuid: voucherid,
                          date: DateTime.now(),
                          voucher_type: 15,
                          narration: 'Cash Purchase',
                          party_name: 'Purchases',
                          is_invoice: 0,
                          is_accounting_voucher: 1,
                          is_inventory_voucher: 1,
                          is_order_voucher: 0,
                          createdby: createdBy,
                          storeid: storeID,
                          status: 1,
                          amount: controller.totalAmount(),
                          is_active: 1),
                      inventory: controller.purchaseItem.value
                          .map((e) => Inventory(
                              id: 0,
                              voucher_uuid: voucherid,
                              item_uuid: e.uuid,
                              quantity: e.quantity * 1.00,
                              rate: e.purchaseprice,
                              amount: e.purchaseprice * e.quantity,
                              status: 1,
                              storeid: storeID,
                              createdby: createdBy,
                              date: DateTime.now()))
                          .toList(),
                      accounting: [
                        Accounting(
                            id: 0,
                            voucher_uuid: voucherid,
                            vouchername: 'Cash',
                            account_uuid: 'cashuuid',
                            amount: controller.totalAmount()* -1,
                            status: 1,
                            is_active: 1,
                            is_system: 1,
                            storeid: storeID,
                            createdby: createdBy,
                            date:DateTime.now()),
                        Accounting(
                            id: 0,
                            voucher_uuid: voucherid,
                            vouchername: 'Purchases',
                            account_uuid: 'purchasesuuid',
                            amount: controller.totalAmount() ,
                            status: 1,
                            is_active: 1,
                            is_system: 1,
                            storeid: storeID,
                            createdby: createdBy,
                            date:DateTime.now()),
                      ]);
                final results=  await transactionController.saveTransaction(saleTransaction);
                if(results) Navigator.of(context).pop();
                controller.purchaseItem.clear();
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
