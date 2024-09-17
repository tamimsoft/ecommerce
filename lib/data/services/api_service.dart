import 'package:ecommerce/features/profile/models/user_model.dart';

import '../../features/product/models/product_model.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/http/http_client.dart';

mixin ApiService {
  final HttpClient _http = HttpClient();

  ///-- Check internet connection
  Future<bool> isConnected() async => await _http.isConnected();

  ///-- Login screen
  // Future<String> fetchToken({required String userName, required String password}) async {
  //   Map<String, String> queryParams = {
  //     'username': userName,
  //     'password': password,
  //   };
  //
  // final Token tokenObj = await _http.get2<S>(
  //   endpoint: ApiConstants.getToken,
  //   fromJson: (json) => Token.fromJson(json),
  //   queryParams: queryParams,
  // );
  // Return the fetched token
  //   return tokenObj.token;
  // }

  // Future<BasicInfoModel> fetchBasicInfo() async {
  //   return await _http.get<BasicInfoModel>(
  //     endpoint: ApiConstants.basicInfo,
  //     fromJson: (jsonResponse) => BasicInfoModel.fromJson(jsonResponse),
  //   );
  // }
  //
  // Future<List<BalanceCategoryModel>> fetchBalanceCategory({required String accountNo}) async {
  //   Map<String, String> queryParams = {
  //     'account_no': accountNo,
  //   };
  //   return await _http.get<List<BalanceCategoryModel>>(
  //     endpoint: ApiConstants.balanceCategory,
  //     fromJson: (jsonResponse) =>
  //         (jsonResponse as List).map((category) => BalanceCategoryModel.fromJson(category)).toList(),
  //     queryParams: queryParams,
  //   );
  // }

  /// -- Product List --
  Future<List<Product>> fetchProductList() async {
    return await _http.get<List<Product>>(
      endpoint: ApiConstants.productList,
      fromJson: (jsonResponse) => (jsonResponse as List).map((item) => Product.fromJson(item)).toList(),
    );
  }

  /// -- get User Information by user name and password --
  Future<User> fetchUser({
    required String userName,
    required String password,
  }) async {
    Map<String, String> body = {
      'username': userName,
      'password': password,
    };
    print('hi3');
    return await _http.post2<User>(
      endpoint: ApiConstants.loginAndGetToken,
      fromJson: (jsonResponse) => User.fromJson(jsonResponse),
      body: body,
    );
  }

  /// -- get User Information by use token
  Future<User> fetchCurrentAuthUser({required String token}) async {
    return await _http.get2<User>(
      endpoint: ApiConstants.authMe,
      fromJson: (jsonResponse) => User.fromJson(jsonResponse),
      token: token,
    );
  }

// ///-- Account Details Screen
// Future<List<AccountDetails>> fetchAccountDetails({required String accountNo, required String amountType}) async {
//   Map<String, String> queryParams = {
//     'account_no': accountNo,
//     'amount_type': amountType,
//   };
//   return await _http.get<List<AccountDetails>>(
//     endpoint: ApiConstants.accountDetails,
//     fromJson: (jsonResponse) => (jsonResponse as List).map((item) => AccountDetails.fromJson(item)).toList(),
//     queryParams: queryParams,
//   );
// }
//
// ///-- Investment Details Screen
// Future<List<InvestmentDetails>> fetchInvestmentDetails({required String investmentId}) async {
//   Map<String, String> queryParams = {
//     'investment_id': investmentId,
//   };
//   return await _http.get<List<InvestmentDetails>>(
//     endpoint: ApiConstants.investmentDetails,
//     fromJson: (jsonResponse) => (jsonResponse as List).map((item) => InvestmentDetails.fromJson(item)).toList(),
//     queryParams: queryParams,
//   );
// }
}
