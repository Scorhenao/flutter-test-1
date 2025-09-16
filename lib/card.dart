import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String orderCode;
  final String invoiceCode;
  final String provider;
  final double amount;
  final String date;
  final String status; // "Aprobado" o "Anulado"

  const OrderCard({
    super.key,
    required this.orderCode,
    required this.invoiceCode,
    required this.provider,
    required this.amount,
    required this.date,
    required this.status,
  });

  Map<String, Color> _getStatusColors() {
    if (status == "Aprobado") {
      return {
        'background': const Color(0xFFD2F5D3),
        'text': const Color(0xFF168700),
      };
    }
    if (status == "Anulado") {
      return {
        'background': const Color(0xFFFF8888),
        'text': const Color(0xFF870000),
      };
    }
    return {'background': Colors.grey.shade300, 'text': Colors.black};
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 18,
          bottom: 10,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Primera fila: Código y Monto
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  orderCode,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF152536),
                    fontSize: 16,
                  ),
                ),
                Text(
                  "\$${amount.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF152536),
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 4),

            // Segunda fila: Factura y Fecha
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  invoiceCode,
                  style: const TextStyle(color: Color(0XFF797979)),
                ),
                Text(date, style: const TextStyle(color: Color(0XFF797979))),
              ],
            ),

            const SizedBox(height: 10),

            // Proveedor
            Text(provider, style: const TextStyle(fontSize: 14)),

            const SizedBox(height: 30),

            // Estado + Iconos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) {
                    final colors = _getStatusColors();
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: colors['background'],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: colors['text'],
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    );
                  },
                ),
                Row(
                  children: const [
                    Image(
                      image: AssetImage('assets/images/Eye.png'),
                      width: 22,
                      height: 22,
                    ),
                    SizedBox(width: 10),
                    Image(
                      image: AssetImage('assets/images/minus-circle.png'),
                      width: 22,
                      height: 22,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
