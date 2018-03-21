//
//  XSHStarView.m
//  XSHStarView
//
//  Created by 轩辕辉 on 2018/3/21.
//  Copyright © 2018年 轩辕辉. All rights reserved.
//

#import "XSHStarView.h"

static CGFloat kStarWidth = 0.0;

@implementation XSHStarView
#pragma mark 懒加载
- (NSUInteger)starCount{
    if (!_starCount) {
        _starCount = 5;
    }
    return _starCount;
}
- (CGFloat)totalScore{
    if (!_totalScore) {
        _totalScore = 10;
    }
    return _totalScore;
}
- (UIImage *)scoreImage{
    if(!_scoreImage){
        _scoreImage = [UIImage imageNamed:@"star"];
    }
    return _scoreImage;
}
- (UIColor *)scoreBeforeColor{
    if(!_scoreBeforeColor){
        _scoreBeforeColor = [UIColor lightGrayColor];
    }
    return _scoreBeforeColor;
}
- (UIColor *)scoreAfterColor{
    if(!_scoreAfterColor){
        _scoreAfterColor = [UIColor orangeColor];
    }
    return _scoreAfterColor;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    self.backgroundColor = [UIColor clearColor];
    kStarWidth = rect.size.width / self.starCount;
    for (int i = 0; i < self.starCount; i++) {
        CGRect starRect = CGRectMake(i * kStarWidth, 0, kStarWidth, rect.size.height);
        [self.scoreImage drawInRect:starRect];
    }
    [self.scoreBeforeColor set];
    UIRectFillUsingBlendMode(rect, kCGBlendModeSourceIn);
    
    CGRect newRect = CGRectZero;
    if (self.markType == StarScoreTypeInteger) {
        newRect = CGRectMake(0, 0, self.currentIndex * kStarWidth, rect.size.height);
    } else {
        newRect = CGRectMake(0, 0, self.currentPercent * rect.size.width, rect.size.height);
    }
    [self.scoreAfterColor set];
    UIRectFillUsingBlendMode(newRect, kCGBlendModeSourceIn);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGFloat xPoint = [[touches anyObject] locationInView:self].x;
    if(xPoint < 0 || xPoint > self.frame.size.width){return;}
    if (self.markType == StarScoreTypeInteger) {
        self.currentIndex = ceilf(xPoint / kStarWidth);
        self.markComplete(self.currentIndex * self.totalScore / self.starCount);
    } else {
        self.currentPercent = xPoint / self.bounds.size.width;
        self.markComplete(self.currentPercent * self.totalScore);
    }
    [self setNeedsDisplay];
}
@end

