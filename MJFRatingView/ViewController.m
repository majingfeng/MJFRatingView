//
//  ViewController.m
//  MJFRatingView
//
//  Created by 巫龙 on 17/7/26.
//  Copyright © 2017年 MJF. All rights reserved.
//

#import "ViewController.h"
#import "MJFRatingView.h"

@interface ViewController ()<MJFRatingViewDelegate>
@property (nonatomic,strong) MJFRatingView *ratingView;

@end

@implementation ViewController

-(MJFRatingView *)ratingView{
    if(_ratingView == nil){
        _ratingView = [[MJFRatingView alloc] initWithFrame:CGRectMake(10, 100, 100, 50)];
        [_ratingView setImagesDeselected:@"星星1.png" partlySelected:@"星星1.png" fullSelected:@"星星2.png" andDelegate:self];
    }
    return _ratingView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.ratingView];
    [self.ratingView disPlayRating:2.0];//设置默认分数
//    self.ratingView.userInteractionEnabled = NO; 加上这句则表示只能显示分数，不能进行滑动打分
    
}

-(void) ratingChanged:(float)newRating{
    NSLog(@"____分数:%.f",newRating);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
