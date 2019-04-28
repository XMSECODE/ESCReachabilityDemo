//
//  ViewController.m
//  ESCReachabilityDemo
//
//  Created by xiang on 2019/4/26.
//  Copyright © 2019 xiang. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"

@interface ViewController ()

@property(nonatomic,strong)Reachability* reachability;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Reachability *r = [Reachability reachabilityWithHostName:@"www.apple.com"];
    switch ([r currentReachabilityStatus]) {
        case NotReachable:
            // 没有网络连接
            NSLog(@"没有网络连接");
            break;
        case ReachableViaWWAN:
            // 使用3G网络
            NSLog(@"使用3G网络");
            break;
        case ReachableViaWiFi:
            // 使用WiFi网络
            NSLog(@"使用WiFi网络");
            break;
    }
    self.reachability = r;
    [self.reachability startNotifier];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkHasChanged:) name:kReachabilityChangedNotification object:nil];
}

- (void)networkHasChanged:(NSNotification *)notification {
    NSLog(@"%@",notification);
    switch ([notification.object currentReachabilityStatus]) {
        case NotReachable:
            // 没有网络连接
            NSLog(@"没有网络连接");
            break;
        case ReachableViaWWAN:
            // 使用3G网络
            NSLog(@"使用3G网络");
            break;
        case ReachableViaWiFi:
            // 使用WiFi网络
            NSLog(@"使用WiFi网络");
            break;
    }
}


@end
