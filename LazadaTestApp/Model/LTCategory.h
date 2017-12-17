//
//  LTCategoryModel.h
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/16/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTCategory : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger catId;

-(LTCategory*)initWith:(NSDictionary*)data;


@end
