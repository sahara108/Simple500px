//
//  DetailPhotoViewController.h
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/17/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@class LTCategoryViewModel;
@interface DetailPhotoViewController : BaseViewController

@property (nonatomic, strong, readonly) LTCategoryViewModel *category;

-(instancetype)initWithCoreService:(LTCoreService*)service category:(LTCategoryViewModel*)category;

@end
