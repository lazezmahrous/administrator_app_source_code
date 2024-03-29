import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/collect_money/cubits/collect_money_cubit/collect_money_cubit.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/collect_money/cubits/decrease_money_cubit/decrease_money_cubit.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/collect_money/widgets/get_mony_widget.dart';
import 'package:hessen_app/constanc.dart';
import 'package:hessen_app/global%20widgets/helpers/show_snack_bar.dart';
import 'package:hessen_app/global%20widgets/search_widget.dart';
import 'package:hessen_app/global%20widgets/elevated_button_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CollectMoney extends StatefulWidget {
  const CollectMoney({super.key});

  @override
  State<CollectMoney> createState() => _CollectMoneyState();
}

class _CollectMoneyState extends State<CollectMoney> {
  final TextEditingController _centerName = TextEditingController();

  final TextEditingController _associationName = TextEditingController();

  final GlobalKey<FormState> _formKay = GlobalKey();

  final List<String> centersNames = [
    'الفيوم',
    'سنورس',
    'طاميه',
    'إطسا',
    'يوسف الصديق',
    'أبشواي',
  ];

  final Map<String, List<String>> associations = {
    "الفيوم": [
      'العامرية',
      'هوارة المقطع',
      'تلات',
      'سنوفر',
      'الحادقة',
      'هوارة عدلان',
      'الناصرية',
      'الحامدية الجديدة',
      'ابجيج',
      'المندرة',
      'منشاة الفيوم',
      'اللاهون',
      'العزب',
      'العدوة',
      'الصالحية',
      'السنباط',
      'البسيونية',
      'الاعلام',
      'بني صالح',
      'منشاة العشيري',
      'دمو',
      'زاوية الكرداسة',
      'سيلا',
      'قحافة',
      'بندر الفيوم',
      'دار الرماد',
      'الشيخ فضل',
      'ابوالسعود',
      'منشاة الخطيب',
      'كفور النيل',
      'منشاة دمو',
      'منشاة عبدالله',
      'منشاة فتيح',
      'منشاة بغداد',
      'منشاة سكران',
      'نزلة بشير',
      'منشاة كمال',
      'دمشقين',
      'دسيا',
    ],
    "سنورس": [
      "سنورس أول",
      "سنورس تانى",
      "منشاه سنورس",
      "ا منشاة طنطاوى",
      "منشاة بنى عتمان",
      "اجيلة",
      "الإخصاص",
      "مطرطارس",
      "جرفس",
      "الكعابى الجديدة",
      "بيهمو",
      "ابهيت الحجر",
      "ترسا",
      "كفر فرازه",
      "نقاليفة",
      "السيلين",
      "فيديمين",
      "منشاة دكم",
      "سنرو القبلية",
      "سنهور البحرية",
      "السعيدية",
    ],
    "طاميه": [
      "دار السلام",
      "كفر عميرة",
      "عزب سرسنا",
      "سرسنا",
      "المقاتلة ناصر",
      "يونس",
      "فرقص",
      "الروبيات",
      "البرانى",
      "العزيزية",
      "هوجمين",
      "الروضة",
      "منشاة الجمال",
      "الكومي",
      "الفهمية",
      "قصر رشوان",
      "كفر محفوظ",
      "بندر طامية",
      "فانوس",
      "المظاطلي",
      "م .عفيفي",
    ],
    "اطسا": [
      "منشأة حلفا",
      "منشاة ربيع",
      "منشاة رحمى",
      "منشاة رمزى",
      "معصرة عرفة",
      "منشاة صبرى",
      "منشاة عبد المجيد",
      "نوارة",
      "بندر اطسا",
      "الصوافئة",
      "دفنو",
      "ع . الجعافرة",
      "ابودفية",
      "منشاة . فيصل",
      "معجون",
      "مطول",
      "قلمشاه",
      "قلهانة",
      "منشاة ظافر",
      "قصر الباسل",
      "عنك",
      "عزبة قلمشاه",
      "م. سيف",
      "شدموه",
      "دانيال",
      "خلف",
      "جردو",
      "تطون",
      "بحرابو المير",
      "منشاة الامير",
      "الونايسة",
      "منيه الحيط",
      "المحمودية",
      "القاسمية",
      "الغرق قبلي",
      "العوفي",
      "ابو صير دفنو",
      "اهريت",
      "الجعافره",
      "الحمدية",
      "الحجر",
      "الحسينية",
      "السعدة",
      "عتامنة المزارعة",
      "الغابة",
      "الغرق بحري",
    ],
    "أبشواي": [
      "منشأة ابشواي",
      "الخالدية",
      "أبو شنب",
      "منشأة هويدي",
      "ابو جنشو",
      "العلوية",
      "ابوكساه",
      "زيد",
      "شكشوك",
      "كفر عبود",
      "الجيلاني",
      "سنرو القبلية",
      "قصر بياض",
      "سنرو البحرية",
      "طبهار",
      "ابو دنقاش",
      "العجميين",
      "النصارية",
    ],
    "يوسف الصديق": [
      "قارون اباظة",
      "منشاة قارون",
      "قارون والي",
      "الصبيحي",
      "المشرك قبلي",
      "العقيلي",
      "ابو لطيعة",
      "الرواشدية",
      "كحك بحري",
      "كحك قبلي",
      "الصعايدة القبلية",
      "الشواشنة",
      "بطن إهريت القبليه",
      "بطن إهريت البحريه",
      "قصر الجبالي",
      "النزلة",
      "الربع",
      "المقراني",
      "الحامولي",
      "شعلان",
      "سالم عبداللة",
      "المشرك بحري",
      "الشهيد عبدالباسط",
    ],
  };

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final refreshData = BlocProvider.of<CollectMoneyCubit>(context);
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: SpinKitPulse(
        color: Constanc.kColorGreen,
        size: 100.0,
      ),
      child: BlocListener<DecreaseMoneyCubit, DecreaseMoneyState>(
        listener: (context, state) {
          if (state is DecreaseMonyeLoading) {
            Navigator.pop(context);

            setState(() {
              isLoading = true;
            });
          } else if (state is DecreaseMonyeSuccess) {
            setState(() {
              isLoading = false;
            });
            showSnackBarSuccess(
                context: context, message: 'تم سحب المبلغ بنجاح');
            refreshData.collectMoney(
              centerName: _centerName.value.text,
              association: _associationName.value.text,
            );
          } else if (state is DecreaseMonyeFailure) {
            setState(() {
              isLoading = false;
            });

            showSnackBarEror(context, 'حدث خطأ', 0);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('تحصيل فلوس'),
          ),
          body: Form(
            key: _formKay,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: [
                SearchWidget(
                  centerName: _centerName,
                  centersNames: centersNames,
                  associationName: _associationName,
                  associations: associations,
                ),
                ElevatedButtonWidget(
                  onPressed: () async {
                    if (_formKay.currentState!.validate()) {
                      await BlocProvider.of<CollectMoneyCubit>(context)
                          .collectMoney(
                        centerName: _centerName.value.text,
                        association: _associationName.value.text,
                      );
                    } else {}
                  },
                  text: 'عرض الفلوس',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GetMonyWidget(
                    centerName: _centerName.value.text,
                    association: _associationName.value.text,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
