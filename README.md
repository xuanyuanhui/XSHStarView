# XSHStarView
a simple score demo.
一个简单的评分 demo, 使用的时候

导入头文件
#import "XSHStarView.h"

声明全局属性并创建控件(略)

调用代码
    self.starView.markComplete = ^(CGFloat score){
        weakSelf.starLabel.text = [NSString stringWithFormat:@"%.1f分",score];
    };
