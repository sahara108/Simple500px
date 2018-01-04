//
//  LTCoreService.h
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/15/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTServiceProtocol.h"
#import "LT500pxAPIService.h"
#import "LTDBService.h"
#import "LTFileService.h"

@interface LTCoreService : NSObject<LTServiceProtocol>

@property (nonatomic, strong, readonly) LT500pxAPIService *apiService;
@property (nonatomic, strong, readonly) LTDBService *dbService;
@property (nonatomic, strong, readonly) LTFileService *fileService;

@end
