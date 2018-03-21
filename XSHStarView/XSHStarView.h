//
//  XSHStarView.h
//  XSHStarView
//
//  Created by 轩辕辉 on 2018/3/21.
//  Copyright © 2018年 轩辕辉. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, StarScoreType) {
    StarScoreTypeInteger,   //整数
    StarScoreTypeDecimal,   //小数
};

@interface XSHStarView : UIView

/** 图片数量（默认5）*/
@property (nonatomic, assign) NSUInteger starCount;
/** 总分数（默认10）*/
@property (nonatomic, assign) CGFloat totalScore;
/** 背景图片 */
@property (nonatomic, strong) UIImage *scoreImage;
/** 打分前颜色（默认lightGrayColor）*/
@property (nonatomic, strong) UIColor *scoreBeforeColor;
/** 打分后颜色（默认orangeColor） */
@property (nonatomic, strong) UIColor *scoreAfterColor;
/** 当前分数 (Integer 模式) */
@property (nonatomic, assign) NSUInteger currentIndex;
/** 当前分数 (Decimal模式) */
@property (nonatomic, assign) CGFloat currentPercent;
/** 打分类型 */
@property (nonatomic, assign) StarScoreType markType;
/** 打分结果 */
@property (nonatomic, copy) void(^markComplete)(CGFloat score);

@end
