//
//  LT500pxPhotoResponse.h
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/17/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LT500pxPhotoResponse : NSObject

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger totalPage;
@property (nonatomic, assign) NSInteger totalItems;
@property (nonatomic, strong) NSArray<NSDictionary*> *data;

+(LT500pxPhotoResponse*)parsePhotoRequest:(NSData*)photoData error:(NSError**)error;

@end

