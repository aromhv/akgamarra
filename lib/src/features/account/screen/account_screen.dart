import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/enum/color_enum.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storeHandler = context.read<AuthContext>();
    final user = storeHandler.user;

    return Scaffold(
      body: Column(
        children: [
          // Header con fondo degradado
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 220,
                color: ColorEnum.COLOR_PRINCIPAL.color,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      user != null && user.verified
                          ? '${user.firstName} ${user.lastName}'
                          : user?.alias ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      user != null && user.verified
                          ? 'Bienvenido a tu perfil'
                          : user?.email ?? '',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -40,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        user?.picture != null && user!.picture.isNotEmpty
                            ? NetworkImage(user.picture)
                            : const AssetImage(
                                  'assets/images/profile_placeholder.png',
                                )
                                as ImageProvider,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          // Stats (puedes reemplazarlos con datos reales si los tienes)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _StatItem(label: 'Puntos', value: '6'),
                _StatItem(label: 'Compras', value: '18'),
                _StatItem(label: 'Pedidos', value: '20'),
              ],
            ),
          ),
          const Divider(height: 20),
          // Opciones
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                // Mostrar los datos del usuario
                if (user != null) ...[
                  ListTile(
                    title: Text('Nombre'),
                    subtitle: Text(
                      user != null && user.verified
                          ? '${user.firstName ?? "Nombre no disponible"} ${user.lastName ?? "Apellido no disponible"}'
                          : user?.alias ?? '',
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                  ListTile(
                    title: Text('Teléfono'),
                    subtitle: Text(user.numberPhone ?? 'No disponible'),
                  ),
                  ListTile(
                    title: Text('Tipo de documento'),
                    subtitle: Text(user.documentType ?? 'No disponible'),
                  ),
                  ListTile(
                    title: Text('Número de documento'),
                    subtitle: Text(user.documentNumber ?? 'No disponible'),
                  ),
                  if (user.storeId != null)
                    ListTile(
                      title: Text('ID de tienda'),
                      subtitle: Text(user.storeId ?? 'No disponible'),
                    ),
                ],
                if (user != null && !user.verified)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ElevatedButton(
                      onPressed: () => context.go('/complete-data'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorEnum.COLOR_PRINCIPAL.color,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        "Completar mis datos",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class _OptionTile extends StatelessWidget {
  final IconData icon;
  final String label;

  const _OptionTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(label),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
