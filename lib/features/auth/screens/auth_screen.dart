import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoping_app/features/auth/services/auth_services.dart';

// ══════════════════════════════════════════════════════════════════════════════
//  AuthScreen
// ══════════════════════════════════════════════════════════════════════════════

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const String routeName = '/auth-screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signin;
  bool _obscurePassword = true;
  bool _isLoading = false;
  final AuthServices authServices = AuthServices();

  final _signupFormKey = GlobalKey<FormState>();
  final _signinFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _switchTab(Auth tab) {
    if (_auth == tab) return;
    setState(() => _auth = tab);
  }

  void _signInUser() {
    // TODO: wire up your AuthServices.signInUser(...)
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _isLoading = false);
    });
  }

  void _signUpUser() async {
    setState(() => _isLoading = true);
    await authServices.singUpUser(
      context: context,
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 36),
                  _buildLogo(),
                  const SizedBox(height: 40),
                  _buildHeadline(),
                  const SizedBox(height: 32),
                  _buildTabSwitcher(),
                  const SizedBox(height: 24),
                  _buildSubHeadline(),
                  const SizedBox(height: 20),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 260),
                    switchInCurve: Curves.easeOut,
                    transitionBuilder: (child, anim) =>
                        FadeTransition(opacity: anim, child: child),
                    child: _auth == Auth.signin
                        ? _buildSignInForm(key: const ValueKey('si'))
                        : _buildSignUpForm(key: const ValueKey('su')),
                  ),
                  const SizedBox(height: 28),
                  _buildBottomSwitch(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ── Logo ─────────────────────────────────────────────────────────────────
  Widget _buildLogo() {
    return Column(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
            size: 22,
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'SH',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.onSurface,
                  letterSpacing: 2,
                ),
              ),
              TextSpan(
                text: '●',
                style: TextStyle(
                  fontSize: 10,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              TextSpan(
                text: 'PZI',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.onSurface,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ── Headline ──────────────────────────────────────────────────────────────
  Widget _buildHeadline() {
    final isSignIn = _auth == Auth.signin;
    return Column(
      children: [
        Text(
          isSignIn ? 'Welcome back' : 'Create account',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Theme.of(context).colorScheme.onSurface,
            height: 1.15,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          isSignIn
              ? 'Sign in to manage your cart and orders'
              : 'Join SHOPZI for a premium shopping experience',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).textTheme.bodyMedium?.color,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  // ── Pill tab switcher ─────────────────────────────────────────────────────
  Widget _buildTabSwitcher() {
    return Container(
      height: 46,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          _TabPill(
            label: 'Sign In',
            active: _auth == Auth.signin,
            onTap: () => _switchTab(Auth.signin),
          ),
          _TabPill(
            label: 'Create Account',
            active: _auth == Auth.signup,
            onTap: () => _switchTab(Auth.signup),
          ),
        ],
      ),
    );
  }

  // ── Sub-headline ──────────────────────────────────────────────────────────
  Widget _buildSubHeadline() {
    final isSignIn = _auth == Auth.signin;
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isSignIn ? 'Sign in to continue' : 'Get started for free',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            isSignIn
                ? 'Access your cart, orders, and wishlist'
                : 'Fill in your details to create your account',
            style: TextStyle(
              fontSize: 13,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
        ],
      ),
    );
  }

  // ── Sign In form ──────────────────────────────────────────────────────────
  Widget _buildSignInForm({Key? key}) {
    return Form(
      key: _signinFormKey,
      child: Column(
        key: key,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _AuthField(
            controller: emailController,
            icon: Icons.person_outline_rounded,
            placeholder: 'Username or email',
            keyboardType: TextInputType.emailAddress,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Email is required';
              return null;
            },
          ),
          const SizedBox(height: 12),
          _AuthField(
            controller: passwordController,
            icon: Icons.lock_outline_rounded,
            placeholder: 'Password',
            obscureText: _obscurePassword,
            showEyeToggle: true,
            isObscured: _obscurePassword,
            obscureToggle: () =>
                setState(() => _obscurePassword = !_obscurePassword),
            validator: (v) {
              if (v == null || v.isEmpty) return 'Password is required';
              return null;
            },
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _CTA(
            label: 'Sign In',
            loadingLabel: 'Signing in...',
            isLoading: _isLoading,
            onPressed: () {
              if (_signinFormKey.currentState!.validate()) _signInUser();
            },
          ),
        ],
      ),
    );
  }

  // ── Sign Up form ──────────────────────────────────────────────────────────
  Widget _buildSignUpForm({Key? key}) {
    return Form(
      key: _signupFormKey,
      child: Column(
        key: key,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _AuthField(
            controller: nameController,
            icon: Icons.person_outline_rounded,
            placeholder: 'Full name',
            validator: (v) {
              if (v == null || v.isEmpty) return 'Name is required';
              return null;
            },
          ),
          const SizedBox(height: 12),
          _AuthField(
            controller: emailController,
            icon: Icons.mail_outline_rounded,
            placeholder: 'Email address',
            keyboardType: TextInputType.emailAddress,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Email is required';
              if (!v.contains('@')) return 'Enter a valid email';
              return null;
            },
          ),
          const SizedBox(height: 12),
          _AuthField(
            controller: passwordController,
            icon: Icons.lock_outline_rounded,
            placeholder: 'Create a password',
            obscureText: _obscurePassword,
            showEyeToggle: true,
            isObscured: _obscurePassword,
            obscureToggle: () =>
                setState(() => _obscurePassword = !_obscurePassword),
            validator: (v) {
              if (v == null || v.length < 6) return 'Minimum 6 characters';
              return null;
            },
          ),
          const SizedBox(height: 24),
          _CTA(
            label: 'Create Account',
            loadingLabel: 'Creating...',
            isLoading: _isLoading,
            onPressed: () {
              if (_signupFormKey.currentState!.validate()) _signUpUser();
            },
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              'By continuing, you agree to our Terms & Privacy Policy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                color: Theme.of(context).textTheme.bodySmall?.color,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Bottom switch ─────────────────────────────────────────────────────────
  Widget _buildBottomSwitch() {
    final isSignIn = _auth == Auth.signin;
    return GestureDetector(
      onTap: () => _switchTab(isSignIn ? Auth.signup : Auth.signin),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
          children: [
            TextSpan(
              text: isSignIn ? 'No account yet? ' : 'Already have an account? ',
            ),
            TextSpan(
              text: isSignIn ? 'Create one' : 'Sign in',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
//  _AuthField
// ══════════════════════════════════════════════════════════════════════════════

class _AuthField extends StatelessWidget {
  const _AuthField({
    required this.controller,
    required this.icon,
    required this.placeholder,
    required this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.showEyeToggle = false,
    this.obscureToggle,
    this.isObscured,
  });

  final TextEditingController controller;
  final IconData icon;
  final String placeholder;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool showEyeToggle;
  final VoidCallback? obscureToggle;
  final bool? isObscured;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: placeholder,
        prefixIcon: Icon(icon, size: 18),
        suffixIcon: showEyeToggle
            ? GestureDetector(
                onTap: obscureToggle,
                child: Icon(
                  (isObscured ?? true)
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 18,
                ),
              )
            : null,
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
//  _TabPill
// ══════════════════════════════════════════════════════════════════════════════

class _TabPill extends StatelessWidget {
  const _TabPill({
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: double.infinity,
          decoration: BoxDecoration(
            color: active
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: active
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
//  _CTA — primary action button
// ══════════════════════════════════════════════════════════════════════════════

class _CTA extends StatelessWidget {
  const _CTA({
    required this.label,
    required this.loadingLabel,
    required this.isLoading,
    required this.onPressed,
  });

  final String label;
  final String loadingLabel;
  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2.5),
            )
          : Text(label),
    );
  }
}
