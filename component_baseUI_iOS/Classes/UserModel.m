//
//  UserModel.m
//  InternetHospital
//
//  Created by Alexander on 2018/8/28.
//  Copyright © 2018年 快医科技. All rights reserved.
//

#import "UserModel.h"

static UserModel *_user;

@implementation UserModel
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _user = [super allocWithZone:zone];
    });
    return _user;
}

+ (instancetype)shareModel
{
    return [self new];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        unsigned int count;
        objc_property_t *propertyArray = class_copyPropertyList([self class], &count);
        for (NSUInteger i = 0; i < count; i++)
        {
            objc_property_t property = propertyArray[i];
            NSString *key = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
        free(propertyArray);
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count;
    objc_property_t *propertyArray = class_copyPropertyList([self class], &count);
    for (NSUInteger i = 0; i < count; i++)
    {
        objc_property_t property = propertyArray[i];
        NSString *key = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
    free(propertyArray);
}

+ (void)destoryModel
{
    unsigned int count;
    objc_property_t *propertyArray = class_copyPropertyList([self class], &count);
    for (NSUInteger i = 0; i < count; i++)
    {
        objc_property_t property = propertyArray[i];
        NSString *key = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [_user setValue:@"" forKey:key];
    }
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSArray *array =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *fileName = [array.firstObject stringByAppendingPathComponent:@"archiverUserModel"];
    if ([fileManager fileExistsAtPath:fileName])
    {
        [fileManager removeItemAtPath:fileName error:nil];
    }
    free(propertyArray);
}

+ (void)saveModel
{
    UserModel *model = [UserModel shareModel];
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:model forKey:@"userModel"];
    [archiver finishEncoding];
    NSString *fileName = [DOCUMENT_PATH stringByAppendingPathComponent:@"archiverUserModel"];
    [data writeToFile:fileName atomically:YES];
}


+ (UserModel *)loadModel
{
    NSString *fileName = [DOCUMENT_PATH stringByAppendingPathComponent:@"archiverUserModel"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:fileName];
    if (data)
    {
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        UserModel *model = [unarchiver decodeObjectForKey:@"userModel"];
        [unarchiver finishDecoding];
        return model;
    }
    return nil;
}

+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{@"accessToken" : @"access_token",
             @"expiresIn" : @"expires_in",
             @"firstName":@"first_name",
             @"notBeforePolicy":@"not-before-policy",
             @"openId":@"open_id",
             @"refreshExpiresIn":@"refresh_expires_in",
             @"refreshToken":@"refresh_token",
             @"sessionState":@"session_state",
             @"tokenType":@"token_type",
             @"userId":@"user_id",
             @"userSign":@"user_sign",
             @"userName":@"username",
             @"ID":@"id"
             };
}

@end
