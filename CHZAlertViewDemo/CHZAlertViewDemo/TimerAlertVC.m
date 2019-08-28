//
//  TimerAlertVC.m
//  CHZAlertViewDemo
//
//  Created by Wymann Chan on 2019/8/28.
//  Copyright © 2019 CHZ. All rights reserved.
//

#import "TimerAlertVC.h"

@interface TimerAlertVC ()

@end

@implementation TimerAlertVC

NSInteger countDownTimer = 6;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"普通弹窗";
    [self changeButtonTitle:[NSString stringWithFormat:@"弹出计时 %ld 秒弹窗", countDownTimer]];
}

-(void)startPopAlertView {
    CHZAlertSetup *setup = [[CHZAlertSetup alloc] init];
    setup.sideTap = NO; //点击旁边空白处是否关闭弹窗
    setup.alertType = AlertViewType_Normal;
    setup.animationType = ShowAnimationType_FromLeft; //从左边弹出
    setup.title = @"开始计时";
    setup.information = [NSString stringWithFormat:@"计时%ld秒，时间到自动消失弹窗", countDownTimer];
    setup.icon = [UIImage imageNamed:@"topIcon"];
    setup.countDownTimer = countDownTimer;
    CHZAlertView *alertView = [[CHZAlertView alloc] initWithAlertSetup:setup];
    [alertView showAlertView];
    __weak typeof (self) weakSelf = self;
    alertView.countdownBlock = ^(NSInteger remainingTime) {
        [weakSelf changeButtonTitle:[NSString stringWithFormat:@"剩余 %ld S", remainingTime]];
    };
    
    alertView.hideBlock = ^(NSString *inputText, NSArray<NSString *> *pickedStrings) {
        [weakSelf changeButtonTitle:[NSString stringWithFormat:@"弹出计时 %ld 秒弹窗", countDownTimer]];
    };
}

@end
