//
//  ViewController.m
//  tableviewtTest
//
//  Created by 天行者 on 2019/8/28.
//  Copyright © 2019 天行者. All rights reserved.
//

#import "NewsViewController.h"
#import "NormalTableViewCell.h"
#import "DetailViewController.h"
#import "DeleteCellView.h"
#import "listLoader.h"
#import "listModel.h"

//NormalTableViewCellDelegate
@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) listLoader *listload;
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_tableView];
      _tableView.dataSource = self;
      _tableView.delegate = self;
    self.listload = [listLoader new];
    
    __weak typeof (self) weakSelf = self;
    [self.listload loadListDataWithlistLoaderFinichBlock:^(BOOL success, NSArray<listModel *> * _Nonnull dataArray) {
        __strong typeof (weakSelf) strongSelf = weakSelf;
        
        strongSelf.dataSource = dataArray;
        [strongSelf.tableView reloadData];
    }];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataSource.count;
    

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    listModel *model = self.dataSource[indexPath.row];
    DetailViewController *contr = [[DetailViewController alloc] initWithUrlSting:model.url];
    contr.title = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    [self.navigationController pushViewController:contr animated:YES];

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[NormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
//        cell.delegate = self;
    }
        listModel *model = self.dataSource[indexPath.row];
        //方案一:重写cell.news的model的set方法进行传值
        cell.news = model;
    
         //方案二:写方法赋值调用
//      [cell layoutTableViewCellWithModel:model];
   
    return cell;
}
//- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeletButton:(UIButton *)deleteButton{
//
//    DeleteCellView *view = [[DeleteCellView alloc]initWithFrame:self.view.bounds];
//
//    CGRect point = [tableViewCell convertRect:deleteButton.frame toView:nil];
//
//    __weak typeof(self) weakSelf = self;
//    [view showBackgroundViwFromePoint:point.origin clickBlock:^{
//    __strong typeof(self) strongSelf = weakSelf;
//
//        [strongSelf.dataSourceArray removeLastObject];
//        [strongSelf.tableView deleteRowsAtIndexPaths:@[[self.tableView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationAutomatic];
//    }];
//}
- (void)dealloc{

}
@end
