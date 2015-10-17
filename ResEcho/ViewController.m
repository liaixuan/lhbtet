//
//  ViewController.m
//  ResEcho
//
//  Created by echo53 on 15/10/10.
//  Copyright (c) 2015年 Cheng. All rights reserved.
//

#import "ViewController.h"
#import "GameController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"zhenshida  ");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startGameButtonClick:(id)sender {
    GameController *gameC = [[GameController alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:gameC];
}

@end
