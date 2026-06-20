import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velora/Factory/profider_factory.dart';

class DrawerElement extends ConsumerStatefulWidget {
  const DrawerElement({super.key});

  @override
  ConsumerState<DrawerElement> createState() => _DrawerElementState();
}

class _DrawerElementState extends ConsumerState<DrawerElement> {
  String _activeItem = 'Dashboard';

  static const primaryColor = Color(0xFF006B3C);
  static const lightGreen = Color(0xFFE8F5EE);



  @override
  void initState() {
    super.initState();

    Future.microtask((){
      var controller = ref.read(authLocalFactory.notifier);
      controller.initAuthLocal();
    });
  }

  @override
  Widget build(BuildContext context) {
    var authLocalModel = ref.watch(authLocalFactory);
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          _buildHeader(title: authLocalModel.conID!),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 8),
              children: [
                _sectionLabel("Main"),
                _menuItem(icon: Icons.dashboard_outlined, title: "Dashboard"),
                _menuItem(
                  icon: Icons.receipt_outlined,
                  title: "Sales",
                  badge: "12",
                ),
                _menuItem(icon: Icons.inventory_2_outlined, title: "Inventory"),
                _menuItem(icon: Icons.bar_chart_outlined, title: "Reports"),
                _menuItem(
                  icon: CupertinoIcons.doc_on_clipboard,
                  title: "Orders",
                ),
                _divider(),
                _sectionLabel("Business"),
                _menuItem(
                  icon: Icons.local_shipping_outlined,
                  title: "Suppliers",
                ),
                _menuItem(icon: Icons.people_alt_outlined, title: "Customers"),
                _menuItem(icon: Icons.shopping_bag_outlined, title: "Purchase"),
                _menuItem(icon: Icons.payments_outlined, title: "Expenses"),
                _divider(),
                _sectionLabel("Tools"),
                _menuItem(icon: Icons.print_outlined, title: "Printer"),
                _menuItem(
                  icon: Icons.table_chart_outlined,
                  title: "Export Excel",
                ),
                _menuItem(icon: Icons.cloud_upload_outlined, title: "Backup"),
                _menuItem(
                  icon: Icons.notifications_outlined,
                  title: "Notifications",
                  badge: "3",
                ),
                _divider(),
                _sectionLabel("Account"),
                _menuItem(icon: Icons.settings_outlined, title: "Settings"),
                _menuItem(icon: Icons.star_outline, title: "Premium"),
                _menuItem(icon: Icons.help_outline, title: "Help"),
                _menuItem(icon: Icons.logout, title: "Logout", isDanger: true),
                const SizedBox(height: 12),
              ],
            ),
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader({required String title}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 56, left: 20, right: 20, bottom: 24),
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withOpacity(0.25),
                width: 1.5,
              ),
            ),
            child: const Icon(Icons.store, size: 28, color: Colors.white),
          ),
          const SizedBox(height: 14),
           Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            "Owner Account",
            style: TextStyle(color: Colors.white60, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _menuItem({
    required IconData icon,
    required String title,
    String? badge,
    bool isDanger = false,
    VoidCallback? onTap,
  }) {
    final isActive = _activeItem == title;
    final iconColor = isDanger
        ? const Color(0xFFC83C3C)
        : isActive
        ? Colors.white
        : Colors.grey.shade600;
    final iconBg = isDanger
        ? const Color(0xFFFBEBEB)
        : isActive
        ? primaryColor
        : Colors.grey.shade100;

    return GestureDetector(
      onTap: () {
        setState(() => _activeItem = title);
        onTap?.call();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? lightGreen : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isDanger
                      ? const Color(0xFFC83C3C).withOpacity(0.2)
                      : isActive
                      ? Colors.transparent
                      : Colors.grey.shade200,
                  width: 0.5,
                ),
              ),
              child: Icon(icon, size: 18, color: iconColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: isDanger
                      ? const Color(0xFFC83C3C)
                      : isActive
                      ? primaryColor
                      : Colors.black87,
                ),
              ),
            ),
            if (badge != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  badge,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 6),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: Colors.grey.shade400,
          fontWeight: FontWeight.w500,
          fontSize: 10,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      height: 0.5,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      color: Colors.grey.shade200,
    );
  }

  Widget _buildFooter() {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: lightGreen,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: primaryColor.withOpacity(0.15), width: 0.5),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                "V",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Velora POS",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: primaryColor,
                ),
              ),
              Text(
                "Version 1.0.0",
                style: TextStyle(color: Color(0xFF3B8C5A), fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
