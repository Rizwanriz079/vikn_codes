import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://api.accounts.vikncodes.com/api/v1';
  // static const String saleListUrl = 'https://www.api.viknbooks.com/api/v10/sales/sale-list-page/';
  static const String userProfileUrl = 'https://www.api.viknbooks.com/api/v10/users/user-view/';

  static Future<Map<String, dynamic>> loginUser(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "password": password,
        "is_mobile": true,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      _handleError(response);
      return {};
    }
  }

  // static Future<List<dynamic>> getSaleList(String userID, int pageNumber) async {
  //   final response = await http.post(
  //     Uri.parse(saleListUrl),
  //     headers: {"Content-Type": "application/json"},
  //     body: jsonEncode({
  //       "BranchID": 1,
  //       "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
  //       "CreatedUserID": userID,
  //       "PriceRounding": 2,
  //       "page_no": pageNumber,
  //       "items_per_page": 10,
  //       "type": "Sales",
  //       "WarehouseID": 1,
  //     }),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body) as List<dynamic>;
  //   } else {
  //     _handleError(response);
  //     return [];
  //   }
  // }

  static Future<Map<String, dynamic>> getUserProfile(String userID) async {
    final response = await http.get(
      Uri.parse('$userProfileUrl$userID/'),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      _handleError(response);
      return {};
    }
  }


  static void _handleError(http.Response response) {
    final statusCode = response.statusCode;
    final responseBody = response.body;


    print('Error $statusCode: $responseBody');

    throw Exception('Request failed with status: $statusCode. $responseBody');
  }
}
