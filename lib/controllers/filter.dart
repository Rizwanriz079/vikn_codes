import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FiltersController extends GetxController {
  var selectedDateRange = ''.obs;
  var selectedStatus = 'Pending'.obs;
  var selectedCustomer = ''.obs;
  var customers = ['savad farooque', 'John Doe', 'Jane Smith'].obs;

  // Function to update selected date range
  void updateDateRange(String startDate, String endDate) {
    selectedDateRange.value = '$startDate - $endDate';
  }

  // Function to update selected status
  void updateStatus(String status) {
    selectedStatus.value = status;
  }

  // Function to update selected customer
  void updateCustomer(String customer) {
    selectedCustomer.value = customer;
  }

  // Function to remove selected customer
  void removeCustomer() {
    selectedCustomer.value = '';
  }
}
