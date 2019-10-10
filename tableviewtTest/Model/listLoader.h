//
//  listLoader.h
//  tableviewtTest
//
//  Created by 天行者 on 2019/9/19.
//  Copyright © 2019 天行者. All rights reserved.
//

#import <Foundation/Foundation.h>
@class listModel;

NS_ASSUME_NONNULL_BEGIN

typedef void(^listLoaderFinichBlock)(BOOL success,NSArray <listModel *> *dataArray);

@interface listLoader : NSObject
- (void)loadListDataWithlistLoaderFinichBlock:(listLoaderFinichBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
