//
//  LBPullView.h
//  LBPullList
//
//  Created by BO'S MINI on 17/1/3.
//  Copyright © 2017年 whatTheGhost. All rights reserved.
//

#import <UIKit/UIKit.h>

///视图方向
typedef NS_ENUM(NSInteger,Direction)
{
    Up    = 0,
    Down  = 1,
    Left  = 2,
    Right = 3
};

@protocol LBPullViewDelegate <NSObject>

///选中某个Cell
-(void)choseTheCell:(UIButton *)button;

@end

@interface LBPullView : UIView

///代理
@property(nonatomic,weak)id<LBPullViewDelegate> delegate;

/********* 自定义界面 *********/
///视图方向
@property(nonatomic,assign)Direction direction;
///阴影宽
@property(nonatomic,assign)CGFloat shadowWidth;
///背景颜色
@property(nonatomic,strong)UIColor *backColor;
///文字颜色
@property(nonatomic,strong)UIColor *textColor;
///分割风格
@property(nonatomic,assign)UITableViewCellSeparatorStyle separatorStyle;
///分割颜色
@property(nonatomic,strong)UIColor *separatorColor;
///选中颜色
@property(nonatomic,strong)UIColor *selectedColor;
///动画时间
@property(nonatomic,assign)NSTimeInterval animationDuration;
///弹簧
@property(nonatomic,assign)BOOL bounce;
///滚动条
@property(nonatomic,assign)BOOL showIndicator;
///行高
@property(nonatomic,assign)CGFloat rowHeight;
///字体大小
@property(nonatomic,assign)CGFloat fontSize;

/********* 方法 *********/
+(instancetype)showTheListOnButton:(UIButton *)button Direction:(Direction)direction Height:(CGFloat)height Titles:(NSArray *)titles Images:(NSArray *)images;

-(void)hideTheListViewOnButton:(UIButton *)button;

@end
