//
//  DeleteCellView.m
//  tableviewtTest
//
//  Created by 天行者 on 2019/9/10.
//  Copyright © 2019 天行者. All rights reserved.
//

#import "DeleteCellView.h"

@interface DeleteCellView ()

@property (nonatomic, strong) UIView *backGroundView;
@property (nonatomic, strong) UIButton *deleteButton;
@property (nonatomic, copy) dispatch_block_t deleteBlock;

@end
@implementation DeleteCellView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self addSubview:({
            self.backGroundView = [[UIView alloc] initWithFrame:self.bounds];
            [self.backGroundView addGestureRecognizer:({
                
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissBackgroundView)];
                
                tap;
            })];
            self.backGroundView.backgroundColor = [UIColor blackColor];
            self.backGroundView.alpha = 0.5;
            self.backGroundView;
        })];
        
        [self addSubview:({
            self.deleteButton = [UIButton new];
            [self.deleteButton addTarget:self action:@selector(_clickDeletButton) forControlEvents:UIControlEventTouchUpInside];
            self.deleteButton.backgroundColor = [UIColor blueColor];
            self.deleteButton;
        })];
    
    }
    
    return self;
}
- (void)showBackgroundViwFromePoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock{
   
    self.deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    _deleteBlock = [clickBlock copy];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:1.0f delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200 )/2, (self.bounds.size.height - 200 )/2, 200, 200);
    } completion:^(BOOL finished) {
         NSLog(@"风骚走位");
    }];
}
- (void)dismissBackgroundView{
    [self removeFromSuperview];
}
- (void)_clickDeletButton{
    
    if (_deleteBlock){
        _deleteBlock();
    }
    [self removeFromSuperview];
}

@end
