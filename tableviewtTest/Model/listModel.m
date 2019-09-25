//
//  listModel.m
//  tableviewtTest
//
//  Created by 天行者 on 2019/9/20.
//  Copyright © 2019 天行者. All rights reserved.
//

#import "listModel.h"

@implementation listModel
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.category = [aDecoder decodeObjectForKey:@"category"];
        self.thumbnail_pic_s = [aDecoder decodeObjectForKey:@"thumbnail_pic_s"];
        self.uniqueKey = [aDecoder decodeObjectForKey:@"uniqueKey"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.date = [aDecoder decodeObjectForKey:@"date"];
        self.author_name = [aDecoder decodeObjectForKey:@"author_name"];
        self.url = [aDecoder decodeObjectForKey:@"url"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.category forKey:@"category"];
    [aCoder encodeObject:self.thumbnail_pic_s forKey:@"thumbnail_pic_s"];
    [aCoder encodeObject:self.uniqueKey forKey:@"uniqueKey"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.date forKey:@"date"];
    [aCoder encodeObject:self.author_name forKey:@"author_name"];
    [aCoder encodeObject:self.url forKey:@"url"];
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

//- (void)configWithDictionary:(NSDictionary *)dictionary{
//
//    self.category = [dictionary objectForKey:@"category"];
//    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
//    self.uniqueKey = [dictionary objectForKey:@"uniqueKey"];
//    self.title = [dictionary objectForKey:@"title"];
//    self.date = [dictionary objectForKey:@"date"];
//    self.authorName = [dictionary objectForKey:@"author_name"];
//    self.articleUrl = [dictionary objectForKey:@"url"];
//
//
//
//}

@end
