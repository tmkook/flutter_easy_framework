writing...

## Features

writing...

## Getting started

to project root path run
```
mkdir packages
cd pakcages
git clone https://github.com/tmkook/flutter_easy_framework.git
```

add pubspec.yaml
```
dependencies:
  flutter_easy_framework:
    path: packages/flutter_easy_framework

flutter:
  assets
    lib/apps/assets/
```

run commands
```
flutter pub get
flutter pub run flutter_easy_framework
```
## File structure
```
 - lib/main.dart
 - lib/apps your Application code
   - lib/apps/assets Static files
   - lib/apps/logics Controllers
   - lib/apps/states Models
   - lib/apps/views Pages
   - lib/apps/bootstrap.dart Execute before running
   - lib/apps/routes.dart Pages routes
```

## Additional information

writing...