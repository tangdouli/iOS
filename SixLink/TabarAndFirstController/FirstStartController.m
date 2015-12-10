//
//  FirstStartController.m
//  SixDegreesFinancial
//
//  Created by 萝卜 on 15/11/7.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "FirstStartController.h"

@interface FirstStartController ()<UIScrollViewDelegate>{

    NSMutableArray *imageArray;

}

@property (nonatomic) UIScrollView* scrollView;

@property (nonatomic) UIPageControl* pageCtl;

@end

@implementation FirstStartController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    CGFloat heightOfWindow = self.view.frame.size.height;
    
    NSArray *arr;
    if (heightOfWindow  == 480 ){
        //4
        arr = [[NSArray alloc]initWithObjects:@"boot_4s-1",@"boot_4s-2",@"boot_4s-3",@"boot_4s-4",@"boot_4s-5",nil];
        self.pageCtl=  [[UIPageControl alloc] initWithFrame:CGRectMake(150, self.view.frame.size.height-40, 100 , 50 )];
        self.pageCtl.center = CGPointMake(self.view.frame.size.width/2 , self.view.frame.size.height -40);
        
    }else if(heightOfWindow  == 568){
        //5 5s
        arr = [[NSArray alloc]initWithObjects:@"boot_5s-1",@"boot_5s-2",@"boot_5s-3",@"boot_5s-4",@"boot_5s-5",nil];
        self.pageCtl=  [[UIPageControl alloc] initWithFrame:CGRectMake(150, self.view.frame.size.height-40, 100 , 50 )];
        self.pageCtl.center = CGPointMake(self.view.frame.size.width/2 , self.view.frame.size.height -40);
        
    }else if(heightOfWindow == 667){
        //6
        arr = [[NSArray alloc]initWithObjects:@"boot_6-1",@"boot_6-2",@"boot_6-3",@"boot_6-4",@"boot_6-5",nil];
        self.pageCtl=  [[UIPageControl alloc] initWithFrame:CGRectMake(150, self.view.frame.size.height-50, 100 , 50 )];
        self.pageCtl.center = CGPointMake(self.view.frame.size.width/2 , self.view.frame.size.height -50);
        
    }else if(heightOfWindow == 736){//6+
        arr = [[NSArray alloc]initWithObjects:@"boot_6+1",@"boot_6+2",@"boot_6+3",@"boot_6+4",@"boot_6+5",nil];
        self.pageCtl=  [[UIPageControl alloc] initWithFrame:CGRectMake(150, self.view.frame.size.height-50, 100 , 50 )];
        self.pageCtl.center = CGPointMake(self.view.frame.size.width/2 , self.view.frame.size.height -50);
        
    }
    
    imageArray = [[NSMutableArray alloc]initWithArray:arr];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*imageArray.count, self.view.frame.size.height );
    self.scrollView.delegate =self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.clipsToBounds = YES;
    self.scrollView.bounces = NO;
    self.scrollView.directionalLockEnabled = YES;
    self.scrollView.alwaysBounceHorizontal = NO;
    self.scrollView.alwaysBounceVertical = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.backgroundColor=[UIColor redColor];
    [self.view addSubview:self.scrollView ];
    
    for (int i=0; i<imageArray.count; i++) {
        
        CGRect f = CGRectMake(i*self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
        NSString *name =imageArray[i];
        UIImageView* view =[[UIImageView alloc] initWithImage:[UIImage imageNamed:name] ];
        view.backgroundColor =[UIColor grayColor];
        if(i ==imageArray.count-1){
            UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickSelectSuCai:)];
            view.userInteractionEnabled=YES;
            [view addGestureRecognizer:tap];
            
        }
        view.frame = f;
        [self.scrollView addSubview:view];
    }
    
    
    self.pageCtl.numberOfPages = imageArray.count;
    self.pageCtl.userInteractionEnabled = NO;
    self.pageCtl.currentPage=0;
    self.pageCtl.pageIndicatorTintColor= [UIColor lightGrayColor];
    self.pageCtl.currentPageIndicatorTintColor=[UIColor orangeColor];
    self.pageCtl.backgroundColor  = [UIColor clearColor] ;
    [self.pageCtl addTarget:self action:@selector(onPageChange:) forControlEvents:UIControlEventValueChanged];
    [ self.view addSubview:self.pageCtl];

    
    // Do any additional setup after loading the view.
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    [self.pageCtl setCurrentPage:offset.x / bounds.size.width];
    [self.pageCtl updateCurrentPageDisplay];
}
- (void)onPageChange:(id)sender
{
    [self.pageCtl updateCurrentPageDisplay];
}

- (void)onClickSelectSuCai:(id)sender
{
    
    [self.view removeFromSuperview];
    
    AppDelegate* delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    
    
    RegisterController *registerVC =[[RegisterController alloc]init];
    
    UINavigationController *uv1 = [[UINavigationController alloc]initWithRootViewController:registerVC];
    
    uv1.navigationBarHidden = YES;
    
    delegate.window.tintColor = BarColor;
    
    [delegate.window setRootViewController:uv1];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
