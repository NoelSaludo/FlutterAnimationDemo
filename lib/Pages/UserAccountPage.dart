import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/models/User.dart';

class UserAccountPage extends StatefulWidget {
  const UserAccountPage({Key? key}) : super(key: key);

  @override
  State<UserAccountPage> createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage>
    with TickerProviderStateMixin {
  late AnimationController _radialController;
  late AnimationController _fadeController;
  late Animation<double> _radialAnimation;
  late Animation<double> _fadeAnimation;
  User? user;

  @override
  void initState() {
    super.initState();
    _radialController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _radialAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _radialController,
      curve: Curves.easeOutCubic,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _loadUserData();
    _radialController.forward();
    _fadeController.forward();
  }

  @override
  void dispose() {
    _radialController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    try {
      final userData = await User.getSampleUser();
      setState(() {
        user = userData;
      });
    } catch (e) {
      print('Error loading user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF667eea),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF667eea),
              Color(0xFF764ba2),
              Color(0xFFf093fb),
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context),
              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: _buildContent(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            'My Account',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildUserProfile(),
            const SizedBox(height: 32),
            _buildMenuItems(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildUserProfile() {
    return Column(
      children: [
        Hero(
          tag: 'user_icon',
          child: AnimatedBuilder(
            animation: _radialAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: 0.8 + (0.2 * _radialAnimation.value),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF667eea),
                        Color(0xFF764ba2),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF667eea).withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: user != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      user!.profilePicture,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.person_rounded,
                          color: Colors.white,
                          size: 60,
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Icon(
                          Icons.person_rounded,
                          color: Colors.white,
                          size: 60,
                        );
                      },
                    ),
                  )
                      : const Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Text(
          user?.name ?? 'Loading...',
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3748),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          user?.email ?? 'Loading...',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItems() {
    final menuItems = [
      {'icon': Icons.person_outline_rounded, 'title': 'Edit Profile', 'color': const Color(0xFF667eea)},
      {'icon': Icons.favorite_outline_rounded, 'title': 'My Favorites', 'color': const Color(0xFFf093fb)},
      {'icon': Icons.shopping_bag_outlined, 'title': 'My Orders', 'color': const Color(0xFF43e97b)},
      {'icon': Icons.settings_outlined, 'title': 'Settings', 'color': const Color(0xFF4facfe)},
      {'icon': Icons.help_outline_rounded, 'title': 'Help & Support', 'color': const Color(0xFFf5576c)},
      {'icon': Icons.logout_rounded, 'title': 'Sign Out', 'color': Colors.grey[600]!},
    ];

    return Column(
      children: menuItems.map((item) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey.shade100,
              width: 1,
            ),
          ),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: (item['color'] as Color).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                item['icon'] as IconData,
                color: item['color'] as Color,
                size: 24,
              ),
            ),
            title: Text(
              item['title'] as String,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D3748),
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey,
              size: 16,
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${item['title']} tapped!'),
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
          ),
        );
      }).toList(),
    );
  }
}
