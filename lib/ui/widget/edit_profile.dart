import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instgram_app/ui/screans/Edit_Profile.dart';
import 'package:instgram_app/ui/widget/container_button.dart';

class EditProfileInacount extends StatelessWidget {
  const EditProfileInacount({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                 onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EditProfile();
                }));
              },
                child: ContainerButton(
                  text: 'Edit profile'.tr(),
                  heightt: 40,
                  colorContaner: Color.fromRGBO(239, 239, 239, 1),
                  colorText: Colors.black,
                  weightt: 370,
                ),
              ),
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(239, 239, 239, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.person_add_sharp,
                    color: Colors.black,
                    size: 25,
                  )),
            ],
          );
  }
}