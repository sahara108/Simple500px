//
//  DetailPhotoViewRender.h
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/17/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DetailPhotoViewRender;
@class LTCategoryPhotosViewModel;
@protocol DetailPhotoViewDelegate

-(void)render:(DetailPhotoViewRender*)render didSelect:(LTCategoryPhotosViewModel*)object;

@end

@interface DetailPhotoViewRender : NSObject<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, weak) id<DetailPhotoViewDelegate> delegate;

-(instancetype)initWithCollectionView:(UICollectionView*)collectionView;

-(void)reload;

#pragma mark Actions
@property (nonatomic, copy) void (^refresh)(void);
@property (nonatomic, copy) void (^loadmore)(void);

@end
