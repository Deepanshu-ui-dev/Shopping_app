import re

with open('lib/features/auth/screens/auth_screen.dart', 'r') as f:
    content = f.read()

# Replace colors in _AuthScreenState
content = re.sub(r'  // ── Color tokens ──────────────────────────────────────────────────────────\n(?:  static const _.*?\n)+', '', content)

content = content.replace('backgroundColor: _bg,', 'backgroundColor: Theme.of(context).scaffoldBackgroundColor,')

content = content.replace('color: _accent,', 'color: Theme.of(context).colorScheme.primary,')
content = content.replace('color: _textDark', 'color: Theme.of(context).colorScheme.onSurface')
content = content.replace('color: _textMid', 'color: Theme.of(context).textTheme.bodyMedium?.color')
content = content.replace('color: _textLight', 'color: Theme.of(context).textTheme.bodySmall?.color')
content = content.replace('color: _white', 'color: Theme.of(context).colorScheme.surface')
content = content.replace('color: _border', 'color: Theme.of(context).colorScheme.outline')

# For TabSwitcher
content = content.replace('color: active ? const Color(0xFF22C55E) : Colors.transparent,', 'color: active ? Theme.of(context).colorScheme.primary : Colors.transparent,')
content = content.replace('color: active ? Colors.white : const Color(0xFF9CA3AF),', 'color: active ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface.withOpacity(0.5),')

# Replace _AuthField
auth_field_start = content.find('class _AuthField extends StatelessWidget {')
auth_field_end = content.find('// ══════════════════════════════════════════════════════════════════════════════\n//  _TabPill')

new_auth_field = '''class _AuthField extends StatelessWidget {
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

'''
content = content[:auth_field_start] + new_auth_field + content[auth_field_end:]

# Replace _CTA with ElevatedButton
cta_start = content.find('class _CTA extends StatelessWidget {')
new_cta = '''class _CTA extends StatelessWidget {
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
              width: 20, height: 20,
              child: CircularProgressIndicator(strokeWidth: 2.5),
            )
          : Text(label),
    );
  }
}
'''
content = content[:cta_start] + new_cta

with open('lib/features/auth/screens/auth_screen.dart', 'w') as f:
    f.write(content)
