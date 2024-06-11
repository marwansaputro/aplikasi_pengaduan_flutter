import 'package:flutter/material.dart';
import 'package:integra_mobile/domain/entities/model_portofolio.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/app/config/theme.dart';

class CustomItemPortfolio extends StatelessWidget {
  const CustomItemPortfolio({
    required this.portofolio,
    super.key,
  });

  final ModelPortofolio portofolio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingMobile,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 380),
        child: Container(
          decoration: BoxDecoration(
            // border: Border.all(color: darkGrey, width: 0.5),
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
            padding: const EdgeInsets.all(10),
            child: IColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              gap: 5,
              children: [
                Text(
                  portofolio.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: black, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 2,
                ),
                IRow(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  gap: 10,
                  children: [
                    Expanded(
                      child: Container(
                        height: 80,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                              image: AssetImage(
                                portofolio.image,
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text(
                            portofolio.description,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: black,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          IRow(
                            gap: 5,
                            children: [
                              Text(
                                portofolio.location,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: black,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                portofolio.tag,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: black,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
