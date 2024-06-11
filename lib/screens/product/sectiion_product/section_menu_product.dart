import 'package:flutter/material.dart';
import 'package:integra_mobile/app/config/app_value.dart';
import 'package:integra_mobile/domain/entities/model_product.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/app/config/theme.dart';

class SectionMenuProduct extends StatelessWidget {
  const SectionMenuProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingMobile,
      child: IColumn(
        gap: 10,
        children: List.generate(
          appProducts.length ~/ 2,
          (index) => IRow(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              gap: 10,
              children: [
                Expanded(
                    child:
                        ItemProductBig(modelProduct: appProducts[index * 2])),
                Expanded(
                    child: ItemProductBig(
                        modelProduct: appProducts[(index * 2) + 1])),
              ]),
        ),
      ),
    );
  }
}

class ItemProductBig extends StatelessWidget {
  const ItemProductBig({
    super.key,
    required this.modelProduct,
  });

  final ModelProduct modelProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: darkGrey, width: 0.5),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white24),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: IColumn(
          gap: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              modelProduct.icon,
              color: primaryGreen,
              size: 35,
            ),
            Text(
              modelProduct.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: darkblue, fontWeight: FontWeight.w400),
            ),
            Text(
              modelProduct.description,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: black, fontWeight: FontWeight.w400),
            ),
            IColumn(
              gap: 5,
              children: modelProduct.itemProduct
                  .map((e) => ItemProduct(icon: e.icon, title: e.title))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

class ItemProduct extends StatelessWidget {
  const ItemProduct({
    required this.icon,
    required this.title,
    super.key,
  });

  final IconData? icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return IRow(
      crossAxisAlignment: CrossAxisAlignment.start,
      gap: 5,
      children: [
        Icon(
          icon,
          color: primaryGreen,
          size: 15,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 140),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: black, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
