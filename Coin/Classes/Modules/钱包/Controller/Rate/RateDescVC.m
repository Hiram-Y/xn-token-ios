//
//  RateDescVC.m
//  Coin
//
//  Created by 蔡卓越 on 2017/11/18.
//  Copyright © 2017年  tianlei. All rights reserved.
//

#import "RateDescVC.h"

#import "RateDescTableView.h"

#import "HistoryRateVC.h"
#import "NSString+Date.h"
#import "AppConfig.h"
@interface RateDescVC ()<RefreshDelegate>

@property (nonatomic, strong) RateDescTableView *tableView;

@property (nonatomic, strong) NSMutableArray <RateModel *>*rates;

@end

@implementation RateDescVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = [LangSwitcher switchLang:@"系统公告" key:nil] ;
    
    [self initTableView];
    //获取汇率列表
    [self requestRateList];
    
}

#pragma mark - Init
- (void)initTableView {
    
    self.tableView = [[RateDescTableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kSuperViewHeight)];
    
    self.tableView.refreshDelegate = self;
    self.tableView.backgroundColor = kBackgroundColor;
    
    [self.view addSubview:self.tableView];
    
}
- (void)loadNotiction
{
    TLPageDataHelper *http = [TLPageDataHelper new];
    http.code = @"804040";
    ;
    http.isList = YES;
    
    
    
    
}
#pragma mark - Data
- (void)requestRateList {
    
//    CoinWeakSelf;
//    RateModel *model = [RateModel new];
//    model.title = @"THA钱包上线";
//    model.time = @"2018/06/07/21/04";
//    model.soure = @"THA官方";
//    model.imageName = @"如何充值";
//
//    RateModel *model1 = [RateModel new];
//    model1.title = @"区块链区块链区块链区块链区块链区块链区块链区块链区块链区块链区块链区块链区块链";
//    model1.time = @"2018/06/07/20/04";
//    model1.soure = @"THA";
//    model1.imageName = @"如何注册";
//
//    self.rates = [NSMutableArray array];
//    [self.rates addObject:model];
//    [self.rates addObject:model1];
//    self.tableView.rates = self.rates;
//    [self.tableView reloadData_tl];
//
//
//    return;
    CoinWeakSelf;
    TLPageDataHelper *help = [[TLPageDataHelper alloc] init];
//    help.isList = YES;
    
//    help.parameters[@"channelType"] = @4;
    help.parameters[@"channelType"] = @4;
    help.parameters[@"toSystemCode"] = [AppConfig config].systemCode;
    help.parameters[@"fromSystemCode"] = [AppConfig config].systemCode;

    help.parameters[@"start"] = @"1";
    help.parameters[@"start"] = @"1";

    help.parameters[@"limit"] = @"10";
    help.code = @"804040";
//    helper.parameters[@"coin"] = self.coinName;
    
    help.tableView = self.tableView;
    [help modelClass:[RateModel class]];
    
    [self.tableView addRefreshAction:^{
        
        [help refresh:^(NSMutableArray *objs, BOOL stillHave) {
            
            weakSelf.rates = objs;
            
            weakSelf.tableView.rates = objs;
            
            [weakSelf.tableView reloadData_tl];
            
        } failure:^(NSError *error) {
            
            
        }];
    }];
    
    [self.tableView beginRefreshing];

}

#pragma mark - RefreshDelegate

- (void)refreshTableView:(TLTableView *)refreshTableview didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    RateModel *rate = self.rates[indexPath.row];
//
//    HistoryRateVC *rateVC = [HistoryRateVC new];
//
//    rateVC.currency = rate.currency;
//
//    [self.navigationController pushViewController:rateVC animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
