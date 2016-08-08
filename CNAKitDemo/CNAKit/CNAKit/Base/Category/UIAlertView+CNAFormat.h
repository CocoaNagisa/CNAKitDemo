//
//  UIAlertView+CNAFormat.h
//  CNAKit
//
//  Created by nagisa on 16/8/8.
//  Copyright © 2016年 cocoanagisa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN
// 由ICTAlertView修改而来
@interface UIAlertView (CNAFormat)<UIAlertViewDelegate>

/**
 *  Association aBlock，调用此接口注意Retain Cycle问题
 */
- (void)handleAlertViewButton:(void (^)(UIAlertView *alertView, NSInteger buttonIndex))aBlock;

+ (void)cna_alertViewWithTitle:(nullable NSString *)title message:(nullable NSString *)message style:(UIAlertViewStyle)style onClick:(void (^)(UIAlertView *alertView, NSInteger buttonIndex))aBlock cancelButtonTitle:(nullable NSString *)cancelButtonTitle otherButtonTitles:(nullable NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

NS_ASSUME_NONNULL_END

@end