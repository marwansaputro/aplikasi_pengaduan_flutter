import 'package:flutter/material.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/app/types/types.dart';
import 'package:integra_mobile/layout/column.dart';

class ItemNotification extends StatelessWidget {
  const ItemNotification({
    Key? key,
    required this.status,
    required this.notification,
    required this.date,
    required this.image,
    this.press,
  }) : super(key: key);

  final StatusPengaduan status;
  final String notification, image, date;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    bool isSuccess = true;
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
          const Icon(
            Icons.search,
            color: darkGrey,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: IColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status.name,
                  style: TextStyle(
                    color: isSuccess ? Colors.orange : Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  notification,
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
        ],
      ),
    );
  }
}
