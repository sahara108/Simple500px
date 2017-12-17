//
//  LTCategoryViewModel.m
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/17/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import "LTCategoryViewModel.h"
#import "LTCategory.h"

@interface LTCategoryViewModel ()

@property (nonatomic, strong) LTCategory *category;

@end

@implementation LTCategoryViewModel

-(instancetype)initWithCategory:(LTCategory *)model
{
    if (self = [self init]) {
        self.category = model;
    }
    
    return self;
}

-(NSString*)displayName
{
    return self.category.name;
}

-(NSString *)categoryId
{
    return  self.category.name;
}

@end
