import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shoping_app/constants/global_variable.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const String routeName = '/auth-screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  bool _obscurePassword = true;
  bool _isLoading = false;

  final _signupFormKey = GlobalKey<ShadFormState>();
  final _signinFormKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                GlobalVariable.highlightColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ── Brand Header ──────────────────────────────
                  _buildBrandHeader(theme),
                  const SizedBox(height: 36),

                  // ── Auth Tabs Card ────────────────────────────
                  _buildAuthTabs(theme),

                  const SizedBox(height: 28),

                  // ── Social Login ──────────────────────────────
                  _buildSocialLogin(theme),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════
  //  Brand Header
  // ═══════════════════════════════════════════════════════════════
  Widget _buildBrandHeader(ShadThemeData theme) {
    return Column(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            gradient: GlobalVariable.brandGradient,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.primary.withValues(alpha: 0.15),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Icon(
            LucideIcons.shoppingBag,
            color: theme.colorScheme.primaryForeground,
            size: 32,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'SHOPZI',
          style: theme.textTheme.h1.copyWith(
            letterSpacing: 4,
            fontSize: 32,
            color: theme.colorScheme.foreground,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Premium Shopping Experience',
          style: theme.textTheme.muted.copyWith(
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  // ═══════════════════════════════════════════════════════════════
  //  Auth Tabs with ShadTabs + ShadCard
  // ═══════════════════════════════════════════════════════════════
  Widget _buildAuthTabs(ShadThemeData theme) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 420),
      child: ShadTabs<String>(
        value: _auth == Auth.signup ? 'signup' : 'signin',
        onChanged: (value) {
          setState(() {
            _auth = value == 'signup' ? Auth.signup : Auth.signin;
          });
        },
        tabs: [
          // ── Sign Up Tab ──
          ShadTab(
            value: 'signup',
            content: ShadCard(
              backgroundColor: theme.colorScheme.card,
              title: Text('Create Account', style: theme.textTheme.h4),
              description: const Text(
                'Enter your details to get started with SHOPZI.',
              ),
              footer: ShadButton(
                width: double.infinity,
                enabled: !_isLoading,
                onPressed: () {
                  if (_signupFormKey.currentState!.saveAndValidate()) {
                    setState(() => _isLoading = true);
                    // TODO: signup logic
                  }
                },
                leading: _isLoading
                    ? SizedBox.square(
                        dimension: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: theme.colorScheme.primaryForeground,
                        ),
                      )
                    : null,
                child: Text(_isLoading ? 'Creating...' : 'Create Account'),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ShadForm(
                  key: _signupFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ShadInputFormField(
                        id: 'name',
                        label: const Text('Full Name'),
                        placeholder: const Text('Enter your full name'),
                        leading: const Icon(LucideIcons.user, size: 16),
                        validator: (v) {
                          if (v.isEmpty) return 'Name is required';
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      ShadInputFormField(
                        id: 'email',
                        label: const Text('Email'),
                        placeholder: const Text('you@example.com'),
                        keyboardType: TextInputType.emailAddress,
                        leading: const Icon(LucideIcons.mail, size: 16),
                        validator: (v) {
                          if (v.isEmpty) return 'Email is required';
                          if (!v.contains('@')) return 'Enter a valid email';
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      ShadInputFormField(
                        id: 'password',
                        label: const Text('Password'),
                        placeholder: const Text('Create a password'),
                        obscureText: _obscurePassword,
                        leading: const Icon(LucideIcons.lock, size: 16),
                        trailing: SizedBox.square(
                          dimension: 24,
                          child: ShadIconButton(
                            iconSize: 16,
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              _obscurePassword
                                  ? LucideIcons.eyeOff
                                  : LucideIcons.eye,
                            ),
                            onPressed: () {
                              setState(
                                () => _obscurePassword = !_obscurePassword,
                              );
                            },
                          ),
                        ),
                        validator: (v) {
                          if (v.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            child: const Text('Sign Up'),
          ),

          // ── Sign In Tab ──
          ShadTab(
            value: 'signin',
            content: ShadCard(
              backgroundColor: theme.colorScheme.card,
              title: Text('Welcome Back', style: theme.textTheme.h4),
              description: const Text(
                'Sign in to your SHOPZI account.',
              ),
              footer: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ShadButton(
                    width: double.infinity,
                    enabled: !_isLoading,
                    onPressed: () {
                      if (_signinFormKey.currentState!.saveAndValidate()) {
                        setState(() => _isLoading = true);
                        // TODO: signin logic
                      }
                    },
                    leading: _isLoading
                        ? SizedBox.square(
                            dimension: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: theme.colorScheme.primaryForeground,
                            ),
                          )
                        : null,
                    child: Text(_isLoading ? 'Signing in...' : 'Sign In'),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: ShadButton.link(
                      onPressed: () {
                        // TODO: forgot password
                      },
                      child: const Text('Forgot your password?'),
                    ),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ShadForm(
                  key: _signinFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ShadInputFormField(
                        id: 'email',
                        label: const Text('Email'),
                        placeholder: const Text('you@example.com'),
                        keyboardType: TextInputType.emailAddress,
                        leading: const Icon(LucideIcons.mail, size: 16),
                        validator: (v) {
                          if (v.isEmpty) return 'Email is required';
                          if (!v.contains('@')) return 'Enter a valid email';
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      ShadInputFormField(
                        id: 'password',
                        label: const Text('Password'),
                        placeholder: const Text('Enter your password'),
                        obscureText: _obscurePassword,
                        leading: const Icon(LucideIcons.lock, size: 16),
                        trailing: SizedBox.square(
                          dimension: 24,
                          child: ShadIconButton(
                            iconSize: 16,
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              _obscurePassword
                                  ? LucideIcons.eyeOff
                                  : LucideIcons.eye,
                            ),
                            onPressed: () {
                              setState(
                                () => _obscurePassword = !_obscurePassword,
                              );
                            },
                          ),
                        ),
                        validator: (v) {
                          if (v.isEmpty) return 'Password is required';
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════
  //  Social Login
  // ═══════════════════════════════════════════════════════════════
  Widget _buildSocialLogin(ShadThemeData theme) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 420),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Divider(color: theme.colorScheme.border)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  'or continue with',
                  style: theme.textTheme.muted,
                ),
              ),
              Expanded(child: Divider(color: theme.colorScheme.border)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShadButton.outline(
                onPressed: () {
                  // TODO: Google sign in
                },
                leading: const Icon(LucideIcons.globe, size: 18),
                child: const Text('Google'),
              ),
              const SizedBox(width: 12),
              ShadButton.outline(
                onPressed: () {
                  // TODO: Apple sign in
                },
                leading: const Icon(LucideIcons.apple, size: 18),
                child: const Text('Apple'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}