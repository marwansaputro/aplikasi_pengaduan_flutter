// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/app/config/app_constant.dart';
import 'package:integra_mobile/app/validations/validations.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/screens/complaint/bloc/bloc_complaint.dart';
import 'package:integra_mobile/screens/complaint/section_complaint/section_image_complaint.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/share/widget/mocullar/form/form_input.dart';

class SectionFormComplaint extends StatefulWidget {
  const SectionFormComplaint({
    Key? key,
  }) : super(key: key);

  @override
  State<SectionFormComplaint> createState() => _SectionFormComplaintState();
}

class _SectionFormComplaintState extends State<SectionFormComplaint> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          pathImageOrnamen2,
          fit: BoxFit.cover,
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              "Complaint Now",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: darkblue, fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
            Text(
              "Please complete the form below",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: darkGrey, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: paddingMobile,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: white,
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
                  padding: paddingMobile,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SingleChildScrollView(
                      child: FormComplaint(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FormComplaint extends StatelessWidget {
  const FormComplaint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocComplaint, BlocComplaintState>(
      builder: (context, state) {
        return IColumn(
          gap: 15,
          children: [
            SizedBox(
              height: 5,
            ),
            formAppName(),
            formCompany(),
            formComplaint(),
            formImage(),
            SizedBox(height: 10),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: BlocBuilder<BlocComplaint, BlocComplaintState>(
                  builder: (context, state) {
                if (state.status.isInProgress) {
                  return Center(child: CircularProgressIndicator());
                }

                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    context
                        .read<BlocComplaint>()
                        .add(BlocComplaintActionSubmit());
                  },
                  child: Text(
                    "Submit",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: white, fontWeight: FontWeight.w500),
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }

  Widget formImage() => BlocBuilder<BlocComplaint, BlocComplaintState>(
        builder: (context, state) => SectionImageComplaint(
          errorText: state.image.isPure ? null : state.image.error?.text,
          changeImage: (fileImage) {
            if (fileImage != null) {
              context
                  .read<BlocComplaint>()
                  .add(BlocComplaintChangeImage(image: fileImage));
            }
          },
        ),
      );

  BlocBuilder<BlocComplaint, BlocComplaintState> formComplaint() {
    return BlocBuilder<BlocComplaint, BlocComplaintState>(
        buildWhen: (previous, current) =>
            previous.complaint != current.complaint,
        builder: (context, state) {
          return MyFormInput(
            maxLines: 5,
            onChanged: (value) {
              context
                  .read<BlocComplaint>()
                  .add(BlocComplaintChangeComplaint(complaint: value));
            },
            hintText: "Type your complaint",
            labelText: "Complaint",
            errorText: state.complaint.isPure == false
                ? state.complaint.error?.text
                : null,
          );
        });
  }

  BlocBuilder<BlocComplaint, BlocComplaintState> formCompany() {
    return BlocBuilder<BlocComplaint, BlocComplaintState>(
        buildWhen: (previous, current) => previous.company != current.company,
        builder: (context, state) {
          return MyFormInput(
            onChanged: (value) {
              context
                  .read<BlocComplaint>()
                  .add(BlocComplaintChangeCompany(company: value));
            },
            hintText: "Enter name of Company/Office",
            labelText: "Company/Office",
            errorText: state.company.isPure == false
                ? state.company.error?.text
                : null,
          );
        });
  }

  Widget formAppName() {
    return BlocBuilder<BlocComplaint, BlocComplaintState>(
        buildWhen: (previous, current) => previous.appName != current.appName,
        builder: (context, state) {
          return MyFormInput(
            onChanged: (value) {
              context
                  .read<BlocComplaint>()
                  .add(BlocComplaintChangeAppName(appName: value));
            },
            hintText: "Enter the name application",
            labelText: "App Name",
            errorText: state.appName.isPure == false
                ? state.appName.error?.text
                : null,
          );
        });
  }
}
