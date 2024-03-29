


import 'package:flutter/material.dart';
import 'package:hessen_app/global%20widgets/helpers/create_popup_menu.dart';
import 'package:hessen_app/global%20widgets/text_field.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required TextEditingController centerName,
    required this.centersNames,
    required TextEditingController associationName,
    required this.associations,
  }) : _centerName = centerName, _associationName = associationName;

  final TextEditingController _centerName;
  final List<String> centersNames;
  final TextEditingController _associationName;
  final Map<String, List<String>> associations;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFieldWidget(
            lableName: 'إسم المركز',
            password: false,
            textinput: TextInputType.name,
            controller: _centerName,
            maxLength: 60,
            ispassword: false,
            prefixIcon: PopupMenuButton(
              itemBuilder: (context) =>
                  createPopupMenu(list: centersNames),
              onSelected: (value) {
                _centerName.text = value;
              },
            ),
            onTap: (data) {
              _centerName.text = data!;
              return null;
            },
            validator: (String? data) {
              if (data!.isEmpty) {
                return 'لازم تكتب إسم المركز';
              }
              return null;
            },
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: TextFieldWidget(
            lableName: 'إسم الجمعية',
            password: false,
            textinput: TextInputType.name,
            controller: _associationName,
            maxLength: 60,
            ispassword: false,
            prefixIcon: PopupMenuButton(
              itemBuilder: (context) => createPopupMenu(
                  list: associations[_centerName.value.text]!.toList()),
              onSelected: (value) {
                _associationName.text = value;
              },
            ),
            onTap: (data) {
              _associationName.text = data!;
              return null;
            },
            validator: (String? data) {
              if (data!.isEmpty) {
                return 'لازم تكتب إسم الجمعية';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
