//
//  LBPullView.m
//  LBPullList
//
//  Created by BO'S MINI on 17/1/3.
//  Copyright © 2017年 whatTheGhost. All rights reserved.
//

#import "LBPullView.h"


#define ReuseIdentifier @"reuseID"
#define ShadowWith pullView.shadowWidth
#define CornerRadius 5
#define ShadowRadius 3
#define ShadowOpacity 0.3

@interface LBPullView ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIButton *baseView;

@property(nonatomic,strong)NSArray *titles;

@property(nonatomic,strong)NSArray *images;

@property(nonatomic,strong)UITableView *listTableView;

@end

@implementation LBPullView

+(instancetype)showTheListOnButton:(UIButton *)button Direction:(Direction)direction Height:(CGFloat)height Titles:(NSArray *)titles Images:(NSArray *)images
{
    LBPullView *pullView = [LBPullView new];
    pullView.titles = titles;
    pullView.images = images;
    pullView.baseView = button;
    pullView.direction = direction;
    pullView.listTableView = [UITableView new];
    pullView.listTableView.dataSource = pullView;
    pullView.listTableView.delegate = pullView;
    pullView.listTableView.layer.cornerRadius = CornerRadius;
    pullView.listTableView.separatorStyle = pullView.separatorStyle;
    pullView.listTableView.separatorColor = pullView.separatorColor;
    pullView.listTableView.backgroundColor = pullView.backColor;
    pullView.listTableView.bounces = pullView.bounce;
    pullView.listTableView.showsVerticalScrollIndicator = pullView.showIndicator;
    pullView.listTableView.showsHorizontalScrollIndicator = pullView.showIndicator;
    
    CGRect baseRect = button.frame;
    
    switch (direction) {
        case Up:
            pullView.frame = CGRectMake(baseRect.origin.x, baseRect.origin.y, baseRect.size.width, 0);
            pullView.layer.shadowOffset = CGSizeMake(ShadowWith, - ShadowWith);
            break;
        case Down:
            pullView.frame = CGRectMake(baseRect.origin.x, baseRect.origin.y + baseRect.size.height, baseRect.size.width, 0);
            pullView.layer.shadowOffset = CGSizeMake(ShadowWith, ShadowWith);
            break;
        case Left:
            pullView.frame = CGRectMake(baseRect.origin.x, baseRect.origin.y, 0, baseRect.size.height);
            pullView.layer.shadowOffset = CGSizeMake(- ShadowWith, ShadowWith);
            break;
        default:
            pullView.frame = CGRectMake(baseRect.origin.x + baseRect.size.width, baseRect.origin.y, 0, baseRect.size.height);
            pullView.layer.shadowOffset = CGSizeMake(ShadowWith, ShadowWith);
            break;
    }
    
    pullView.layer.masksToBounds = NO;
    pullView.layer.cornerRadius = CornerRadius;
    pullView.layer.shadowRadius = ShadowRadius;
    pullView.layer.shadowOpacity = ShadowOpacity;
    
    [UIView animateWithDuration:pullView.animationDuration animations:^{
        
        switch (direction) {
            case Up:
                pullView.frame = CGRectMake(baseRect.origin.x, baseRect.origin.y - height, baseRect.size.width, height);
                pullView.listTableView.frame = CGRectMake(0, 0, baseRect.size.width, height);
                break;
            case Down:
                pullView.frame = CGRectMake(baseRect.origin.x, baseRect.origin.y + baseRect.size.height, baseRect.size.width, height);
                pullView.listTableView.frame = CGRectMake(0, 0, baseRect.size.width, height);
                break;
            case Left:
                pullView.frame = CGRectMake(baseRect.origin.x - height, baseRect.origin.y, height, height);
                pullView.listTableView.frame = CGRectMake(0, 0, baseRect.size.width, height);
                break;
            default:
                pullView.frame = CGRectMake(baseRect.origin.x + baseRect.size.width, baseRect.origin.y, height, height);
                pullView.listTableView.frame = CGRectMake(0, 0, baseRect.size.width, height);
                break;
        }
        
    } completion:^(BOOL finished) {
        
    }];
    
    [button.superview addSubview:pullView];
    
    [pullView addSubview:pullView.listTableView];
    
    return pullView;
}

-(void)hideTheListViewOnButton:(UIButton *)button
{
    CGRect baseRect = button.frame;
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:_animationDuration animations:^{
       
        switch (self.direction) {
            case Up:
                weakSelf.frame = CGRectMake(baseRect.origin.x, baseRect.origin.y, baseRect.size.width, 0);
                weakSelf.listTableView.frame = CGRectMake(0, 0, baseRect.size.width, 0);
                break;
            case Down:
                weakSelf.frame = CGRectMake(baseRect.origin.x, baseRect.origin.y + baseRect.size.height, baseRect.size.width, 0);
                weakSelf.listTableView.frame = CGRectMake(0, 0, baseRect.size.width, 0);
                break;
            case Left:
                weakSelf.frame = CGRectMake(baseRect.origin.x, baseRect.origin.y, 0, baseRect.size.height);
                weakSelf.listTableView.frame = CGRectMake(0, 0, baseRect.size.width, 0);
                break;
            default:
                weakSelf.frame = CGRectMake(baseRect.origin.x + baseRect.size.width, baseRect.origin.y, 0, baseRect.size.height);
                weakSelf.listTableView.frame = CGRectMake(0, 0, baseRect.size.width, 0);
                break;
        }
        
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ReuseIdentifier];
    }
    
    cell.textLabel.text = self.titles[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:self.fontSize];
    cell.imageView.image = self.images[indexPath.row];
    cell.textLabel.textColor = self.textColor;
    
    UIView * background = [[UIView alloc] init];
    background.backgroundColor = self.selectedColor;
    cell.selectedBackgroundView = background;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.rowHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.baseView setTitle:self.titles[indexPath.row] forState:UIControlStateNormal];
    [self.baseView setImage:self.images[indexPath.row] forState:UIControlStateNormal];
    
    if ([self.delegate respondsToSelector:@selector(choseTheCell:)])
    {
        [self.delegate choseTheCell:self.baseView];
    }
    
    [self hideTheListViewOnButton:self.baseView];
}

#pragma mark - setter
-(void)setBackColor:(UIColor *)backColor
{
    self.listTableView.backgroundColor = backColor;
}

-(void)setSeparatorColor:(UIColor *)separatorColor
{
    self.listTableView.separatorColor = separatorColor;
}

-(void)setSeparatorStyle:(UITableViewCellSeparatorStyle)separatorStyle
{
    self.listTableView.separatorStyle = separatorStyle;
}


#pragma mark - getter
-(CGFloat)shadowWidth
{
    if (_shadowWidth == 0)
    {
        _shadowWidth = 3;
    }
    return _shadowWidth;
}

-(NSTimeInterval)animationDuration
{
    if (_animationDuration == 0)
    {
        _animationDuration = 0.25;
    }
    return _animationDuration;
}

-(CGFloat)rowHeight
{
    if (_rowHeight == 0)
    {
        _rowHeight = 44;
    }
    return _rowHeight;
}

-(CGFloat)fontSize
{
    if (_fontSize == 0)
    {
        _fontSize = 13;
    }
    return _fontSize;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
