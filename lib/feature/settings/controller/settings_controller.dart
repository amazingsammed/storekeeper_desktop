
import 'package:get/get.dart';
import 'package:sqlbase/sqlbase.dart';

import '../../authentication/businessinfo.dart';
import '../../authentication/controller/authcontroller.dart';

class SettingsController extends GetxController{
  var coaList = [].obs;

  Future<void> getChartofAccounts() async {
    coaList.clear();

    SqlBaseResponse data = await Sqlbase.rawQuery("""
     SELECT
	chart_of_account.uuid, 
	chart_of_account.`name`, 
	chart_of_account.opening_bal, 
	system_account_group.`name` AS `group`, 
	chart_of_account.`code`
FROM
	chart_of_account
	LEFT JOIN
	system_account_group
	ON 
		chart_of_account.groupx = system_account_group.uuid
WHERE
	chart_of_account.storeid = "${authController.storeid}"
      """).execute();
    print(data);
    for (var element in data.data['data']) {
      coaList.add(element);
    }

    print(data);

  }
}