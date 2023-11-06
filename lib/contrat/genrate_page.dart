import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:projet_app/fichie_paie/mobile.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class GeneratePage extends StatefulWidget {
  GeneratePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _GeneratePageState createState() => _GeneratePageState();
}

class _GeneratePageState extends State<GeneratePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Create PDF'),
            onPressed: _createPDF,
          ),
        ));
  }

  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    page.graphics.drawString('Contrat de travail (type du contrat)',
        PdfStandardFont(PdfFontFamily.helvetica, 20, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(200, 50, 200, 50),
        brush: PdfBrushes.black,
        pen: PdfPens.black,
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    page.graphics.drawString(
        'La manufacture, 3 Rue du Dr Huart, 59260 Lille, France',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(300, 180, 200, 50),
        format: PdfStringFormat(alignment: PdfTextAlignment.right));

    page.graphics.drawString('UPCOFRRE',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(300, 160, 200, 50),
        format: PdfStringFormat(alignment: PdfTextAlignment.right));

    page.graphics.drawString('nom et signature :',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(250, 670, 200, 50),
        format: PdfStringFormat(alignment: PdfTextAlignment.right));

    page.graphics.drawString('Entre les Soussignes : ',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(0, 220, 200, 50),
        brush: PdfBrushes.black,
        pen: PdfPens.black,
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    page.graphics.drawString(
        'La commune, l/établissemet de INSY2S représenté(e) par M.NIZAR agissanten qualité.',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(0, 270, 0, 0),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    page.graphics.drawString('D une part, ',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(0, 290, 0, 50),
        brush: PdfBrushes.black,
        pen: PdfPens.black,
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    page.graphics.drawString('et',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(0, 310, 0, 50),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    page.graphics.drawString(
        'M ............. avec le codee de travail SIRET ...............et situe a ................................',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(0, 340, 0, 50),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    page.graphics.drawString('D autre part, ',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(0, 360, 0, 50),
        brush: PdfBrushes.black,
        pen: PdfPens.black,
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    page.graphics.drawString(
        'Le presente contrat de travail est conclu pour une durée déterminée du ................... au .............avec le Taux ........(£) et TJM ...........(£).',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(0, 380, 500, 150),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    page.graphics.drawString('Il a été convenu ce qui suit :  ',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(0, 430, 0, 50),
        brush: PdfBrushes.black,
        pen: PdfPens.black,
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    page.graphics.drawString('Article 1 : OBJET ',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(0, 450, 0, 50),
        brush: PdfBrushes.black,
        pen: PdfPens.black,
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    page.graphics.drawString(
        'M .......(nom Consultant)......... est embauche par La ......(nom Client)............ dans le cadre dun parcours emploi Professionnel en contrat.............(CDI/CDD).',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(0, 470, 500, 150),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    page.graphics.drawString('Article 2 : NATURE DE L EMPLOI ',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(0, 510, 0, 50),
        brush: PdfBrushes.black,
        pen: PdfPens.black,
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    page.graphics.drawString(
        'Le co-contractant est embauché en qualite de ingineur informatique pour des activités repondant a des besoins collectifs non satisfaits, et sera chargé notamment de :..........(refMission).',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(0, 530, 500, 150),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    page.graphics.drawString('Article 3 :  ',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(0, 580, 0, 50),
        brush: PdfBrushes.black,
        pen: PdfPens.black,
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    page.graphics.drawString('Article 4 :  ',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(0, 600, 0, 50),
        brush: PdfBrushes.black,
        pen: PdfPens.black,
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    page.graphics.drawImage(PdfBitmap(await _readImageData('upcofree.jpg')),
        Rect.fromLTWH(0, 0, 100, 100));

    List<int> bytes = await document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }
}

Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('lib/images/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
