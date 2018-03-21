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

属性说明:
starCount : 设置评分图片(星星)的数量 (默认是5个)
totalScore : 设置分数(默认是10分)
scoreImage : 设置图片样式(默认是星星)
scoreBeforeColor : 未选中图片的颜色(默认是lightGrayColor)
scoreAfterColor : 选中图片的颜色(默认是orangeColor)
currentIndex : 当前打分(Integer模式下)
currentPercent : 当前分数(Decimal模式下)
StarScoreType markType : 打分类型(整数 or 小数,默认是整数)
void(^markComplete)(CGFloat score) : 打完后的分数, block 回调
