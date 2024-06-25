import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/models/company_model.dart';

class HomePageSuccessWidget extends StatelessWidget {
  final List<CompanyModel> companies;

  const HomePageSuccessWidget({
    super.key,
    required this.companies,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          top: 30,
          left: 22,
          right: 22,
        ),
        child: ListView.builder(
          itemCount: companies.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff2188FF),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              height: 76,
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/icons/unityIcon.svg',
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '${companies.elementAt(index).name} Unit',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
