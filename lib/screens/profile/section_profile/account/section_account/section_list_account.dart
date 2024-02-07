import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/value/theme.dart';
import 'package:integra_mobile/widget/button/button_solid_green.dart';

class SectionListAccount extends StatefulWidget {
  const SectionListAccount({super.key});

  @override
  State<SectionListAccount> createState() => _SectionListAccountState();
}

class _SectionListAccountState extends State<SectionListAccount> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingMobile,
      child: IColumn(
        gap: 15,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: primaryGreen),
                ),
                hintText: "Marwan Saputro",
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: darkGrey, fontWeight: FontWeight.w400),
                labelText: "Name",
                labelStyle: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: darkblue, fontWeight: FontWeight.w500),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: primaryGreen, // foreground
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 250,
                          child: Padding(
                            padding: paddingMobile,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Change Name',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: primaryGreen),
                                      ),
                                      hintText: "Marwan Saputro",
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            color: black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                      labelText: "Name",
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            color: darkGrey,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: ButtonSolidGreen(
                                      title: 'Save',
                                      ontap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    'Edit',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: primaryGreen,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ),
          ),
          TextFormField(
            maxLines: 1,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryGreen),
              ),
              hintText: "087838653826",
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: darkGrey, fontWeight: FontWeight.w400),
              labelText: "No. Handphone",
              labelStyle: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: darkblue, fontWeight: FontWeight.w500),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: primaryGreen, // foreground
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 250,
                        child: Padding(
                          padding: paddingMobile,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Change Name',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: primaryGreen),
                                    ),
                                    hintText: "Marwan Saputro",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                    labelText: "Name",
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: darkGrey,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: ButtonSolidGreen(
                                    title: 'Save',
                                    ontap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  'Edit',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: primaryGreen,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
          ),
          TextFormField(
            maxLines: 1,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryGreen),
              ),
              hintText: "**************",
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: darkGrey, fontWeight: FontWeight.w400),
              labelText: "Password",
              labelStyle: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: darkblue, fontWeight: FontWeight.w500),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: primaryGreen, // foreground
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 250,
                        child: Padding(
                          padding: paddingMobile,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Change Name',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: primaryGreen),
                                    ),
                                    hintText: "Marwan Saputro",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                    labelText: "Name",
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: darkGrey,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: ButtonSolidGreen(
                                    title: 'Save',
                                    ontap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  'Edit',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: primaryGreen,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
