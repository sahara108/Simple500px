//
//  LT500pxAPIService.h
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/15/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTServiceProtocol.h"

@class LTPagePhotos;
@interface LT500pxAPIService : NSObject<LTServiceProtocol>

-(void)loadCategories:(void (^)(NSArray *, NSError*))completion;
-(void)loadPhotosBy:(NSString*)category page:(NSInteger)p completion:(void (^)(LTPagePhotos *, NSError*))completion;

@end
