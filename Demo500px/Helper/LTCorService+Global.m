//
//  LTCorService+Global.m
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/16/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import "LTCorService+Global.h"
#import "AppDelegate.h"

@implementation LTCoreService (Global)

+(LTCoreService* )service {
    if ([[UIApplication sharedApplication].delegate isKindOfClass:[AppDelegate class]]) {
        return ((AppDelegate*)[UIApplication sharedApplication].delegate).coreService;
    }
    
    return nil;
}

@end
