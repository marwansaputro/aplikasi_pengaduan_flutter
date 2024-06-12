import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/app/config/app_env.dart';
import 'package:integra_mobile/bloc/bloc.dart';
import 'package:integra_mobile/data/provider/network/network.dart';
import 'package:integra_mobile/app/config/app_constant.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/screens/profile/section_profile/bloc/bloc_change_image.dart';
import 'package:integra_mobile/screens/profile/section_profile/bottom_sheet/bottom_sheet_change_image.dart';
import 'package:integra_mobile/share/widget/mocullar/image/image_collector.dart';

class SectionPictureProfile extends StatefulWidget {
  const SectionPictureProfile({super.key});

  @override
  State<SectionPictureProfile> createState() => _SectionPictureProfileState();
}

class _SectionPictureProfileState extends State<SectionPictureProfile> {
  Uint8List? _image;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SizedBox(
          height: 100,
          width: 100,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              BlocBuilder<AuthenticationBloc, BlocAuthenticationState>(
                builder: (context, state) {
                  return state.user?.imageProfile != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: ImageCollector(
                              imageUrl: AppEnv()
                                  .baseProfile(state.user!.imageProfile!)),
                        )
                      : _image != null
                          ? CircleAvatar(backgroundImage: MemoryImage(_image!))
                          : const CircleAvatar(
                              backgroundImage:
                                  AssetImage(pathImageDummyProfile));
                },
              ),
              Positioned(
                right: -8.0,
                bottom: 0.0,
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: primaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(color: Colors.white),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: showImagePickerProfile,
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showImagePickerProfile() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      context: context,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => BlocChangeImage(context.read<UserRepository>()),
          child: BlocListener<BlocChangeImage, BlocChangeImageState>(
            listener: (context, state) {
              if (state.status.isFailure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text("Tidak berhasil mengubah image")));

                Navigator.pop(context);
              }

              if (state.status.isSuccess) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text("Berhasil mengubah gambar profile")));

                Navigator.pop(context);
              }
            },
            child: BlocBuilder<BlocChangeImage, BlocChangeImageState>(
              builder: (context, state) {
                if (state.status.isInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return BottomSheetChangeImage(
                  onImagePick: (image) {
                    context
                        .read<BlocChangeImage>()
                        .add(BlocChangeImageEventChangeImage(file: image));
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
