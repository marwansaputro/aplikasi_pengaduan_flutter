import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/value/theme.dart';

class CustomItemPortfolio extends StatelessWidget {
  const CustomItemPortfolio({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 150, maxHeight: 250),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: white,
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.10),
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, 5)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IColumn(
            gap: 5,
            children: [
              Text(
                'E-Office Universitas Islam Indonesia',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: black, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                  height: 80,
                  width: 120,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  )),
              Text(
                '“Aplikasi sistem persuratan elektronik berbasis web & android yang diimplementasikan di Universitas Islam Indonesia”',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
