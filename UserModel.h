//
//  UserModel.h
//  InternetHospital
//
//  Created by Alexander on 2018/8/28.
//  Copyright © 2018年 快医科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject <NSCoding>
/*****登录信息*****/
@property (nonatomic, copy) NSString *expiresIn;
@property (nonatomic, copy) NSString *tokenType;
@property (nonatomic, copy) NSArray *roles;
@property (nonatomic, copy) NSString *notBeforePolicy;
@property (nonatomic, copy) NSString *organization_id;
@property (nonatomic, copy) NSString *refreshToken;
@property (nonatomic, copy) NSString *scope;
@property (nonatomic, copy) NSString *userSign;
@property (nonatomic, copy) NSString *sessionState;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *openId;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *refreshExpiresIn;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *accessToken;

/******个人信息*******/

@property (nonatomic, assign) BOOL sticky;

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *departmentId;

@property (nonatomic, copy) NSString *departmentCode;

@property (nonatomic, copy) NSString *sort;

@property (nonatomic, copy) NSString *positionalTitleCode;

@property (nonatomic, copy) NSString *realName;

@property (nonatomic, copy) NSString *organizationText;

@property (nonatomic, copy) NSString *positionalTitleText;

@property (nonatomic, copy) NSString *organizationCode;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *createdDate;

@property (nonatomic, copy) NSString *departmentText;

@property (nonatomic, copy) NSString *organizationId;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *longText;

@property (nonatomic, copy) NSString *positionalTitleId;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *microAppQRCode;


/**
 获取用户模型

 @return 用户模型
 */
+ (instancetype)shareModel;


/**
 销毁模型 用户退出时调用
 */
+ (void)destoryModel;


/**
 保存模型到本地 更新用户数据时调用
 */
+ (void)saveModel;


/**
 读取本地数据到模型

 @return 用户模型
 */
+ (UserModel *)loadModel;

@end
