//
//  HomeController.m
//  SixLink
//
//  Created by ubankers on 15/11/26.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "HomeController.h"

@interface HomeController ()<UITableViewDataSource,UITableViewDelegate>{

    JGTableView *homeTableView;
    NSMutableArray *homeData;

}
@end
@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeHomeTableView];
    [self makeHomeTableViewData];
}
-(void)makeHomeTableView{
    homeData =[NSMutableArray array];
    
    homeTableView = [[JGTableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    homeTableView.delegate = self;
    homeTableView.dataSource = self;
    homeTableView.backgroundColor=[UIColor clearColor];
    homeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [homeTableView registerNib:[UINib nibWithNibName:@"OcViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:homeTableView];
}
-(void)makeHomeTableViewData{
    
    NSString *urlStr =[NSString stringWithFormat:@"file://%@",[[NSBundle mainBundle]pathForResource:@"Home" ofType:@"geojson"]];
    
    
    [[AFHTTPRequestOperationManager manager]GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict =(NSDictionary *)responseObject;
        NSArray *arr=[dict objectForKey:@"data"];
        for(NSDictionary *subDict in arr){
            MessageModel *model =[MessageModel makeMessageDict:subDict];
            [homeData addObject:model];
        }
        [homeTableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return homeData.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 360.0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    MessageModel *model =[homeData objectAtIndex:indexPath.row];
    
    OcViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (model.imgUrl) {
        
//        cell.imgConstraint.constant = cell.oldWidthLayoutConstraint;
//        [cell layoutIfNeeded];
//        [cell.photoImageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]];
    }
    else {
        cell.imgConstraint.constant = 0.0;
        [cell layoutIfNeeded];
    }
    
        cell.photoImageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"0%ld",indexPath.row+1]];
    [cell makeCellValue:model];
    return cell;
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
