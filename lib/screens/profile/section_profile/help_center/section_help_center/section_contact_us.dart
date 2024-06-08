import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/app/config/app_constant.dart';
import 'package:integra_mobile/value/theme.dart';
import 'package:svg_icon/svg_icon.dart';

class SectionContactUs extends StatelessWidget {
  const SectionContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: paddingMobile,
        child: IColumn(
          gap: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Contact Us',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: primaryGreen,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  '.',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: darkblue,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 400),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: darkblue,
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .shadow
                          .withOpacity(0.10),
                      blurRadius: 15,
                      spreadRadius: -15,
                      offset: const Offset(0, 25)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: IColumn(
                  gap: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ingin berdiskusi dalam hal pengembangan layanan teknologi informasi & software anda, silahkan hubungi kami di :',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: white,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 10),
                    IRow(
                      gap: 5,
                      children: [
                        Text(
                          'PT. INTEGRA',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: white,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        Text(
                          'INOVASI INDONESIA',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: primaryGreen,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                    Text(
                      'Cokro Square Kav K. Jl. HOS Cokroaminoto No. 124, Kel. Tegalrejo, Kec. Tegalrejo, Kota Yogyakarta, Daerah Istimewa Yogyakarta, Indonesia. 55244.',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: white,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: IColumn(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            gap: 10,
                            children: [
                              Text(
                                'Telp. 0274 5304851\nHP/SMS/WA. 0812-2790-1212 |\n0812-4999-1199\nEmail : info@integraindonesia.co.id\nWebsite : www.integraindonesia.co.id',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: white,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Text(
                                'Marketing',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: white,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              IRow(
                                gap: 10,
                                children: [
                                  const SvgIcon(
                                    pathIIconWhatsapp,
                                    color: white,
                                    height: 15,
                                  ),
                                  Text(
                                    'Fitriya +62 123-4567-8910',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                              IRow(
                                gap: 10,
                                children: [
                                  const SvgIcon(
                                    pathIIconWhatsapp,
                                    color: white,
                                    height: 15,
                                  ),
                                  Text(
                                    'Adam +62 109-8765-4321',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: IColumn(
                            gap: 5,
                            children: [
                              Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: white,
                                  image: const DecorationImage(
                                      image: AssetImage(
                                        pathLogoBarcodeWa,
                                      ),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Text(
                                'Scan untuk Chat kami!',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                textAlign: TextAlign.center,
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
          ],
        ),
      ),
    );
  }
}
