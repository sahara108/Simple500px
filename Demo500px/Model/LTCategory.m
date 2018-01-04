//
//  LTCategoryModel.m
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/16/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import "LTCategory.h"

@implementation LTCategory

-(LTCategory *)initWith:(NSDictionary *)data
{
    if (self = [self init]) {
        self.name = data[@"name"];
        self.catId = [data[@"id"] integerValue];
    }
    
    return self;
}

@end
