//
//  ViewController.m
//  Dings
//
//  Created by 乔同新 on 2017/10/10.
//  Copyright © 2017年 乔同新. All rights reserved.
//

#import "ViewController.h"
#import "JSLocationConverter.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CLLocationCoordinate2D dd;
    dd.latitude = 34.766919;
    dd.longitude = 113.770681;
    
    CLLocationCoordinate2D new_dd = [JSLocationConverter gcj02ToWgs84:dd];
    NSLog(@"CLLocationCoordinate2D _ lat %@  lng %@",@(new_dd.latitude),@(new_dd.longitude));
    
    self.view.backgroundColor = [UIColor  blackColor];
    
    UIButton *exitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    exitButton.frame = CGRectMake(0, 0, 200, 40);
    exitButton.layer.cornerRadius = 20;
    exitButton.layer.masksToBounds = YES;
    exitButton.backgroundColor = [UIColor redColor];
    exitButton.center = self.view.center;
    [exitButton setTitle:@"Exit Application" forState:UIControlStateNormal];
    [exitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [exitButton addTarget:self action:@selector(exitApplication:) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:exitButton];
}

- (void)exitApplication:(UIButton *)btn{
    
    [UIView beginAnimations:@"exitApplication" context:nil];
    
    [UIView setAnimationDuration:0.5];
    
    [UIView setAnimationDelegate:self];
    
    // [UIView setAnimationTransition:UIViewAnimationCurveEaseOut forView:self.view.window cache:NO];
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    [UIView setAnimationTransition:UIViewAnimationCurveEaseOut forView:delegate.window cache:NO];
    
    [UIView setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
    
    //self.view.window.bounds = CGRectMake(0, 0, 0, 0);
    
    delegate.window.bounds = CGRectMake(0, 0, 0, 0);
    
    [UIView commitAnimations];
}

 
- (void)animationFinished:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    
    if ([animationID compare:@"exitApplication"] == 0) {
        exit(0);
    }
    
}


@end
