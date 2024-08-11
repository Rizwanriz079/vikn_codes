import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bottom.dart';
import 'sale_list.dart';

class DashboardController extends GetxController {
  var selectedDate = 2.obs; // Default to the 2nd day of the month
}

class DashboardScreen extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        height: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'CabZing',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      IconButton(
                        icon: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-vector/portrait-boy-with-brown-hair-brown-eyes_1308-146018.jpg'),
                        ),
                        onPressed: () {},
                      ),
                      Positioned(
                        right: 6,
                        top: 6,
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Revenue section
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF1E1E2A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SAR 2,78,000.00',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '+21% than last month.',
                              style: TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Revenue',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Revenue chart using fl_chart
                    Container(
                      height: 180,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          ),
                          borderData: FlBorderData(show: false),
                          minX: 0,
                          maxX: 6,
                          minY: 0,
                          maxY: 4,
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 1),
                                FlSpot(1, 2),
                                FlSpot(2, 1.5),
                                FlSpot(3, 3),
                                FlSpot(4, 4),
                                FlSpot(5, 2),
                                FlSpot(6, 3),
                              ],
                              isCurved: true,
                              color: Colors.blueAccent,
                              barWidth: 3,
                              isStrokeCapRound: true,
                              belowBarData: BarAreaData(
                                show: true,
                                color: Colors.blueAccent.withOpacity(0.3),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    // Date selection
                    Obx(
                          () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(7, (index) {
                          return GestureDetector(
                            onTap: () => controller.selectedDate.value = index + 1,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: controller.selectedDate.value == index + 1
                                    ? Colors.blueAccent
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                (index + 1).toString().padLeft(2, '0'),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Bookings & Invoices
              Expanded(
                child: ListView(
                  children: [
                    _buildStatCard(
                        'Bookings', '123', 'Reserved', Icons.timelapse),
                    SizedBox(height: 16),
                    _buildStatCard(
                        'Invoices', '10,232.00', 'Rupees', Icons.receipt, () {
                      // Navigate to InvoicesScreen
                      Get.to(() => SaleList());
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, String subtitle, IconData icon, [VoidCallback? onTap]) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFF1E1E2A),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.blueAccent,
                  size: 36,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      value,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.blueAccent,
              size: 36,
            ),
          ],
        ),
      ),
    );
  }
}
