//
//  CTNBaseTabBarController.m
//  tableviewtTest
//
//  Created by 天行者 on 2019/9/4.
//  Copyright © 2019 天行者. All rights reserved.
//

#import "CTNBaseTabBarController.h"
#import "NewsViewController.h"
#import "VideoViewController.h"
#import "RecommendViewController.h"
@interface CTNBaseTabBarController ()

@end

@implementation CTNBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NewsViewController *newsVC = [NewsViewController new];
    newsVC.tabBarItem.title = @"新闻";
    newsVC.tabBarItem.image = [UIImage imageNamed:@"home"];
    newsVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"home_selected"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    
    VideoViewController *VideoVC = [VideoViewController new];
    VideoVC.tabBarItem.title = @"视频";
    VideoVC.tabBarItem.image = [[UIImage imageNamed:@"video"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VideoVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"video_selected"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    
    RecommendViewController *recommentVC = [RecommendViewController new];
    recommentVC.tabBarItem.title = @"推荐";
    recommentVC.tabBarItem.image = [[UIImage imageNamed:@"like"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    recommentVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"like_selected"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    
    [self setViewControllers:@[newsVC,VideoVC,recommentVC]];
    
}


@end
