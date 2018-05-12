//
//  ViewController.m
//  Block
//
//  Created by HanYong on 2018/5/10.
//  Copyright © 2018年 HanYong. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"

@interface ViewController ()

@property (nonatomic, copy) NSString *test;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) TwoViewController *tvc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height/4 - 15, self.view.frame.size.width - 10, 30)];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.titleLabel];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(10, 90, 200, 30);
    [btn setTitle:@"go" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(blockUse:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _tvc = [TwoViewController new];
}


-(void)blockUse:(UIButton *)sender{
    
    _tvc.showStr = self.test;
    
    __strong typeof(self) strongSelf = self;
    
    _tvc.touchBlock = ^(NSString *str) {
        
        strongSelf.test = str;
        strongSelf.titleLabel.text = str;
        NSLog(@"%@",strongSelf.test);
    };
    
    
    _tvc.touchBlockBack = ^NSString *(NSString *str) {

        return @"111";
    };
    
    [self.navigationController pushViewController:_tvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
