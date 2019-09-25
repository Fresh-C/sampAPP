//
//  RecommendViewController.m
//  tableviewtTest
//
//  Created by 天行者 on 2019/9/4.
//  Copyright © 2019 天行者. All rights reserved.
//

#import "RecommendViewController.h"

@interface RecommendViewController ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scroV = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scroV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    scroV.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    NSArray *arr = @[[UIColor redColor], [UIColor greenColor], [UIColor yellowColor], [UIColor blueColor], [UIColor cyanColor], [UIColor orangeColor]];
    for (int i = 0; i < 5; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width * i, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        view.backgroundColor = arr[i];

        if (i == 0) {
            [view addSubview:({
                UIView *yellowView = [[UIView alloc]initWithFrame:CGRectMake(150, 200, 100, 100)];
                yellowView.backgroundColor = [UIColor yellowColor];

                UITapGestureRecognizer *re = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickYellowView)];
                [yellowView addGestureRecognizer:re];
                re.delegate = self;
                yellowView;
            })];
        }
        [scroV addSubview:view];
    }

    scroV.pagingEnabled = YES;
    scroV.bounces = NO;
    scroV.delegate = self;
    [self.view addSubview:scroV];
}

- (void)clickYellowView {
    NSLog(@"小黄被点击了");
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"滚动了%@", @(scrollView.contentOffset.x));
}

@end
