import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';

class GlobalVariable {
  static const Color secondaryColor = Color(0xFFFF9900);
  static const Color primaryColor = Color(0xFF232F3E);
}

enum Auth {
  signIn,
  signUp,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  Auth _auth = Auth.signUp;
  bool _isPasswordVisible = false;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final _signupFormKey = GlobalKey<FormState>();
  final _signinFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _toggleAuthMode() {
    _animationController.reverse().then((_) {
      setState(() {
        _auth = _auth == Auth.signUp ? Auth.signIn : Auth.signUp;
      });
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    
    if (isIOS) {
      return _buildCupertinoUI(context);
    } else {
      return _buildMaterialUI(context);
    }
  }

  Widget _buildCupertinoUI(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color(0xFFFFFFFF).withOpacity(0.9),
        border: null,
        middle: Text(
          _auth == Auth.signUp ? 'Create Account' : 'Sign In',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    _buildGlassmorphicLogo(),
                    const SizedBox(height: 32),
                    _buildHeader(),
                    const SizedBox(height: 40),
                    _buildCupertinoForm(),
                    const SizedBox(height: 32),
                    _buildDivider(),
                    const SizedBox(height: 32),
                    _buildCupertinoSocialButtons(),
                    const SizedBox(height: 40),
                    _buildToggleAuthMode(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMaterialUI(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    _buildGlassmorphicLogo(),
                    const SizedBox(height: 32),
                    _buildHeader(),
                    const SizedBox(height: 40),
                    _buildMaterialForm(),
                    const SizedBox(height: 32),
                    _buildDivider(),
                    const SizedBox(height: 32),
                    _buildMaterialSocialButtons(),
                    const SizedBox(height: 40),
                    _buildToggleAuthMode(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGlassmorphicLogo() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: GlobalVariable.secondaryColor.withOpacity(0.1),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
              size: 50,
              color: GlobalVariable.secondaryColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _auth == Auth.signUp ? 'Create Account' : 'Welcome Back',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: GlobalVariable.primaryColor,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          _auth == Auth.signUp
              ? 'Fill in your details to get started'
              : 'Sign in to continue your shopping journey',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildMaterialForm() {
    return Form(
      key: _auth == Auth.signUp ? _signupFormKey : _signinFormKey,
      child: Column(
        children: [
          if (_auth == Auth.signUp) ...[
            _buildMaterialTextField(
              controller: _nameController,
              label: 'Full Name',
              icon: Icons.person_outline,
              hint: 'John Doe',
            ),
            const SizedBox(height: 20),
          ],
          _buildMaterialTextField(
            controller: _emailController,
            label: 'Email Address',
            icon: Icons.email_outlined,
            hint: 'example@mail.com',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20),
          _buildMaterialTextField(
            controller: _passwordController,
            label: 'Password',
            icon: Icons.lock_outline,
            hint: '••••••••',
            isPassword: true,
            isPasswordVisible: _isPasswordVisible,
            onToggleVisibility: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
          if (_auth == Auth.signIn)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: GlobalVariable.secondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 32),
          _buildMaterialActionButton(),
        ],
      ),
    );
  }

  Widget _buildCupertinoForm() {
    return Form(
      key: _auth == Auth.signUp ? _signupFormKey : _signinFormKey,
      child: Column(
        children: [
          if (_auth == Auth.signUp) ...[
            _buildCupertinoTextField(
              controller: _nameController,
              placeholder: 'Full Name',
            ),
            const SizedBox(height: 16),
          ],
          _buildCupertinoTextField(
            controller: _emailController,
            placeholder: 'Email Address',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          _buildCupertinoTextField(
            controller: _passwordController,
            placeholder: 'Password',
            isPassword: true,
            isPasswordVisible: _isPasswordVisible,
            onToggleVisibility: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
          if (_auth == Auth.signIn)
            Align(
              alignment: Alignment.centerRight,
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(vertical: 8),
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: GlobalVariable.secondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 32),
          _buildCupertinoActionButton(),
        ],
      ),
    );
  }

  Widget _buildMaterialTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? hint,
    bool isPassword = false,
    bool isPasswordVisible = false,
    VoidCallback? onToggleVisibility,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: GlobalVariable.primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword && !isPasswordVisible,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            prefixIcon: Icon(icon, color: Colors.grey.shade400, size: 22),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey.shade400,
                    ),
                    onPressed: onToggleVisibility,
                  )
                : null,
            filled: true,
            fillColor: Colors.grey.shade50,
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: GlobalVariable.secondaryColor,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCupertinoTextField({
    required TextEditingController controller,
    required String placeholder,
    bool isPassword = false,
    bool isPasswordVisible = false,
    VoidCallback? onToggleVisibility,
    TextInputType? keyboardType,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: CupertinoTextField(
            controller: controller,
            obscureText: isPassword && !isPasswordVisible,
            keyboardType: keyboardType,
            placeholder: placeholder,
            placeholderStyle: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 16,
            ),
            style: const TextStyle(fontSize: 16),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            suffix: isPassword
                ? GestureDetector(
                    onTap: onToggleVisibility,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        isPasswordVisible
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }

  Widget _buildMaterialActionButton() {
    return SizedBox(
      width: double.infinity,
      
      height: 56,
      child: Material(
        color: Colors.transparent,
        
        child: InkWell(
          onTap: () {
            final key =
                _auth == Auth.signUp ? _signupFormKey : _signinFormKey;
            if (key.currentState!.validate()) {}
          },
          borderRadius: BorderRadius.circular(16),
          
          splashColor: Colors.white.withOpacity(0.3),
          highlightColor: Colors.white.withOpacity(0.2),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  GlobalVariable.secondaryColor,
                  GlobalVariable.secondaryColor.withOpacity(0.8),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: GlobalVariable.secondaryColor.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              _auth == Auth.signUp ? 'Create Account' : 'Sign In',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCupertinoActionButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: CupertinoButton(
        onPressed: () {
          final key = _auth == Auth.signUp ? _signupFormKey : _signinFormKey;
          if (key.currentState!.validate()) {}
        },
        color: GlobalVariable.secondaryColor,
        borderRadius: BorderRadius.circular(16),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(

          _auth == Auth.signUp ? 'Create Account' : 'Sign In',
          style: const TextStyle(
            
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade300)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Or continue with',
            style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey.shade300)),
      ],
    );
  }

  Widget _buildMaterialSocialButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildMaterialSocialButton('Google', Icons.g_mobiledata),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildMaterialSocialButton('Apple', Icons.apple),
        ),
      ],
    );
  }

  Widget _buildMaterialSocialButton(String label, IconData icon) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        splashColor: GlobalVariable.primaryColor.withOpacity(0.1),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: GlobalVariable.primaryColor, size: 24),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: GlobalVariable.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCupertinoSocialButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildCupertinoSocialButton('Google', Icons.g_mobiledata),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildCupertinoSocialButton('Apple', Icons.apple),
        ),
      ],
    );
  }

  Widget _buildCupertinoSocialButton(String label, IconData icon) {
    return CupertinoButton(
      onPressed: () {},
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: GlobalVariable.primaryColor, size: 24),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(
                    color: GlobalVariable.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToggleAuthMode() {
    return Center(
      child: GestureDetector(
        onTap: _toggleAuthMode,
        child: RichText(
          text: TextSpan(
            text: _auth == Auth.signUp
                ? 'Already have an account? '
                : "Don't have an account? ",
            style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
            children: [
              TextSpan(
                text: _auth == Auth.signUp ? 'Sign In' : 'Sign Up',
                style: const TextStyle(
                  color: GlobalVariable.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}