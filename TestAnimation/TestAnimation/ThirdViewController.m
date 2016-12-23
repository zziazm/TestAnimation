//
//  ThirdViewController.m
//  TestAnimation
//
//  Created by zm on 2016/12/15.
//  Copyright © 2016年 zmMac. All rights reserved.
//

#import "ThirdViewController.h"
#import "UIView+ZZAdd.h"
@interface ThirdViewController ()

@property (nonatomic, strong) UIImageView * clockView;
@property (nonatomic, strong) UIImageView * hourView;
@property (nonatomic, strong) UIImageView * minuteView;
@property (nonatomic, strong) UIImageView * secondView;
@property (nonatomic, strong) NSTimer * timer;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * aV = [UIView new];
    aV.top = 100;
    aV.left = 100;
    aV.width = 100;
    aV.height = 100;
    aV.backgroundColor = [UIColor redColor];
    [self.view addSubview:aV];
    
    
    UIView * view = [UIView new];
    view.top = 100;
    view.left = 100;
    view.width = 100;
    view.height = 100;
    NSLog(@"%@ %@ %@ %@", NSStringFromCGPoint(view.center), NSStringFromCGPoint(view.layer.position), NSStringFromCGPoint(view.layer.anchorPoint), NSStringFromCGRect(view.frame));
    
    view.layer.anchorPoint = CGPointMake(0.2, 0.5);
//    view.transform = CGAffineTransformRotate(view.transform, M_PI/4);
    
     NSLog(@"%@ %@ %@ %@", NSStringFromCGPoint(view.center), NSStringFromCGPoint(view.layer.position), NSStringFromCGPoint(view.layer.anchorPoint), NSStringFromCGRect(view.frame));
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.clockView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 180, 180)];
    self.clockView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    [self.view addSubview:self.clockView];
    self.clockView.image = [UIImage imageNamed:@"clock.png"];
    
    self.hourView = [[UIImageView alloc] init];
    self.hourView.width = 18.5;
    self.hourView.height = 65;
    self.hourView.center = self.clockView.center;
    [self.view addSubview:self.hourView];
    self.hourView.image = [UIImage imageNamed:@"hour"];
    
    self.minuteView = [[UIImageView alloc] init];
    self.minuteView = [UIImageView new];
    self.minuteView.width = 15;
    self.minuteView.height = 73;
    self.minuteView.center = self.clockView.center;
    [self.view addSubview:self.minuteView];
    self.minuteView.image = [UIImage imageNamed:@"minute"];
    
    self.secondView = [UIImageView new];
    self.secondView.width = 7.5;
    self.secondView.height = 65;
    self.secondView.center = self.clockView.center;
    [self.view addSubview:self.secondView];
    self.secondView.image = [UIImage imageNamed:@"second"];
    self.secondView.layer.anchorPoint = CGPointMake(0.5, 0.9);
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view.
}

- (void)tick{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSUInteger units = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents * components = [calendar components:units fromDate:[NSDate date]];
    CGFloat secsAngle = M_PI*2.0/60;//(components.second/60.0)*M_PI*2.0;
    self.secondView.transform = CGAffineTransformRotate(self.secondView.transform, secsAngle);
    NSLog(@"%@", NSStringFromCGRect(self.secondView.frame));
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
