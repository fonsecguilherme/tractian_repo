import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tractian_application/data/models/company_model.dart';

abstract class ICompaniesRepository {
  Future<List<CompanyModel>> getCompanies();
}

class CompaniesRepository implements ICompaniesRepository {
  final _baseUrl = 'https://fake-api.tractian.com';

  @override
  Future<List<CompanyModel>> getCompanies() async {
    final url = '$_baseUrl/companies';

    try {
      final response = await http.get(Uri.parse(url));

      switch (response.statusCode) {
        case HttpStatus.ok:
          List<dynamic> jsonData = jsonDecode(response.body);

          List<CompanyModel> companies =
              jsonData.map((company) => CompanyModel.fromMap(company)).toList();

          return companies;

        case HttpStatus.badRequest:
          throw Exception('Bad request: ${response.statusCode}');

        case HttpStatus.notFound:
          throw Exception('Failed to find the url. ${response.statusCode}');

        default:
          throw Exception('Failed to load companies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
