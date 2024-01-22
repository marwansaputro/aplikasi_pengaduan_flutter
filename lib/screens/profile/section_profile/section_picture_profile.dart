import 'package:flutter/material.dart';
import 'package:integra_mobile/value/path_image.dart';

class SectionPictureProfile extends StatelessWidget {
  const SectionPictureProfile({super.key});

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
              const CircleAvatar(
                backgroundImage: AssetImage(pathImageDummyProfile),
              ),
              Positioned(
                right: -16.0,
                bottom: 0.0,
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(color: Colors.white),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {},
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
}
