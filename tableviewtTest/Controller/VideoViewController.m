//
//  ViewController2.m
//  tableviewtTest
//
//  Created by 天行者 on 2019/8/30.
//  Copyright © 2019 天行者. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *flow = [UICollectionViewFlowLayout new];
    flow.minimumLineSpacing = 30;
    flow.minimumInteritemSpacing = 10;
   
    UICollectionView *colle = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flow];
    
    colle.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:colle];
    colle.dataSource = self;
    colle.delegate = self;
    
    [colle registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 200;
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    
    cell.backgroundColor =[UIColor redColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.item % 3 == 0) {
        return CGSizeMake(self.view.frame.size.width, 100);

    }else{
         return CGSizeMake((self.view.frame.size.width - 20 )/ 2, 300);
    }
    
}

@end
