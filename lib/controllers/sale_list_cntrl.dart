import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaleListController extends GetxController {
  var invoices = <Map<String, String>>[].obs;
  var filteredInvoices = <Map<String, String>>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchInvoices();
  }

  Future<void> fetchInvoices() async {
    isLoading(true);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userID = prefs.getString('userID');

    final url = 'https://www.api.viknbooks.com/api/v10/sales/sale-list-page/';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "BranchID": 1,
        "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
        "CreatedUserID": userID,
        "PriceRounding": 2,
        "page_no": 1,
        "items_per_page": 10,
        "type": "Sales",
        "WarehouseID": 1,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> invoicesData = data['invoices'] ?? [];

      invoices.value = invoicesData
          .map((invoice) => {
        'InvoiceNo': invoice['InvoiceNo']?.toString() ?? 'N/A',
        'CustomerName': invoice['CustomerName']?.toString() ?? 'N/A',
        'amount': 'SAR ${invoice['amount']?.toString() ?? '0'}',
        'status': invoice['status']?.toString() ?? 'Unknown',
      })
          .toList();
      filteredInvoices.value = invoices;
    } else {
      Get.snackbar('Error', 'Failed to load invoices');
    }

    isLoading(false);
  }

  void searchInvoice(String query) {
    if (query.isEmpty) {
      filteredInvoices.value = invoices;
    } else {
      filteredInvoices.value = invoices
          .where((invoice) =>
      invoice['InvoiceNo']!.contains(query) ||
          invoice['CustomerName']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
