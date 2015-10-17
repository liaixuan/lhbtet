//
//  GameController.m
//  ResEcho
//  界面类，负责界面的显示和控制
//  Created by echo53 on 15/10/10.
//  Copyright (c) 2015年 Cheng. All rights reserved.
//

#import "GameController.h"
#import "MouseView.h"

@interface GameController(){
    NSTimer *_timer;//计时器
    NSMutableArray *mouseArray;//老鼠的数组
    UIView *_timeBar;//时间轴
}

@end

@implementation GameController

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addMouseView];
    }
    return self;
}

-(void)addMouseView{
    NSArray *heightArray = @[@"320",@"174",@"167",@"143"];//高度数组
    NSArray *coodYArray = @[@"0",@"273",@"399",@"524"];//y轴数组
    
    NSMutableArray *backgroundArr = [[NSMutableArray alloc] init];
    mouseArray = [[NSMutableArray alloc] init];//添加老鼠类的数组
    
    for (int i=0;i<4;i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, [coodYArray[i] intValue], self.bounds.size.width, [heightArray[i] intValue])];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"GameBG0%d",i+1]];
        [self addSubview:imageView];
        [backgroundArr addObject:imageView];
    }
    
    for (int i=0;i<9;i++){
        MouseView *mouse = [[MouseView alloc] initWithFrame:CGRectMake(40+120*(i%3), 300+120*(i/3), 56, 79)];
        [mouseArray addObject:mouse];
        [self insertSubview:mouse aboveSubview:backgroundArr[i/3]];
  //      [self addSubview:mouse];
        //给每只老鼠添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickMouse:)];
        [mouse addGestureRecognizer:tap];
    }
    
    //给时间进度条添加背景
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(90, 606, 254, 22)];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self insertSubview:whiteView belowSubview:backgroundArr[3]];
//    [self addSubview:whiteView];
    //时间进度条
    _timeBar = [[UIView alloc] initWithFrame:CGRectMake(95, 606, 200, 20)];
    _timeBar.backgroundColor = [UIColor blueColor];
    [self insertSubview:_timeBar aboveSubview:whiteView];
//    [self addSubview:_timeBar];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(refreshView) userInfo:nil repeats:YES];
}

//实现手势
- (void)clickMouse:(UITapGestureRecognizer *)tap
{
    //面向对象
    MouseView *mouse = (MouseView*)tap.view;
    [mouse beAttack];
}

//刷新时间条
static int count = 0;
- (void)refreshView
{
    count++;
    _timeBar.frame = CGRectMake(_timeBar.frame.origin.x, _timeBar.frame.origin.y,_timeBar.frame.size.width - 200.0/1200.0, _timeBar.frame.size.height);
    
    //老鼠运动
    for (MouseView *mouse in mouseArray){
        [mouse move];
    }
    if (count%15 == 0){
        [self mouseComeOut];
    }
}

//设置随机数,让老鼠无规律出现
- (void)mouseComeOut{
    int index = arc4random()%9;
    MouseView *mouse =mouseArray[index];
    //如果没有出现,则出现
    if (![mouse comeOut]){
        [self mouseComeOut];
    }
}

@end
