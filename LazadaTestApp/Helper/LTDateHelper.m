//
//  LTDateHelper.m
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/17/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import "LTDateHelper.h"

@implementation LTDateHelper

+(NSDate *)dateFrom500pxDateString:(NSString *)dateString
{
    NSDateFormatter *fmt = [self dateFormatter500px];
    return [fmt dateFromString:dateString];
}

+(NSDateFormatter *)dateFormatter500px;
{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    });
    return dateFormatter;
}

@end
