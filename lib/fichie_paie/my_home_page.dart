import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../facture/invoice_product.dart';
import '../facture/invoice_service.dart';
import 'mobile.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PdfInvoiceService service = PdfInvoiceService();
  List<Product> products = [
    Product("Tache Front", 19.99, 19),
    Product("TAche Authentification", 15.30, 19),
    Product("Backend Complet", 26.43, 19),
    Product("Mission4", 5.99, 7),
  ];
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("FACTURE"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final currentProduct = products[index];
                  return Row(
                    children: [
                      Expanded(child: Text(currentProduct.name)),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                                "Prix: ${currentProduct.price.toStringAsFixed(2)} €"),
                            Text(
                                "TVA ${currentProduct.vatInPercent.toStringAsFixed(0)} %")
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 225, 230, 236),
                                borderRadius: BorderRadius.circular(55),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() => currentProduct.amount++);
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                currentProduct.amount.toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 225, 230, 236),
                                borderRadius: BorderRadius.circular(55),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() => currentProduct.amount--);
                                },
                                icon: const Icon(Icons.remove),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
                itemCount: products.length,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("TT"), Text("${getVat()} €")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("TTC"), Text("${getTotal()} €")],
            ),
            ElevatedButton(
              onPressed: () async {
                final data = await service.createInvoice(products);
                service.savePdfFile("invoice_$number", data);
                number++;
              },
              child: ElevatedButton(
                child: Text('Generate Facture'),
                onPressed: _createPDF,
              ),
            ),
          ],
        ),
      ),
    );
  }

  getTotal() => products
      .fold(0.0,
          (double prev, element) => prev + (element.price * element.amount))
      .toStringAsFixed(2);

  getVat() => products
      .fold(
          0.0,
          (double prev, element) =>
              prev +
              (element.price / 100 * element.vatInPercent * element.amount))
      .toStringAsFixed(2);

  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    page.graphics.drawString('Nom du consultant : Aymen',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(0, 140, 200, 50),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    page.graphics.drawString('Contact du cosultant : 52623878',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(0, 160, 200, 50),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    page.graphics.drawString('Adresse du cosultant : 75002 Lille, France',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(0, 180, 200, 50),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    page.graphics.drawString('Nom du client : Insy2s',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(310, 140, 200, 200),
        format: PdfStringFormat(alignment: PdfTextAlignment.right));

    page.graphics.drawString('Contact du client : Insy2s',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(310, 160, 200, 200),
        format: PdfStringFormat(alignment: PdfTextAlignment.right));

    page.graphics.drawString('Adresse du client : 75002 Paris',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(310, 180, 200, 200),
        format: PdfStringFormat(alignment: PdfTextAlignment.right));

    page.graphics.drawImage(PdfBitmap(await _readImageData('upcofree1.jpg')),
        Rect.fromLTWH(200, 0, 100, 100));

    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
      cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2),
    );

    grid.columns.add(count: 7);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Designation';
    header.cells[1].value = 'Quantite';
    header.cells[2].value = 'Prix unitaire';
    header.cells[3].value = 'Taux TVA';
    header.cells[4].value = 'Montant HT';
    header.cells[5].value = 'Montant Tva';
    header.cells[6].value = 'Montant TTC';

    PdfGridRow row = grid.rows.add();
    row.cells[0].value = 'Deployment du up coffre';
    row.cells[1].value = '2';
    row.cells[2].value = '6';
    row.cells[3].value = '12';
    row.cells[4].value = '1665£';
    row.cells[5].value = '232£';
    row.cells[6].value = '1223£';

    row = grid.rows.add();
    row.cells[0].value = 'configure platforme ';
    row.cells[1].value = '32';
    row.cells[2].value = '1234';
    row.cells[3].value = '14';
    row.cells[4].value = '56443£';
    row.cells[5].value = '4456£';
    row.cells[6].value = '4533£';

    row = grid.rows.add();
    row.cells[0].value = 'CONFIGURE BACKEND';
    row.cells[1].value = '12';
    row.cells[2].value = '2345';
    row.cells[3].value = '11%';
    row.cells[4].value = '6653£';
    row.cells[5].value = '438£';
    row.cells[6].value = '3453£';

    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));

    List<int> bytes = await document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }
}

Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('lib/images/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
