//
//  LTCategoryViewModel.h
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/17/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LTCategory;
@interface LTCategoryViewModel : NSObject

-(instancetype)initWithCategory:(LTCategory*)model;

-(NSString*)displayName;
-(NSString*)categoryId;

@end
