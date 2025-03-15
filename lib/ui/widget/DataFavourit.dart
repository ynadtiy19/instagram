
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instgram_app/data/data_favourit_model.dart';
import 'package:instgram_app/ui/widget/username.dart';

class Data extends StatelessWidget {
  Data({super.key, required this.model});
 final DataFavouritModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Username(
            username: model.name.tr(),
          ),
          SizedBox(
            height: model.heightt,
            child: ListView(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
