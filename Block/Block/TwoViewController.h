//
//  TwoViewController.h
//  Block
//
//  Created by HanYong on 2018/5/11.
//  Copyright © 2018年 HanYong. All rights reserved.
//

#import <UIKit/UIKit.h>

//逆向传值
//无返回传参
typedef void (^TouchBlock)(NSString *str);

//有返回传参
typedef  NSString *(^TouchBlockBack)(NSString *str);

@interface TwoViewController : UIViewController

@property (nonatomic, copy) TouchBlock touchBlock;
@property (nonatomic, copy) TouchBlockBack touchBlockBack;

@property (nonatomic, copy) NSString *showStr;

@end
