//
//  YLDButton.m
//  KYKJInternetDoctor
//
//  Created by Alexander on 2018/11/5.
//  Copyright © 2018年 快医科技. All rights reserved.
//

#import "YLDButton.h"

@implementation YLDButton
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setConfig];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setConfig];
}

- (void)setConfig
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTextSize) name:FONT_SIZE_CHANGE_NOTIFICATION_NAME object:nil];
}

- (void)changeTextSize
{
    FontSize size = (FontSize)([[[NSUserDefaults standardUserDefaults] valueForKey:FONT_SIZE_KEY] integerValue]);
    UIFont *font = self.titleLabel.font;
    self.titleLabel.font = [font fontWithSize:font.pointSize + size];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
