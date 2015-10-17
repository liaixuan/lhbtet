//
//  MouseView.m
//  ResEcho
//  老鼠类
//  Created by echo53 on 15/10/10.
//  Copyright (c) 2015年 Cheng. All rights reserved.
//

#import "MouseView.h"

@implementation MouseView

//初始化这个类
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _speed = 0;
        _coodY = self.center.y;
        NSLog(@"y == %d",_coodY);
        [self addMouseIMGView];
    }
    return self;
}
//添加老鼠图片动起来
-(void)addMouseIMGView
{
    self.userInteractionEnabled = YES;//设置图片可点击
    self.animationImages = @[[UIImage imageNamed:@"Mole01"]
                             ,[UIImage imageNamed:@"Mole02"]
                             ,[UIImage imageNamed:@"Mole03"]
                             ,[UIImage imageNamed:@"Mole02"]];//设置循环的图片
    self.animationDuration = 0.4;//设置动画时间
    [self startAnimating];//设置开始动画
}
//老鼠被点击事件
- (void)beAttack{
    //被点击后运动方向变
    _speed = 1;
    [self stopAnimating];//必须把动画停了才能换背景图
    self.image = [UIImage imageNamed:@"Mole04"];//替换背景图片
}
//老鼠移动事件
- (void)move{
    self.center = CGPointMake(self.center.x, self.center.y+_speed);
    if (_coodY-self.center.y > 60){
        _speed = 1;
    }
    else if (_coodY - self.center.y < 0){
        _speed = 0;
        self.center = CGPointMake(self.center.x, _coodY);
        [self startAnimating];
    }
}
//改变运动方向
- (BOOL)comeOut{
    if (_speed!=0){
        return NO;
    }
    _speed = -1;
    return YES;
}

@end
