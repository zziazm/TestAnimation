//
//  SecondViewController.m
//  TestAnimation
//
//  Created by zm on 2016/12/9.
//  Copyright © 2016年 zmMac. All rights reserved.
//

#import "SecondViewController.h"
#import "UIView+ZZAdd.h"
@interface SecondViewController ()<CALayerDelegate>
@property (nonatomic, strong) UIView * aView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    _aView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:_aView];
    _aView.backgroundColor = [UIColor yellowColor];
    
    CALayer * layer = [CALayer layer];
    layer.frame = CGRectMake(10, 10, 80, 80);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    [_aView.layer addSublayer:layer];
    layer.contents = (__bridge id)[UIImage imageNamed:@"snowMan"].CGImage;
//    layer.contentsGravity = kCAGravityResizeAspect;
    layer.contentsGravity = kCAGravityCenter;
    layer.contentsScale = [UIScreen mainScreen].scale;
    layer.masksToBounds = YES;
    layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    
    CALayer * bluelayer = [CALayer layer];
    bluelayer.frame = CGRectMake(100, 300, 100, 100);
    bluelayer.backgroundColor = [UIColor blueColor].CGColor;
    bluelayer.delegate = self;
    bluelayer.contentsScale = [UIScreen mainScreen].scale;
    [self.view.layer addSublayer:bluelayer];
    [bluelayer display];
    // Do any additional setup after loading the view.
}

#pragma mark -- CALayerDelegate
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
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
