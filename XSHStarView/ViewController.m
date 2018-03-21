//
//  ViewController.m
//  XSHStarView
//
//  Created by 轩辕辉 on 2018/3/21.
//  Copyright © 2018年 轩辕辉. All rights reserved.
//

#import "ViewController.h"
#import "XSHStarView.h"

@interface ViewController ()

/** 评分视图 */
@property (nonatomic,strong) XSHStarView *starView;
/** 评分 */
@property (nonatomic,strong) UILabel *starLabel;

@end

@implementation ViewController
#pragma mark 懒加载
-(XSHStarView *)starView{
    if (!_starView) {
        _starView = [[XSHStarView alloc] initWithFrame:CGRectMake(50, 100, 100, 25)];
    }
    return _starView;
}
-(UILabel *)starLabel{
    if (!_starLabel) {
        _starLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 100, 50,25)];
        _starLabel.font = [UIFont systemFontOfSize:14.0];
        _starLabel.textAlignment = NSTextAlignmentCenter;
        _starLabel.textColor = [UIColor blackColor];
        _starLabel.backgroundColor = [UIColor lightGrayColor];
    }
    return _starLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    
    [self.view addSubview:self.starView];
    [self.view addSubview:self.starLabel];
    
    self.starView.markComplete = ^(CGFloat score){
        weakSelf.starLabel.text = [NSString stringWithFormat:@"%.1f分",score];
    };
    
}

@end
