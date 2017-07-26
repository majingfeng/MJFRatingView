//
//  MJFRatingView.m
//  MJFRatingView
//
//  Created by 巫龙 on 17/7/26.
//  Copyright © 2017年 MJF. All rights reserved.
//

#import "MJFRatingView.h"

#define kImageSpace 5

@interface MJFRatingView (){
    id<MJFRatingViewDelegate> mDelegate;
    UIImage *mUnselectedImage,*mPartlySelectedImage,*mFullSelectedImage;
    CGFloat mStartRating,mLastRating;
    CGFloat mHeight,mWidth;
}
@property (nonatomic,strong) UIImageView *mS1;
@property (nonatomic,strong) UIImageView *mS2;
@property (nonatomic,strong) UIImageView *mS3;
@property (nonatomic,strong) UIImageView *mS4;
@property (nonatomic,strong) UIImageView *mS5;
@end
@implementation MJFRatingView

-(void) setImagesDeselected:(NSString *)unSelectedImage partlySelected:(NSString *)partlySelectedImage fullSelected:(NSString *)fullSelectedImage andDelegate:(id<MJFRatingViewDelegate>)delegate{
    mUnselectedImage = [UIImage imageNamed:unSelectedImage];
    mPartlySelectedImage = [UIImage imageNamed:partlySelectedImage];
    mFullSelectedImage = [UIImage imageNamed:fullSelectedImage];
    mDelegate = delegate;
    mHeight = 0.f;
    mWidth = 0.f;
    if(mHeight<[mUnselectedImage size].height){
        mHeight = [mUnselectedImage size].height;
    }
    if(mWidth<[mUnselectedImage size].width){
        mWidth = [mUnselectedImage size].width;
    }
    if(_iSpacing >0){
        mWidth += _iSpacing;
    }else{
        mWidth += kImageSpace;
    }
    
    mStartRating = 0.f;
    mLastRating = 0.f;
    _mS1 = [[UIImageView alloc] initWithImage:mUnselectedImage];
    _mS2= [[UIImageView alloc] initWithImage:mUnselectedImage];
    _mS3 = [[UIImageView alloc] initWithImage:mUnselectedImage];
    _mS4 = [[UIImageView alloc] initWithImage:mUnselectedImage];
    _mS5 = [[UIImageView alloc] initWithImage:mUnselectedImage];
    
    _mS1.contentMode = UIViewContentModeLeft;
    _mS2.contentMode = UIViewContentModeLeft;
    _mS3.contentMode = UIViewContentModeLeft;
    _mS4.contentMode = UIViewContentModeLeft;
    _mS5.contentMode = UIViewContentModeLeft;
    
    [_mS1 setFrame:CGRectMake(0, (self.frame.size.height-mHeight)/2, mWidth, mHeight)];
    [_mS2 setFrame:CGRectMake(mWidth, (self.frame.size.height-mHeight)/2, mWidth, mHeight)];
    [_mS3 setFrame:CGRectMake(mWidth*2, (self.frame.size.height-mHeight)/2, mWidth, mHeight)];
    [_mS4 setFrame:CGRectMake(mWidth*3, (self.frame.size.height-mHeight)/2, mWidth, mHeight)];
    [_mS5 setFrame:CGRectMake(mWidth*4, (self.frame.size.height-mHeight)/2, mWidth, mHeight)];
    
    [_mS1 setUserInteractionEnabled:NO];
    [_mS2 setUserInteractionEnabled:NO];
    [_mS3 setUserInteractionEnabled:NO];
    [_mS4 setUserInteractionEnabled:NO];
    [_mS5 setUserInteractionEnabled:NO];
    
    [self addSubview:_mS1];
    [self addSubview:_mS2];
    [self addSubview:_mS3];
    [self addSubview:_mS4];
    [self addSubview:_mS5];
    
    CGRect frame = [self frame];
    frame.size.width = mWidth*5;
    [self setFrame:frame];
    self.backgroundColor = [UIColor clearColor];
}

-(void) disPlayRating:(CGFloat)rating{
    [_mS1 setImage:mUnselectedImage];
    [_mS2 setImage:mUnselectedImage];
    [_mS3 setImage:mUnselectedImage];
    [_mS4 setImage:mUnselectedImage];
    [_mS5 setImage:mUnselectedImage];
    
    if(rating>=0.5){
        [_mS1 setImage:mPartlySelectedImage];
    }
    if (rating >= 1) {
        [_mS1 setImage:mFullSelectedImage];
    }
    if (rating >= 1.5) {
        [_mS2 setImage:mPartlySelectedImage];
    }
    if (rating >= 2) {
        [_mS2 setImage:mFullSelectedImage];
    }
    if (rating >= 2.5) {
        [_mS3 setImage:mPartlySelectedImage];
    }
    if (rating >= 3) {
        [_mS3 setImage:mFullSelectedImage];
    }
    if (rating >= 3.5) {
        [_mS4 setImage:mPartlySelectedImage];
    }
    if (rating >= 4) {
        [_mS4 setImage:mFullSelectedImage];
    }
    if (rating >= 4.5) {
        [_mS5 setImage:mPartlySelectedImage];
    }
    if (rating >= 5) {
        [_mS5 setImage:mFullSelectedImage];
    }
    mStartRating = rating;
    mLastRating = rating;
    [mDelegate ratingChanged:rating];
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self touchesMoved:touches withEvent:event];
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint pt = [[touches anyObject] locationInView:self];
    int newRating = (int) (pt.x / mWidth)+1;
    if(newRating<1 || newRating>5){
        return;
    }
    if(newRating != mLastRating){
        [self disPlayRating:newRating];
    }
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self touchesMoved:touches withEvent:event];
}

-(CGFloat) rating{
    return mStartRating;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
