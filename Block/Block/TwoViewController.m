//
//  TwoViewController.m
//  Block
//
//  Created by HanYong on 2018/5/11.
//  Copyright © 2018年 HanYong. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@property (nonatomic, strong) UITextField *textField;//输入框

@property (nonatomic, strong) UILabel *showLabel;
@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height/4 - 15, self.view.frame.size.width - 20, 50)];
    self.textField.backgroundColor = [UIColor clearColor];
    self.textField.textColor = [UIColor blackColor];
    self.textField.textAlignment = NSTextAlignmentCenter;
    self.textField.layer.borderWidth = 1.0f;
    self.textField.layer.borderColor = [UIColor grayColor].CGColor;
    [self.view addSubview:self.textField];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(10, 90, 200, 30);
    [btn setTitle:@"back" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(blockUse:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.showLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 200 + 50 + 50, self.view.frame.size.width - 20, 30)];
    self.showLabel.textColor = [UIColor redColor];
    self.showLabel.textAlignment = NSTextAlignmentLeft;
    self.showLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:self.showLabel];
    
    self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 200 + 50 + 80, self.view.frame.size.width - 20, 30)];
    self.detailLabel.textColor = [UIColor redColor];
    self.detailLabel.textAlignment = NSTextAlignmentLeft;
    self.detailLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:self.detailLabel];
}

-(void)blockUse:(UIButton *)sender{
    
    NSString *inputStr = self.textField.text;
    __weak typeof(self)weakself = self;
    
    if (weakself.touchBlock) {
        weakself.touchBlock(inputStr);
    }
    
    if (weakself.touchBlockBack) {
       weakself.detailLabel.text = weakself.touchBlockBack(inputStr);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setShowStr:(NSString *)showStr{
    _showStr = showStr;
    
    _showLabel.text = showStr;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
