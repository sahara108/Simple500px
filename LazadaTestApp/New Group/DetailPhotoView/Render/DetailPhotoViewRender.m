//
//  DetailPhotoViewRender.m
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/17/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import "DetailPhotoViewRender.h"
#import "DetailPhotoCollectionViewCell.h"
#import "LTCategoryPhotosViewModel.h"

@interface DetailPhotoViewRender()
@property (nonatomic, strong) NSString *detailCellId;

@property (nonatomic, assign) NSInteger columnCount;
@property (nonatomic, assign) NSInteger spacing;

@end

@implementation DetailPhotoViewRender

-(instancetype)initWithCollectionView:(UICollectionView *)collectionView
{
    if (self = [self init]) {
        self.collectionView = collectionView;
        
        [self setup];
    }
    
    return self;
}

-(void)setup
{
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.detailCellId = @"DetaiPhotoCellId";
    [self.collectionView registerNib:[UINib nibWithNibName:@"DetailPhotoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:self.detailCellId];
    
    self.columnCount = 1;
    self.spacing = 5;
}

-(void)setDataSource:(NSArray *)dataSource
{
    _dataSource = dataSource;
    [self reload];
}

-(void)reload
{
    [self.collectionView reloadData];
}

#pragma mark - Datasource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataSource.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailPhotoCollectionViewCell *cell = (DetailPhotoCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:self.detailCellId forIndexPath:indexPath];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.dataSource.count -1) {
        self.loadmore();
    }
    
    LTCategoryPhotosViewModel *vm = self.dataSource[indexPath.row];
    [(DetailPhotoCollectionViewCell*)cell render:vm];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = collectionView.bounds.size.width;
    CGFloat cellWdith = ceil((width - (self.columnCount + 1) * self.spacing) / self.columnCount);
    
    LTCategoryPhotosViewModel *vm = self.dataSource[indexPath.row];
    CGFloat height = [vm expectedHeightBoundIn:cellWdith];
    
    return CGSizeMake(cellWdith, height);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

#pragma mark Delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LTCategoryPhotosViewModel *vm = self.dataSource[indexPath.row];
    [self.delegate render:self didSelect:vm];
}

@end
