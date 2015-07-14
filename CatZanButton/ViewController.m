//
//  ViewController.m
//  CatZanButton
//
//  Created by K-cat on 15/7/13.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import "ViewController.h"
#import "CatZanButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CatZanButton *zanBtn=[[CatZanButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50) zanImage:[UIImage imageNamed:@"Zan"] unZanImage:[UIImage imageNamed:@"UnZan"]];
    [zanBtn setCenter:self.view.center];
    [self.view addSubview:zanBtn];
    
    [zanBtn setClickHandler:^(CatZanButton *zanButton) {
        if (zanButton.isZan) {
            NSLog(@"Zan!");
        }else{
            NSLog(@"Cancel zan!");
        }
    }];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
