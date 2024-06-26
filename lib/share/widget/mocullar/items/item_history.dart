import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:integra_mobile/app/types/types.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/app/config/app_constant.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/share/widget/mocullar/image/image_collector.dart';

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
          SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ImageCollector(imageUrl: image)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: IColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringUtils.capitalize(status.name),
                  style: TextStyle(
                    color: status.color,
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
