//
//  ViewController.m
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/12/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import "ViewController.h"
#import "LTCoreService.h"
#import "LTCategoryViewModel.h"
#import "DetailPhotoViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray<LTCategoryViewModel*>* dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.tableFooterView = [UIView new]; //remove separator line in empty cells
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.title = @"Categories";
    [self loadCategories];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadCategories
{
    [self.coreSerVervice.apiService loadCategories:^(NSArray *result, NSError *error) {
        if (error == nil) {
            NSMutableArray *objects = [NSMutableArray new];
            for (LTCategory *c in result) {
                LTCategoryViewModel *vm = [[LTCategoryViewModel alloc] initWithCategory:c];
                [objects addObject:vm];
            }
            self.dataSource = objects;
        }else {
            //TODO: show error
        }
    }];
}

#pragma mark -

-(void)setDataSource:(NSArray<LTCategoryViewModel *> *)dataSource
{
    _dataSource = dataSource;
    [self.tableView reloadData];
}

#pragma mark UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"categoryCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    LTCategoryViewModel *model = self.dataSource[indexPath.row];
    cell.textLabel.text = [model displayName];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LTCategoryViewModel *model = self.dataSource[indexPath.row];
    DetailPhotoViewController *detailViewController = [[DetailPhotoViewController alloc] initWithCoreService:self.coreSerVervice category:model];
    [self.navigationController pushViewController:detailViewController animated:true];
}

@end
