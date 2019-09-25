//
//  DeleteCellView.h
//  tableviewtTest
//
//  Created by 天行者 on 2019/9/10.
//  Copyright © 2019 天行者. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeleteCellView : UIView
- (void)showBackgroundViwFromePoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;
@end

NS_ASSUME_NONNULL_END
