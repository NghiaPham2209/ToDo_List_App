import 'package:flutter/material.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

class cardBody extends StatelessWidget {
  cardBody({
    Key? key,
    required this.item,
    required this.handleDeleteTask,
    required this.index,
  }) : super(key: key);
  var item;
  var index;
  final Function handleDeleteTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: (index % 2 == 0) ? const Color(0xffDFDFDF) : const Color.fromARGB(255, 42, 197, 168),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xff4B4B4B),
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(
                  context,
                  title: const Text('Confirm'),
                  content: const Text('Would you like to remove?'),
                  textOK: const Text('Yes'),
                  textCancel: const Text('No'),
                )) {
                  return handleDeleteTask(item.id);
                }
                return;
              },
              child: const Icon(
                Icons.delete_outline,
                color: Color(0xff4B4B4B),
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
