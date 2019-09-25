//
//  listModel.h
//  tableviewtTest
//
//  Created by 天行者 on 2019/9/20.
//  Copyright © 2019 天行者. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface listModel : NSObject <NSSecureCoding>

@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *thumbnail_pic_s;
@property (nonatomic, copy) NSString *uniqueKey;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *author_name;
@property (nonatomic, copy) NSString *url;

//- (void)configWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
