//
//  LTDateHelper.h
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/17/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTDateHelper : NSObject

+(NSDate*)dateFrom500pxDateString:(NSString*)dateString;
+(NSDateFormatter *)dateFormatter500px;

@end
