import 'dart:ui';

import 'package:flutter/material.dart';

String STUDENT_COLLECTION = "STUDENT_COLLECTION";
const primaryColor = Color(0xff0074af);
const primaryColor2 = Color(0xfff9b600);

List<String>? academic_year = [
  "الأول الابتدائي",
  "الثاني الابتدائي",
  "الثالث الابتدائي",
  "الرابع الابتدائي",
  "الخامس الابتدائي",
  "السادس الابتدائي",
  "الأول الاعدادي",
  "الثاني الاعدادي",
  "الثالث الاعدادي",
  "الأول الثانوي",
  "الثاني الثانوي",
  "الثالث الثانوي",
];
List<String>? Academic_type = [
  "تربية و تعليم",
  "أزهري",
];
List<String>? grade = [
  "ممتاز",
  "جيد جدا",
  "جيد",
  "مقبول",
];
String selectedSurah = "الفاتحة";
List<String>? teachers = [
  "ahmedshaban@gmail.com",
  "hamzasaied@gmail.com",
  "omaratef@gmail.com",
  "ammartaha@gmail.com",
  "mohamedmorsy@gmail.com",
];

List<String>? city = [
  "المقطم-الهضبه العليا",
  "المقطم-الهضبه الوسطى",
  "مدينة نصر",
  "التجمع الخامس",
  "المعادي",
];

List<String>? quran = [
  "الفاتحة",
  "البقرة",
  "ال عمران",
  "النساء",
  "المائدة",
  "الأنعام",
  "الأعراف",
  "الأنفال",
  "التوبة",
  "يونس",
  "هود",
  "يوسف",
  "الرعد",
  "ابراهيم",
  "الحجر",
  "النحل",
  "الاسراء",
  "الكهف",
  "مريم",
  "طه",
  "الانبياء",
  "الحج",
  "المؤمنون",
  "النور",
  "الفرقان",
  "الشعراء",
  "النمل",
  "القصص",
  "العنكبوت",
  "الروم",
  "لقمان",
  "السجده",
  "الاحزاب",
  "سبأ",
  "فاطر",
  "يس",
  "الصافات",
  "ص",
  "الزمر",
  "غافر",
  "فصلت",
  "الشورى",
  "الزخرف",
  "الدخان",
  "الجاثيه",
  "الاحقاف",
  "محمد",
  "الفتح",
  "الحجرات",
  "ق",
  "الذاريات",
  "الطور",
  "النجم",
  "القمر",
  "الرحمن",
  "الواقعه",
  "الحديد",
  "المجادله",
  "الحشر",
  "الممتحنه",
  "الصف",
  "الجمعه",
  "المنافقون",
  "التغابن",
  "الطلاق",
  "التحريم",
  "المللك",
  "القلم",
  "الحاقة",
  "المعارج",
  "نوح",
  "الجن",
  "المزمل",
  "المدثر",
  "القيامه",
  "الانسان",
  "المرسلات",
  "النبأ",
  "النازعات",
  "عبس",
  "التكوير",
  "الانفطار",
  "المطففين",
  "الانشقاق",
  "البروج",
  "الطارق",
  "الاعلى",
  "الغاشيه",
  "الفجر",
  "البلد",
  "الشمس",
  "الليل",
  "الضحى",
  "الشرح",
  "التين",
  "العلق",
  "القدر",
  "البينه",
  "الزلزله",
  "العاديات",
  "القارعه",
  "التكاثر",
  "العصر",
  "الهمزه",
  "الفيل",
  "قريش",
  "الماعون",
  "الكوثر",
  "الكافرون",
  "النصر",
  "المسد",
  "الاخلاص",
  "الفلق",
  "الناس",
];
