import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/screens/login.dart';
import 'package:infinity_bank/presentation/screens/register_account.dart';
import 'package:infinity_bank/presentation/screens/register_user.dart';
import 'package:infinity_bank/presentation/widgets/TileSetting.dart';

class Profileinfo extends StatefulWidget {
  const Profileinfo({super.key});

  @override
  State<Profileinfo> createState() => _ProfileinfoState();
}

//*Cuenta
class _ProfileinfoState extends State<Profileinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.primary,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColorStyle.secundary2,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BtnTileSetts(
                icon: Icons.account_balance_wallet,
                title: "Billetera",
                subtitle: "Gestiona tu billetera y tarjetas",
                onTap: () {},
              ),
              BtnTileSetts(
                icon: Icons.swap_horiz,
                title: "Límites de Transferencia",
                subtitle: "Administra tus límites de transferencia",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterAccount()),
                  );
                },
              ),
              BtnTileSetts(
                icon: Icons.payment,
                title: "Métodos de Pago",
                subtitle: "Edita tus métodos de pago",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterUser()),
                  );
                },
              ),
              BtnTileSetts(
                icon: Icons.history,
                title: "Historial de Transacciones",
                subtitle: "Consulta tus transacciones pasadas",
                onTap: () {},
              ),
              BtnTileSetts(
                icon: Icons.favorite,
                title: "Favoritos",
                subtitle: "Gestiona tus transacciones favoritas",
                onTap: () {},
              ),
              BtnTileSetts(
                icon: Icons.exit_to_app,
                title: "Cerrar Sesión",
                subtitle: "Cierra la sesión de tu cuenta",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
              ),
              BtnTileSetts(
                icon: Icons.delete_forever,
                title: "Eliminar Cuenta",
                subtitle: "Elimina tu cuenta permanentemente",
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

//*Seguridad
class Profileinfo2 extends StatefulWidget {
  const Profileinfo2({super.key});

  @override
  State<Profileinfo2> createState() => _Profileinfo2State();
}

class _Profileinfo2State extends State<Profileinfo2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.primary,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColorStyle.secundary2,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BtnTileSetts(
                icon: Icons.visibility,
                title: "Visibilidad de la Cuenta",
                subtitle: "Controla quién ve la información de tu cuenta",
                onTap: () {},
              ),
              BtnTileSetts(
                icon: Icons.security,
                title: "Seguridad",
                subtitle: "Mejora la seguridad de la cuenta",
                onTap: () {},
              ),
              BtnTileSetts(
                icon: Icons.phonelink_lock,
                title: "Gestión de Dispositivos",
                subtitle: "Administra tus dispositivos conectados",
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileInfo3 extends StatefulWidget {
  const ProfileInfo3({super.key});

  @override
  State<ProfileInfo3> createState() => _ProfileInfo3State();
}

//*Personalizacion
class _ProfileInfo3State extends State<ProfileInfo3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.primary,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColorStyle.secundary2,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BtnTileSetts(
                icon: Icons.edit,
                title: "Cambiar Apodo",
                subtitle: "Edita tu apodo de usuario",
                onTap: () {},
              ),
              BtnTileSetts(
                icon: Icons.camera_alt,
                title: "Cambiar Foto de Perfil",
                subtitle: "Actualiza tu foto de perfil",
                onTap: () {},
              ),
              BtnTileSetts(
                icon: Icons.language,
                title: "Idioma",
                subtitle: "Cambia el idioma de la aplicación",
                onTap: () {},
              ),
              BtnTileSetts(
                icon: Icons.format_paint,
                title: "Tema",
                subtitle: "Personaliza el tema de la aplicación",
                onTap: () {},
              ),
              BtnTileSetts(
                icon: Icons.notifications,
                title: "Notificaciones",
                subtitle: "Personaliza tus notificaciones",
                onTap: () {},
              ),
              BtnTileSetts(
                icon: Icons.share,
                title: "Redes Sociales",
                subtitle: "Gestiona tus conexiones de redes sociales",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
