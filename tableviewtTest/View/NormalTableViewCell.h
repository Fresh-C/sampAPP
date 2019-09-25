//
//  NormalTableViewCell.h
//  tableviewtTest
//
//  Created by 天行者 on 2019/9/5.
//  Copyright © 2019 天行者. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "listModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NormalTableViewCellDelegate <NSObject>

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeletButton:(UIButton *)deleteButton;
@end

@interface NormalTableViewCell : UITableViewCell

@property (nonatomic, weak) id<NormalTableViewCellDelegate>delegate;
@property (nonatomic, strong)listModel *news;


@end

NS_ASSUME_NONNULL_END
