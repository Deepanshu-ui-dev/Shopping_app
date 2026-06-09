import re

with open('lib/features/auth/screens/auth_screen.dart', 'r') as f:
    content = f.read()

# Fix const TextSpan with Theme.of
content = content.replace('const TextSpan(', 'TextSpan(')
content = content.replace('const TextStyle(', 'TextStyle(')

# Fix other consts
content = content.replace('const TextStyle(fontSize: 10, color: _accent)', 'TextStyle(fontSize: 10, color: Theme.of(context).colorScheme.primary)')
content = content.replace('color: _accent,', 'color: Theme.of(context).colorScheme.primary,')
content = content.replace('color: _accent', 'color: Theme.of(context).colorScheme.primary')

# Replace text: const TextSpan( to text: TextSpan(
content = content.replace('text: const TextSpan(', 'text: TextSpan(')

# The following issues exist because of missing const keyword removal
# e.g., Text(isSignIn ? 'Welcome back' : 'Create account', textAlign: TextAlign.center, style: const TextStyle(...)) -> style: TextStyle(...)

# Fix withOpacity deprecation
content = content.replace('withOpacity', 'withValues(alpha: ')
# We would need to add ) for withValues(alpha: x) but withOpacity(0.5) is simply replaced with withValues(alpha: 0.5)
content = content.replace('withValues(alpha: (0.5))', 'withValues(alpha: 0.5)')
content = content.replace('.withOpacity(0.5)', '.withValues(alpha: 0.5)')

with open('lib/features/auth/screens/auth_screen.dart', 'w') as f:
    f.write(content)
