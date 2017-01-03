//
//  ViewController.m
//  LBPullList
//
//  Created by BO'S MINI on 17/1/3.
//  Copyright © 2017年 whatTheGhost. All rights reserved.
//


#import "LBViewController.h"
#import "LBPullView.h"

#define Image(name) [UIImage imageNamed:[NSString stringWithFormat:@"%d",name]]

@interface LBViewController ()<LBPullViewDelegate>

@property(nonatomic,strong)LBPullView *pullView;

@end

@implementation LBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clickPullList:(UIButton *)sender {
    if (self.pullView == nil){
        
        self.pullView = [LBPullView showTheListOnButton:sender Direction:arc4random_uniform(4) Height:100 Titles:@[@"第一条",@"第二条",@"第三条",@"第四条"] Images:@[Image(1),Image(2),Image(3),Image(4)]];
        self.pullView.delegate = self;
        
        self.pullView.shadowWidth = 5;
        self.pullView.backColor = [UIColor redColor];
        self.pullView.textColor = [UIColor blueColor];
        self.pullView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.pullView.separatorColor = [UIColor blueColor];
        self.pullView.selectedColor = [UIColor greenColor];
        self.pullView.animationDuration = 0.25;
        self.pullView.bounce = NO;
        self.pullView.showIndicator = NO;
        self.pullView.rowHeight = 44;
        
    }else{
        
        [self.pullView hideTheListViewOnButton:sender];
        self.pullView = nil;
        
    }
}

#pragma mark - LBPullViewDelegate
-(void)choseTheCell:(UIButton *)button
{
    self.pullView = nil;
}
@end
