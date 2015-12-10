//
//  ConsumerController.m
//  SixDegreesFinancial
//
//  Created by 雪松 on 15/11/7.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "ConsumerController.h"
#import "ConsumerCell.h"

#define CBgColor ([UIColor colorWithRed:0.937 green:0.941 blue:0.945 alpha:1])

static NSString *identifier = @"ConsumerCell";

@interface ConsumerController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    
    UICollectionView *_investmentCollectionView;//排版
    
}
@end

@implementation ConsumerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = CBgColor;
    
    [self addTop];
    // Do any additional setup after loading the view.
    [self addCollection];
}
CGFloat width = 0;
-(void)addCollection
{
    
    CGFloat x = 10;
    CGFloat y = NAV_BAR_HEIGHT;
    width = SCREEN_WIDTH - 2*x;
    CGFloat height = SCREEN_HEIGHT - y - TAB_BAR_HEIGHT;
    
    UICollectionViewFlowLayout *_layout = [[UICollectionViewFlowLayout alloc] init];
    [_layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _investmentCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(x, y, width, height) collectionViewLayout:_layout];
    _investmentCollectionView.showsVerticalScrollIndicator = NO;
    _investmentCollectionView.backgroundColor = CBgColor;
    _investmentCollectionView.delegate = self;
    _investmentCollectionView.dataSource = self;
    [_investmentCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ConsumerCell class]) bundle:nil] forCellWithReuseIdentifier:identifier];
    [self.view addSubview:_investmentCollectionView];
    
}
- (void)addTop
{
    UILabel *titleL = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,100,30)];
//    titleL.text = @"六度金融理财";
    [titleL setTextColor:BarTxtColor];
    titleL.font =BarTitle_Font;
    [titleL setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = titleL;

}
#pragma mark - UICollectionView代理
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(width, 190);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//        return CGSizeMake(SCREEN_WIDTH, 100);
//}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ConsumerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([ConsumerCell class]) owner:self options:nil] lastObject];
    }
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
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
