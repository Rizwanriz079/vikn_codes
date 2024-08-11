import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sale_list_cntrl.dart';
import 'bottom.dart';
import 'filter.dart';

class SaleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SaleListController controller = Get.put(SaleListController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.to(BottomNavigationLayout());
          },
        ),
        title: Text('Invoices', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search_outlined, size: 30, color: Color(0XFF8A8A8A)),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Color(0XFF8A8A8A)),
                      filled: true,
                      fillColor: Colors.grey[900],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      controller.searchInvoice(value);
                    },
                  ),
                ),
                SizedBox(width: 5),
                ElevatedButton.icon(
                  onPressed: () {
                    Get.to(FiltersScreen());
                  },
                  icon: Icon(Icons.filter_list, color: Colors.blueAccent),
                  label: Text('Add Filters', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[900],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: controller.filteredInvoices.length,
                itemBuilder: (context, index) {
                  final invoice = controller.filteredInvoices[index];
                  return ListTile(
                    title: Text(
                      '#${invoice['InvoiceNo']} - ${invoice['CustomerName']}',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      invoice['amount']!,
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Text(
                      invoice['status']!,
                      style: TextStyle(
                        color: invoice['status'] == 'Pending'
                            ? Colors.red
                            : invoice['status'] == 'Invoiced'
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
