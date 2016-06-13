//
//  XNQLaunchView.m
//  XNQLaunchView
//
//  Created by Semyon on 16/2/3.
//  Copyright © 2016年 xnq. All rights reserved.
//

#import "XNQLaunchView.h"

@implementation XNQLaunchView {
    UIImageView *_imageView;
}

- (instancetype)init {
    if (self = [super init]) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = [UIScreen mainScreen].bounds;;
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.userInteractionEnabled = YES;// **** 禁止下面的手势可以点击
    }
    return self;
}

- (void)loadLauchViewWithImage:(UIImage *)launchImage TimeDelay:(CGFloat)timeInterval {
    _imageView.image = launchImage;
    [[[UIApplication sharedApplication].delegate window].rootViewController.view addSubview:_imageView];
    [self performSelector:@selector(removeLauchView) withObject:nil afterDelay:timeInterval];
}

- (void)removeLauchView {
    CATransform3D transform = CATransform3DScale(CATransform3DIdentity, 1.5, 1.5, 1.0);
    [UIView animateWithDuration:1.0 animations:^{
        _imageView.layer.transform = transform;
        _imageView.layer.opacity = 0.0;
    } completion:^(BOOL finished) {
        [_imageView removeFromSuperview];
    }];
}

+ (void)loadLauchViewWithImage:(UIImage *)launchImage TimeDelay:(CGFloat)timeInterval {
    XNQLaunchView *launchView = [[XNQLaunchView alloc] init];
    [launchView loadLauchViewWithImage:launchImage TimeDelay:timeInterval];
}


@end
