import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:integra_mobile/domain/entities/entities.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/value/path_image.dart';
import 'package:integra_mobile/value/theme.dart';

class ItemComplaint extends StatelessWidget {
  const ItemComplaint({
    Key? key,
    required this.status,
    required this.complaint,
    required this.date,
    required this.image,
    this.press,
  }) : super(key: key);

  final StatusPengaduan status;
  final String complaint, image, date;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: primaryGreen,
        padding: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: white,
        elevation: 10,
        shadowColor: Theme.of(context).colorScheme.shadow.withOpacity(0.3),
      ),
      onPressed: press,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: const DecorationImage(
                  image: AssetImage(
                    pathImageDummyImage,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: IColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringUtils.capitalize(status.name),
                  style: TextStyle(
                    color: status == StatusPengaduan.success
                        ? Colors.green
                        : Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  complaint,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.remove_red_eye, size: 15, color: darkGrey),
        ],
      ),
    );
  }
}
