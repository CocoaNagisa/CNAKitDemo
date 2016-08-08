//
//  UIAlertView+CNAFormat.m
//  CNAKit
//
//  Created by nagisa on 16/8/8.
//  Copyright © 2016年 cocoanagisa. All rights reserved.
//

#import "UIAlertView+CNAFormat.h"

static void *ICTAlertViewKey = "ICTAlertViewKey";

@implementation UIAlertView (CNAFormat)

- (void)handleAlertViewButton:(void (^)(UIAlertView *alertView, NSInteger buttonIndex))aBlock
{
    self.delegate = self;
    objc_setAssociatedObject(self, ICTAlertViewKey, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (void)cna_alertViewWithTitle:(nullable NSString *)title message:(nullable NSString *)message style:(UIAlertViewStyle)style onClick:(void (^)(UIAlertView *alertView, NSInteger buttonIndex))aBlock cancelButtonTitle:(nullable NSString *)cancelButtonTitle otherButtonTitles:(nullable NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    alert.alertViewStyle = style;
    va_list arguments;
    va_start(arguments, otherButtonTitles);
    NSString *tempTitles;
    if (otherButtonTitles) {
        [alert addButtonWithTitle:otherButtonTitles];
        while (tempTitles = va_arg(arguments, NSString *)) {
            NSLog(@"UIAlert(CNAFormat):%@", tempTitles);
            [alert addButtonWithTitle:tempTitles];
        }
    }
    [alert handleAlertViewButton:aBlock];
    [alert show];
}

#pragma mark UIAlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    void (^block)(UIAlertView *alertView, NSInteger buttonIndex) = objc_getAssociatedObject(self, ICTAlertViewKey);
    if (block)
        block(alertView, buttonIndex);
}

@end