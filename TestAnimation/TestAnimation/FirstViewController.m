//
//  FirstViewController.m
//  TestAnimation
//
//  Created by zm on 2016/12/9.
//  Copyright © 2016年 zmMac. All rights reserved.
//

#import "FirstViewController.h"
#import "UIView+ZZAdd.h"
@interface FirstViewController ()
@property (nonatomic, strong) UIButton * likeButton;
@property (nonatomic, strong) UIImageView * likeImageView;
@property (nonatomic, assign) BOOL likeAble;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    _likeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _likeButton.frame = CGRectMake(100, 100, 100, 30);
    [self.view addSubview:_likeButton];
    _likeButton.backgroundColor = [UIColor whiteColor];
    _likeImageView = [[UIImageView alloc] init];
    _likeImageView.width = 18;
    _likeImageView.height = 18;
    _likeImageView.center = CGPointMake(_likeButton.width/2, _likeButton.height/2);
    [_likeButton addSubview:_likeImageView];
    _likeImageView.image = [[UIImage imageNamed:@"icon_like_disable"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;

    [_likeButton addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    
    
    // Do any additional setup after loading the view.
}


- (void)action{
    _likeAble = !_likeAble;
    UIImage * image = [[UIImage imageNamed:_likeAble?@"icon_like":@"icon_like_disable"
                             ] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        [_likeImageView.layer setValue:@1.7 forKeyPath:@"transform.scale"];
    } completion:^(BOOL finished) {
        _likeImageView.image = image;
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            
            [_likeImageView.layer setValue:@0.9 forKeyPath:@"transform.scale"];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                
                [_likeImageView.layer setValue:@1 forKeyPath:@"transform.scale"];
            } completion:^(BOOL finished) {
                
            }];
        }];
    }];
    
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
