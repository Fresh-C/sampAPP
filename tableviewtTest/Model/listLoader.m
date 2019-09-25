//
//  listLoader.m
//  tableviewtTest
//
//  Created by 天行者 on 2019/9/19.
//  Copyright © 2019 天行者. All rights reserved.
//

#import "listLoader.h"
#import "listModel.h"
#import <AFNetworking.h>
#import <YYModel.h>


@interface listLoader ()

@property (nonatomic, strong) NSArray *dataSource;


@end
@implementation listLoader

- (void)loadListData {
    
    NSArray <listModel *> *listData = [self readDataFromlocal];

    if (listData) {

        self.dataSource = listData;

        NSLog(@"");
    }else{

    NSString *urlStr = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
//
//    [[AFHTTPSessionManager manager] GET:urlStr parameters:nil progress:^(NSProgress *_Nonnull downloadProgress) {
//    } success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
//        NSLog(@"请求成功");
//    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
//        NSLog(@"请求失败");
//    }];

    NSURLRequest *listrequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];

    __weak typeof(self) weakSelf = self;
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:listrequest completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        NSError *jsonError;
        NSDictionary *jsonObjc = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if ([jsonObjc[@"resultcode"] isEqual:@"112"]) {
            NSLog(@"超过后台限制的请求次数,啥也不会给你显示");
        } else {
            NSArray *dataArray = jsonObjc[@"result"][@"data"];
            strongSelf.dataSource = [NSArray yy_modelArrayWithClass:[listModel class] json:dataArray];
            [strongSelf archivlistModelArray:self->_dataSource];
        }
    }];

    [dataTask resume];
    }
   
}
- (NSArray <listModel *> *)readDataFromlocal{
    //准备全路径
    NSArray *cache = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cache firstObject];
    NSString *folderPath = [cachePath stringByAppendingPathComponent:@"abc/data"];
    NSFileManager *manager = [NSFileManager defaultManager];
    NSData *redfileData = [manager contentsAtPath:folderPath];
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[listModel class], nil] fromData:redfileData error:nil];
    
    if ([unarchiveObj isKindOfClass:[NSArray class] ] && [unarchiveObj count] > 0) {
        return (NSArray <listModel *> *)unarchiveObj;
    }
    return nil;
}
- (void)archivlistModelArray:(NSArray <listModel *> *)array{
    
    //准备文件夹的全路径
    NSArray *cache = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cache firstObject];
    NSString *folderPath = [cachePath stringByAppendingPathComponent:@"abc"];
    
    //创建文件夹
    NSFileManager *manager = [NSFileManager defaultManager];
    NSError *error;
    [manager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:&error];
    
    //准备文件路径和内容的二进制
    NSString *filePath = [folderPath stringByAppendingPathComponent:@"data"];
    NSData *fileData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    
    //创建文件
    [manager createFileAtPath:filePath contents:fileData attributes:nil];
    
//    NSData *redfileData = [manager contentsAtPath:filePath];

//    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[listModel class], nil] fromData:redfileData error:nil];
    
//    NSLog(@"----------------------%@",unarchiveObj);
    

    [[NSUserDefaults standardUserDefaults] setObject:fileData forKey:@"fileData"];
    NSData *testFileData = [[NSUserDefaults standardUserDefaults] dataForKey:@"fileData"];
    
     id unarchiveObj =  [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[listModel class], nil] fromData:testFileData error:nil];
    
    NSLog(@"%@",unarchiveObj);
    
}
@end
