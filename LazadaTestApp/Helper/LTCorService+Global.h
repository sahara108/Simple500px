//
//  LTCorService+Global.h
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/16/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTCoreService.h"

@interface LTCoreService (Global)

/**
 A convenience way to access global coreservice instance.

 @return coreservice object if set, nil if not.
 */
+(LTCoreService*)service;

@end
