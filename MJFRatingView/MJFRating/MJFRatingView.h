//
//  MJFRatingView.h
//  MJFRatingView
//
//  Created by 巫龙 on 17/7/26.
//  Copyright © 2017年 MJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MJFRatingViewDelegate <NSObject>

@optional
-(void) ratingChanged:(float) newRating;

@end

/**
 星星评分，支持半颗心
 */
@interface MJFRatingView : UIView

/**
 间距 默认为5 如需自定义需要在调用时设置set方法设置即可
 */
@property (nonatomic,assign) CGFloat iSpacing;


/**
 设置各个评分状态下的图标（必须设置，没有默认状态）

 @param unSelectedImage 无评分图标
 @param partlySelectedImage 半颗星图标
 @param fullSelectedImage 满星图标
 @param delegate 代理
 */
-(void) setImagesDeselected:(NSString *)unSelectedImage partlySelected:(NSString *)partlySelectedImage fullSelected:(NSString *)fullSelectedImage andDelegate:(id<MJFRatingViewDelegate>)delegate;


/**
 设置当前分数

 @param rating 分数 float类型
 */
-(void) disPlayRating:(CGFloat) rating;


/**
 获取当前分数

 @return 当前分数
 */
-(CGFloat) rating;
@end
