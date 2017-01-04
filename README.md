# LBPullList
Easy way to create a dropdown list.
# Usage
Here is how you can create a dropdown list:

        ///@param button    determine which button your dropdown list created on
        ///@param direction sets up your dropdown list direction
        ///@param height    sets up your dropdown list height
        ///@param titleArr  sets up your titles for list
        ///@param imageArr  sets up your images for list
        self.pullView = [LBPullView showTheListOnButton:sender Direction:Down Height:100 Titles:titleArr Images:imageArr];
        self.pullView.delegate = self;

# LBPullViewDelegate
        
        -(void)choseTheCell:(UIButton *)button
        {
            self.pullView = nil;
            ///where you can do things after click on the dropdown
            
        }
        
# Custom the dropdown list

        /********* 自定义界面 *********/
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
        @property(nonatomic,assign)CGFloat fontSize
