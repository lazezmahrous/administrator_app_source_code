import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hessen_app/global%20widgets/text_field.dart';

import '../../../global widgets/elevated_button_widget.dart';
import '../../../global widgets/helpers/create_popup_menu.dart';
import '../cubits/complet_order_cubit/complet_order_cubit.dart';
import 'get_orignal_amount.dart';

class AmountDetailsWidget extends StatelessWidget {
  const AmountDetailsWidget({
    super.key,
    required TextEditingController centerName,
    required this.centersNames,
    required TextEditingController associationName,
    required this.associations,
  })  : _centerName = centerName,
        _associationName = associationName;
  final TextEditingController _centerName;
  final List<String> centersNames;
  final TextEditingController _associationName;
  final Map<String, List<String>> associations;

  @override
  Widget build(BuildContext context) {
    final TextEditingController item = TextEditingController();
    final TextEditingController amount = TextEditingController();
    final TextEditingController unit = TextEditingController();
    final TextEditingController keloPrice = TextEditingController();
    final TextEditingController tonPrice = TextEditingController();
    final GlobalKey<FormState> formKay = GlobalKey();

    final List<String> items = [
      'يوريا',
      'نترات',
      'سوبر محبب',
      'سوبر ناعم',
      'مخصبات بوتاسيوم',
      'مخصبات كونفست',
      'مبيدات',
    ];

    final List<String> amountUnit = [
      'طن',
      'كيلو',
    ];

    return Form(
      key: formKay,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const GetOrignalItemsWidget(),
          const SizedBox(
            height: 30,
          ),
          Row(
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
          ),
          Row(
            children: [
              Expanded(
                child: TextFieldWidget(
                  lableName: 'إسم الصنف',
                  password: false,
                  textinput: TextInputType.name,
                  controller: item,
                  maxLength: 60,
                  ispassword: false,
                  prefixIcon: PopupMenuButton(
                    itemBuilder: (context) => createPopupMenu(list: items),
                    onSelected: (value) {
                      item.text = value;
                    },
                  ),
                  onTap: (data) {
                    _centerName.text = data!;
                    return null;
                  },
                  validator: (String? data) {
                    if (data!.isEmpty) {
                      return 'لازم تكتب إسم الصنف';
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
                  lableName: 'الكمية',
                  password: false,
                  textinput: TextInputType.name,
                  controller: amount,
                  maxLength: 60,
                  ispassword: false,
                  onTap: (data) {
                    amount.text = data!;
                    return null;
                  },
                  validator: (String? data) {
                    if (data!.isEmpty) {
                      return 'لازم تكتب الكمية';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextFieldWidget(
                  lableName: 'وحدة قياس الكمية',
                  password: false,
                  textinput: TextInputType.name,
                  controller: unit,
                  maxLength: 60,
                  ispassword: false,
                  prefixIcon: PopupMenuButton(
                    itemBuilder: (context) => createPopupMenu(list: amountUnit),
                    onSelected: (value) {
                      unit.text = value;
                    },
                  ),
                  onTap: (data) {
                    unit.text = data!;
                    return null;
                  },
                  validator: (String? data) {
                    if (data!.isEmpty) {
                      return 'لازم تكتب قياس الكمية';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextFieldWidget(
                  lableName: 'سعر الكيلو',
                  password: false,
                  textinput: TextInputType.name,
                  controller: keloPrice,
                  maxLength: 60,
                  ispassword: false,
                  onTap: (data) {
                    keloPrice.text = data!;
                    return null;
                  },
                  validator: (String? data) {
                    if (data!.isEmpty) {
                      return 'لازم تكتب سعر الكيلو';
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
                  lableName: 'سعر الطن',
                  password: false,
                  textinput: TextInputType.name,
                  controller: tonPrice,
                  maxLength: 60,
                  ispassword: false,
                  onTap: (data) {
                    tonPrice.text = data!;
                    return null;
                  },
                  validator: (String? data) {
                    if (data!.isEmpty) {
                      return 'لازم تكتب سعر الطن';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButtonWidget(
                  onPressed: () async {
                    if (formKay.currentState!.validate()) {
                      await BlocProvider.of<CompletOrderCubit>(context)
                          .completOrder(
                        centerName: _centerName.value.text,
                        association: _associationName.value.text,
                        decreaseAmount:
                            double.tryParse(amount.value.text.toString()) ??
                                0.0,
                        itemName: item.value.text,
                        amountUnit: unit.value.text,
                        tonUnitPrice:
                            double.tryParse(tonPrice.value.text.toString()) ??
                                0.0,
                        keloUnitPrice:
                            double.tryParse(keloPrice.value.text.toString()) ??
                                0.0,
                      );
                    } else {}
                  },
                  text: 'إضافة الكمية',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
