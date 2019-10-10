//
//  NormalTableViewCell.m
//  tableviewtTest
//
//  Created by 天行者 on 2019/9/5.
//  Copyright © 2019 天行者. All rights reserved.
//

#import "NormalTableViewCell.h"
#import "listModel.h"

@interface NormalTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *sourceLabel;
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIImageView *rightImageView;
@property (nonatomic, strong) UIButton *deleteButton;
@end

@implementation NormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        [self setupUI];
    }

    return self;
}

- (void)setupUI {
    self.titleLabel = [self creatLabelWithFont:16 textColor:[UIColor blackColor]];
    self.titleLabel.frame = CGRectMake(20, 15, 300, 50);
    self.titleLabel.numberOfLines = 2;

    self.sourceLabel = [self creatLabelWithFont:12 textColor:[UIColor grayColor]];
    self.sourceLabel.frame = CGRectMake(20, 80, 105, 20);

    self.commentLabel = [self creatLabelWithFont:12 textColor:[UIColor grayColor]];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 5, 80, 30, 20);

    self.timeLabel = [self creatLabelWithFont:12 textColor:[UIColor grayColor]];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width, 80, 100, 20);
    
    [self.contentView addSubview:({
        self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(330, 15, 70, 70)];
        self.rightImageView;
    })];

    [self addSubview:({
        self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(290, 80, 30, 20)];
        [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
        [self.deleteButton setTitle:@"Y" forState:UIControlStateHighlighted];
        self.deleteButton.backgroundColor = [UIColor blueColor];
        self.deleteButton.layer.cornerRadius = 10;
        [self.deleteButton.layer masksToBounds];

        self.deleteButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.deleteButton.layer.borderWidth = 2;

        [self.deleteButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
        self.deleteButton;
    })];
}

- (void)clickButton {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeletButton:)]) {
        [self.delegate tableViewCell:self clickDeletButton:self.deleteButton];
    }
}

- (UILabel *)creatLabelWithFont:(CGFloat)font textColor:(UIColor *)textcolor {
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = textcolor;
    [self.contentView addSubview:label];
    [label sizeToFit];
    return label;
}

- (void)setNews:(listModel *)news {
    _news = news;
    self.titleLabel.text = news.title;
    self.sourceLabel.text = news.author_name;
    self.commentLabel.text = news.category;
    self.timeLabel.text = news.date;
    self.rightImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:news.thumbnail_pic_s]]];
}

//- (void)layoutTableViewCellWithModel:(listModel *)model{
//    
//    self.titleLabel.text = model.title;
//    self.sourceLabel.text = model.author_name;
//    self.commentLabel.text = model.category;
//    self.timeLabel.text = model.date;
//    self.rightImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.thumbnail_pic_s]]];
//}
@end
