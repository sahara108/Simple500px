//
//  LTCoreService.m
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/15/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import "LTCoreService.h"
//#import "LTAuthService.h"
#import "LTDBService.h"
#import "LT500pxAPIService.h"

@interface LTCoreService ()

@end

@implementation LTCoreService

-(void)start
{
    //startup other service components
    _apiService = [LT500pxAPIService new];
    [self.apiService start];
    
    _dbService = [LTDBService new];
    [self.dbService start];
    
    _fileService = [LTFileService new];
    [self.fileService start];
    
}

-(void)stop
{
    [self.apiService stop];
    [self.dbService stop];
    [self.fileService stop];
}

@end
