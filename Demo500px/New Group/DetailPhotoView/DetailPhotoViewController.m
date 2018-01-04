//
//  DetailPhotoViewController.m
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/17/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import "DetailPhotoViewController.h"
#import "LTCategoryViewModel.h"
#import "LT500pxAPIService.h"
#import "LTCoreService.h"
#import "LTPagePhotos.h"
#import "LTPhoto.h"
#import "LTCategoryPhotosViewModel.h"
#import "DetailPhotoCollectionViewCell.h"
#import "DetailPhotoViewRender.h"
#import "MBProgressHUD.h"

@interface DetailPhotoViewController ()<DetailPhotoViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger totalPage;

@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, strong) DetailPhotoViewRender *render;

@property (nonatomic, assign) BOOL isLoading;

@end

@implementation DetailPhotoViewController

-(instancetype)initWithCoreService:(LTCoreService *)service category:(LTCategoryViewModel *)category
{
    if (self = [self initWithNibName:@"DetailPhotoViewController" bundle:nil]) {
        _category = category;
        self.coreSerVervice = service;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = [_category displayName];
    
    self.render = [[DetailPhotoViewRender alloc] initWithCollectionView:self.collectionView];
    self.render.delegate = self;
    __weak DetailPhotoViewController *weakSelf = self;
    self.render.refresh = ^{
        [weakSelf refreshLoadPhoto];
    };
    
    self.render.loadmore = ^{
        [weakSelf loadMore];
    };
    
    [self refreshLoadPhoto];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setDataSource:(NSArray *)dataSource
{
    _dataSource = dataSource;
    self.render.dataSource = dataSource;
}

- (void)refreshLoadPhoto {
    self.currentPage = 1;
    self.isLoading = true;
    [MBProgressHUD showHUDAddedTo:self.view animated:true];
    [self.coreSerVervice.apiService loadPhotosBy:_category.categoryId page:_currentPage completion:^(LTPagePhotos *page, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:true];
        }); 
        
        if (error == nil) {
            self.totalPage = page.totalPage;
            NSMutableArray *data = [NSMutableArray new];
            for (LTPhoto *p in page.photos) {
                LTCategoryPhotosViewModel *vm = [[LTCategoryPhotosViewModel alloc] initWithPhoto:p];
                [data addObject:vm];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.dataSource = data;
                self.isLoading = false;
            });
        }else {
            self.isLoading = false;
        }
    }];
}

-(BOOL)loadMore {
    if (_currentPage == _totalPage) {
        //already loaded all pages
        self.isLoading = false;
        return false;
    }
    
    if (!self.isLoading) {
        self.isLoading = true;
        _currentPage += 1;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            [self.coreSerVervice.apiService loadPhotosBy:_category.categoryId page:_currentPage completion:^(LTPagePhotos *page, NSError *error) {
                if (error == nil) {
                    self.totalPage = page.totalPage;
                    NSMutableArray *data = [NSMutableArray new];
                    for (LTPhoto *p in page.photos) {
                        LTCategoryPhotosViewModel *vm = [[LTCategoryPhotosViewModel alloc] initWithPhoto:p];
                        [data addObject:vm];
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.dataSource = [self.dataSource arrayByAddingObjectsFromArray:data];
                        self.isLoading = false;
                    });
                }else {
                    self.isLoading = false;
                }
            }];
        });
    }
    
    // Alway return true here because we are trying to load more data
    return true;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)render:(DetailPhotoViewRender *)render didSelect:(LTCategoryPhotosViewModel *)object
{
    
}

@end
