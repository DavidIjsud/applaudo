import 'dart:convert';
import 'dart:developer';

import 'package:applaudo/exceptions/not_internet_exception.dart';
import 'package:applaudo/exceptions/unknow_error_exception.dart';
import 'package:applaudo/modules/searchlist/data/data_sources/data_source_search_list.dart';
import 'package:applaudo/modules/searchlist/data/dtos/product.dart';
import 'package:applaudo/modules/searchlist/exceptions/no_products_found_exception.dart';
import 'package:applaudo/shared/constants/network_constants.dart';
import 'package:applaudo/shared/constants/success_consts.dart';
import 'package:applaudo/shared/network/network_utils.dart';
import 'package:http/http.dart';

class SearchSourceListImpl implements SearchListDataSource {
  @override
  Future<Map<String, dynamic>> getSearchList(String query) async {
    String url = '${NetworkUtils.host}?q=$query#json';
    try {
      final Response resultResponse = await get(Uri.parse(url))
          .timeout(const Duration(seconds: 10), onTimeout: () async {
        throw NoInternetException();
      });
      if (resultResponse.statusCode == 200) {
        Map<String, dynamic> bodyResponse = jsonDecode(resultResponse.body);
        List<ProductDTO> listProducts = bodyResponse['results']
            .map<ProductDTO>((product) => ProductDTO.fromJson(product))
            .toList();
        return {
          'status': true,
          'data': listProducts,
          'message': successDataFound
        };
      }

      throw NoProductFoundException();
    } catch (e) {
      if (e.toString() == connectionResetByPeer) {
        throw NoInternetException();
      }

      log("Error on obtaing ${e.toString()}");
      throw UnknowErrorException(tentativeError: e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> getDetailProduct(String idProduct) async {
    String url = '${NetworkUtils.detailHost}/$idProduct';

    try {
      final Response resulResponse = await get(Uri.parse(url))
          .timeout(const Duration(seconds: 10), onTimeout: () async {
        throw NoInternetException();
      });

      if (resulResponse.statusCode == 200) {
        Map<String, dynamic> bodyResponse = jsonDecode(resulResponse.body);
        return {
          'status': true,
          'data': bodyResponse,
          'message': successDataFound
        };
      }

      throw NoProductFoundException();
    } catch (e) {
      if (e.toString() == connectionResetByPeer) {
        throw NoInternetException();
      }
      log("Error on obtaing ${e.toString()}");
      throw UnknowErrorException(tentativeError: e.toString());
    }
  }
}
