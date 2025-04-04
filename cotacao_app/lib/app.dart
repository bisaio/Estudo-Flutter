import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CotacaoApp extends StatelessWidget {
  var txtReais = TextEditingController();
  var txtResultado = TextEditingController();
  var conversao = "";

  void converter() async {
    String url = "https://economia.awesomeapi.com.br/json/last/$conversao";

    var response = await http.get(Uri.parse(url));

    Map<String, dynamic> dados = json.decode(response.body);
    //Map<tipo da chave, tipo do valor>

    double cotacao = double.parse(dados[conversao.replaceAll("-", "")]["ask"]);

    var resultado = double.parse(txtReais!.text) / cotacao;

    txtResultado.text = resultado.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            spacing: 10,
            children: [
              TextField(
                controller: txtReais,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Reais",
                  border: OutlineInputBorder(),
                ),
              ),
              DropdownMenu(
                onSelected: (value) => conversao = value!,
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: "USD-BRL", label: "Dólar Americano"),
                  DropdownMenuEntry(value: "CAD-BRL", label: "Dólar Canadense"),
                  DropdownMenuEntry(value: "EUR-BRL", label: "Euro"),
                  DropdownMenuEntry(value: "GBP-BRL", label: "Libra Esterlina"),
                  DropdownMenuEntry(value: "ARS-BRL", label: "Peso Argentino"),
                  DropdownMenuEntry(value: "BTC-BRL", label: "Bitcoin"),
                  DropdownMenuEntry(value: "LTC-BRL", label: "Litecoin"),
                  DropdownMenuEntry(value: "JPY-BRL", label: "Iene Japonês"),
                  DropdownMenuEntry(value: "CHF-BRL", label: "Franco Suíço"),
                  DropdownMenuEntry(value: "AUD-BRL",label: "Dólar"),
                  DropdownMenuEntry(value: "CNY-BRL", label: "Yuan Chinês"),
                  DropdownMenuEntry(value: "ILS-BRL",label: "Novo Shekel Israelense"),
                  DropdownMenuEntry(value: "ETH-BRL", label: "Ethereum"),
                  DropdownMenuEntry(value: "XRP-BRL", label: "XRP"),
                  DropdownMenuEntry(value: "DOGE-BRL", label: "Dogecoin"),
                  DropdownMenuEntry(value: "SGD-BRL",label: "Dólar de Cingapura"),
                  DropdownMenuEntry(value: "AED-BRL",label: "Dirham dos Emirados"),
                  DropdownMenuEntry(value: "DKK-BRL",label: "Coroa Dinamarquesa"),
                  DropdownMenuEntry(value: "HKD-BRL",label: "Dólar de Hong Kong"),
                  DropdownMenuEntry(value: "MXN-BRL", label: "Peso Mexicano"),
                  DropdownMenuEntry(value: "NOK-BRL",label: "Coroa Norueguesa"),
                  DropdownMenuEntry(value: "NZD-BRL",label: "Dólar Neozelandês"),
                  DropdownMenuEntry(value: "PLN-BRL", label: "Zlóti Polonês"),
                  DropdownMenuEntry(value: "SAR-BRL", label: "Riyal Saudita"),
                  DropdownMenuEntry(value: "SEK-BRL", label: "Coroa Sueca"),
                  DropdownMenuEntry(value: "THB-BRL", label: "Baht Tailandês"),
                  DropdownMenuEntry(value: "TRY-BRL", label: "Nova Lira Turca"),
                  DropdownMenuEntry(value: "TWD-BRL", label: "Dólar Taiuanês"),
                  DropdownMenuEntry(value: "VEF-BRL",label: "Bolívar Venezuelano"),
                  DropdownMenuEntry(value: "ZAR-BRL",label: "Rand Sul-Africano"),
                  DropdownMenuEntry(value: "CLP-BRL", label: "Peso Chileno"),
                  DropdownMenuEntry(value: "PYG-BRL",label: "Guarani Paraguaio"),
                  DropdownMenuEntry(value: "UYU-BRL", label: "Peso Uruguaio"),
                  DropdownMenuEntry(value: "COP-BRL", label: "Peso Colombiano"),
                  DropdownMenuEntry(value: "PEN-BRL", label: "Sol do Peru"),
                  DropdownMenuEntry(value: "BOB-BRL", label: "Boliviano"),
                  DropdownMenuEntry(value: "RUB-BRL", label: "Rublo Russo"),
                  DropdownMenuEntry(value: "INR-BRL", label: "Rúpia Indiana"),
                  DropdownMenuEntry(value: "XAU-BRL", label: "Ouro"),
                  DropdownMenuEntry(value: "XAG-BRL", label: "Prata Spot"),
                  DropdownMenuEntry(value: "RSD-BRL", label: "Dinar Sérvio"),
                  DropdownMenuEntry(value: "KRW-BRL", label: "Won Sul-Coreano"),
                  DropdownMenuEntry(value: "BRETT-BRL", label: "Brett"),
                  DropdownMenuEntry(value: "SOL-BRL", label: "Solana"),
                  DropdownMenuEntry(value: "BNB-BRL", label: "Binance Coin"),
                  DropdownMenuEntry(value: "CRC-BRL",label: "Colón Costarriquenho"),
                  DropdownMenuEntry(value: "RON-BRL", label: "Leu Romeno"),
                  DropdownMenuEntry(value: "EGP-BRL", label: "Libra Egípcia"),
                  DropdownMenuEntry(value: "KES-BRL",label: "Shilling Queniano"),
                  DropdownMenuEntry(value: "PHP-BRL", label: "Peso Filipino"),
                  DropdownMenuEntry(value: "HUF-BRL", label: "Florim Húngaro"),
                  DropdownMenuEntry(value: "CZK-BRL", label: "Coroa Checa"),
                ],
              ),
              ElevatedButton(
                onPressed: converter,
                child: const Text("Converter"),
              ),
              TextField(
                controller: txtResultado,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Dólares",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
