import 'package:api/Screen/ContasScreen.dart';
import 'package:api/Screen/ImpostosScreen.dart';
import 'package:api/Widgets/MenuButtons.dart';
import 'package:api/Widgets/OptionCard.dart';
import 'package:api/Screen/ClientScreen.dart';
import 'package:api/Screen/NfceScreen.dart';
import 'package:api/Screen/ProdutoScreen.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: Color(0xFF1d1d1d),
        width: 1,
        child: Center(
          child: Column(
            children: [
              WindowTitleBarBox(
                child: Row(
                  children: [
                    Expanded(
                      child: MoveWindow(),
                    ),
                    WindowButtons()
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 70, top: 40),
                child: Text(
                  'Omie',
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    fontSize: 84,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OptionCard(
                    name: 'NFC-e',
                    color: Colors.amber,
                    icon: Icons.file_copy_rounded,
                    screen: NfceScreen(),
                  ),
                  OptionCard(
                    name: 'Clientes',
                    color: Colors.indigo,
                    icon: Feather.users,
                    screen: ClientScreen(),
                  ),
                  OptionCard(
                    name: 'Produtos',
                    color: Colors.red,
                    icon: Feather.shopping_bag,
                    screen: ProdutoScreen(),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OptionCard(
                    name: 'Contas',
                    color: Colors.green,
                    icon: Icons.attach_money,
                    screen: ContasScreen(),
                  ),
                  OptionCard(
                    name: 'Impostos',
                    color: Colors.purple,
                    icon: Feather.edit,
                    screen: ImpostoScreen(),
                  ),
                  OptionCard(
                    name: 'Opções',
                    color: Colors.black,
                    icon: Icons.room_preferences,
                    screen: HomeScreen(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
