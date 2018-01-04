//
//  LTPagePhotos.h
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/17/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LTPhoto;
@interface LTPagePhotos : NSObject

@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger totalPage;
@property (nonatomic, assign) NSInteger totalItems;
@property (nonatomic, strong) NSArray<LTPhoto*> *photos;

@end
