// Autogenerated from Pigeon (v3.0.3), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "configuration.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary<NSString *, id> *wrapResult(id result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = @{
        @"code": (error.code ? error.code : [NSNull null]),
        @"message": (error.message ? error.message : [NSNull null]),
        @"details": (error.details ? error.details : [NSNull null]),
        };
  }
  return @{
      @"result": (result ? result : [NSNull null]),
      @"error": errorDict,
      };
}
static id GetNullableObject(NSDictionary* dict, id key) {
  id result = dict[key];
  return (result == [NSNull null]) ? nil : result;
}
static id GetNullableObjectAtIndex(NSArray* array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}


@interface UserModel ()
+ (UserModel *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface AppThemesResult ()
+ (AppThemesResult *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface AppVersionResult ()
+ (AppVersionResult *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface Version ()
+ (Version *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end

@implementation UserModel
+ (instancetype)makeWithUserName:(nullable NSString *)userName
    userPassword:(nullable NSString *)userPassword {
  UserModel* pigeonResult = [[UserModel alloc] init];
  pigeonResult.userName = userName;
  pigeonResult.userPassword = userPassword;
  return pigeonResult;
}
+ (UserModel *)fromMap:(NSDictionary *)dict {
  UserModel *pigeonResult = [[UserModel alloc] init];
  pigeonResult.userName = GetNullableObject(dict, @"userName");
  pigeonResult.userPassword = GetNullableObject(dict, @"userPassword");
  return pigeonResult;
}
- (NSDictionary *)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.userName ? self.userName : [NSNull null]), @"userName", (self.userPassword ? self.userPassword : [NSNull null]), @"userPassword", nil];
}
@end

@implementation AppThemesResult
+ (instancetype)makeWithErrorMessage:(nullable NSString *)errorMessage
    state:(AppThemes)state {
  AppThemesResult* pigeonResult = [[AppThemesResult alloc] init];
  pigeonResult.errorMessage = errorMessage;
  pigeonResult.state = state;
  return pigeonResult;
}
+ (AppThemesResult *)fromMap:(NSDictionary *)dict {
  AppThemesResult *pigeonResult = [[AppThemesResult alloc] init];
  pigeonResult.errorMessage = GetNullableObject(dict, @"errorMessage");
  pigeonResult.state = [GetNullableObject(dict, @"state") integerValue];
  return pigeonResult;
}
- (NSDictionary *)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.errorMessage ? self.errorMessage : [NSNull null]), @"errorMessage", @(self.state), @"state", nil];
}
@end

@implementation AppVersionResult
+ (instancetype)makeWithErrorMessage:(nullable NSString *)errorMessage
    version:(AppVersion)version {
  AppVersionResult* pigeonResult = [[AppVersionResult alloc] init];
  pigeonResult.errorMessage = errorMessage;
  pigeonResult.version = version;
  return pigeonResult;
}
+ (AppVersionResult *)fromMap:(NSDictionary *)dict {
  AppVersionResult *pigeonResult = [[AppVersionResult alloc] init];
  pigeonResult.errorMessage = GetNullableObject(dict, @"errorMessage");
  pigeonResult.version = [GetNullableObject(dict, @"version") integerValue];
  return pigeonResult;
}
- (NSDictionary *)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.errorMessage ? self.errorMessage : [NSNull null]), @"errorMessage", @(self.version), @"version", nil];
}
@end

@implementation Version
+ (instancetype)makeWithMajor:(nullable NSNumber *)major
    minor:(nullable NSNumber *)minor
    patch:(nullable NSNumber *)patch {
  Version* pigeonResult = [[Version alloc] init];
  pigeonResult.major = major;
  pigeonResult.minor = minor;
  pigeonResult.patch = patch;
  return pigeonResult;
}
+ (Version *)fromMap:(NSDictionary *)dict {
  Version *pigeonResult = [[Version alloc] init];
  pigeonResult.major = GetNullableObject(dict, @"major");
  pigeonResult.minor = GetNullableObject(dict, @"minor");
  pigeonResult.patch = GetNullableObject(dict, @"patch");
  return pigeonResult;
}
- (NSDictionary *)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.major ? self.major : [NSNull null]), @"major", (self.minor ? self.minor : [NSNull null]), @"minor", (self.patch ? self.patch : [NSNull null]), @"patch", nil];
}
@end

@interface ConfigurationApiCodecReader : FlutterStandardReader
@end
@implementation ConfigurationApiCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [AppThemesResult fromMap:[self readValue]];
    
    case 129:     
      return [AppVersionResult fromMap:[self readValue]];
    
    case 130:     
      return [UserModel fromMap:[self readValue]];
    
    case 131:     
      return [Version fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface ConfigurationApiCodecWriter : FlutterStandardWriter
@end
@implementation ConfigurationApiCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[AppThemesResult class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[AppVersionResult class]]) {
    [self writeByte:129];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[UserModel class]]) {
    [self writeByte:130];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[Version class]]) {
    [self writeByte:131];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface ConfigurationApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation ConfigurationApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[ConfigurationApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[ConfigurationApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *ConfigurationApiGetCodec() {
  static dispatch_once_t sPred = 0;
  static FlutterStandardMessageCodec *sSharedObject = nil;
  dispatch_once(&sPred, ^{
    ConfigurationApiCodecReaderWriter *readerWriter = [[ConfigurationApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}


void ConfigurationApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<ConfigurationApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.ConfigurationApi.fetchTheme"
        binaryMessenger:binaryMessenger
        codec:ConfigurationApiGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(fetchThemeWithError:)], @"ConfigurationApi api (%@) doesn't respond to @selector(fetchThemeWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        AppThemesResult *output = [api fetchThemeWithError:&error];
        callback(wrapResult(output, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.ConfigurationApi.fetchVersion"
        binaryMessenger:binaryMessenger
        codec:ConfigurationApiGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(fetchVersionWithError:)], @"ConfigurationApi api (%@) doesn't respond to @selector(fetchVersionWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        AppVersionResult *output = [api fetchVersionWithError:&error];
        callback(wrapResult(output, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.ConfigurationApi.fetchUser"
        binaryMessenger:binaryMessenger
        codec:ConfigurationApiGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(fetchUserWithError:)], @"ConfigurationApi api (%@) doesn't respond to @selector(fetchUserWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        UserModel *output = [api fetchUserWithError:&error];
        callback(wrapResult(output, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.ConfigurationApi.updateVersion"
        binaryMessenger:binaryMessenger
        codec:ConfigurationApiGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(updateVersionVersion:error:)], @"ConfigurationApi api (%@) doesn't respond to @selector(updateVersionVersion:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        Version *arg_version = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api updateVersionVersion:arg_version error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.ConfigurationApi.fetchCurrent"
        binaryMessenger:binaryMessenger
        codec:ConfigurationApiGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(fetchCurrentWithError:)], @"ConfigurationApi api (%@) doesn't respond to @selector(fetchCurrentWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        NSString *output = [api fetchCurrentWithError:&error];
        callback(wrapResult(output, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
