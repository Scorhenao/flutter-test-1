import 'package:flutter/material.dart';
import 'card.dart' as custom;
import 'search.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFE8E8E8),
        appBar: AppBar(
        backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsetsGeometry.all(8.0),
            child: const Text(
              'Compras',
              style: TextStyle(
                color: Color(0xFFB20000),
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          centerTitle: true,
          actions: [
            SizedBox(
              width:
                  MediaQuery.of(context).size.width *
                  0.2, // Ajusta el ancho según tus necesidades
              child: Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage("assets/images/Generic-avatar.png"),
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Search(),
              SizedBox(height: 20),
              custom.OrderCard(
                orderCode: "OC-2025-001",
                invoiceCode: "FAC-2025-1001",
                provider: "Proveedor A",
                amount: 1200.50,
                date: "2025-08-20",
                status: "Anulado",
              ),
              custom.OrderCard(
                orderCode: "OC-2025-002",
                invoiceCode: "FAC-2025-1002",
                provider: "Proveedor B",
                amount: 850.75,
                date: "2025-08-21",
                status: "Aprobado",
              ),
              custom.OrderCard(
                orderCode: "OC-2025-003",
                invoiceCode: "FAC-2025-1003",
                provider: "Proveedor C",
                amount: 1800.25,
                date: "2025-08-22",
                status: "Anulado",
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Column(
                  children: const [
                    Image(image: AssetImage("assets/images/Vector.png")),
                    Text(
                      "Cargar más compras ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFB20000),
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
