flutter pub run pigeon \
  --input pigeons/message.dart \
  --dart_out lib/pigeon.dart \
  --objc_header_out ios/Runner/pigeon.h \
  --objc_source_out ios/Runner/pigeon.m 

  flutter pub run pigeon \
  --input pigeons/configuration.dart \
  --dart_out lib/native/configuration.dart \
  --objc_header_out ios/Runner/configuration.h \
  --objc_source_out ios/Runner/configuration.m 