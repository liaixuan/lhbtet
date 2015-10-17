//
//  MouseView.h
//  ResEcho
//  老鼠类
//  Created by echo53 on 15/10/10.
//  Copyright (c) 2015年 Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MouseView : UIImageView

@property (nonatomic,assign) NSInteger coodY;
@property (nonatomic,assign) float speed;//运动速度,可证可负
- (void)move;
- (BOOL)comeOut;
- (void)beAttack;

@end
