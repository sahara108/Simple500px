//
//  LT500pxPhotoRequest.m
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/17/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import "LT500pxPhotoRequest.h"
#import "NSString+URLEncoding.h"

@implementation LT500pxPhotoRequest

-(instancetype)initWithFeature:(PhotoRequestFeature)f requestedSize:(NSArray<NSNumber *> *)s
{
    if (self = [self init]) {
        _feature = f;
        _sizeArray = s;
        _page = 1;
        _endPoint = @"photos";
    }
    
    return self;
}

-(NSString*)uri
{
    NSString *builder = @"";
    builder = [NSString stringWithFormat:@"feature=%@",[self featureDescription]];
    
    if (self.sizeArray.count == 1) {
        builder = [NSString stringWithFormat:@"%@&image_size=%ld", builder,self.sizeArray.firstObject.integerValue];
    }else {
        for (NSNumber *size in self.sizeArray) {
            builder = [NSString stringWithFormat:@"%@&image_size[]=%ld", builder, size.integerValue];
        }
    }
    
    if (self.category.length > 0) {
        builder = [NSString stringWithFormat:@"%@&only=%@",builder, self.category];
    }
    
    builder = [NSString stringWithFormat:@"%@&page=%ld",builder, self.page];
    
    builder = [NSString stringWithFormat:@"%@?%@", _endPoint, builder];
    
    return [builder utf8AndURLEncode];
}

#pragma mark Private

-(NSString*)featureDescription
{
    NSString *result = @"";
    switch (self.feature) {
        case popular:
            result = @"popular";
            break;
        case highest_rated:
            result = @"highest_rated";
            break;
            case upcoming:
            result = @"upcoming";
            break;
        case editors:
            result = @"editors";
            break;
        case fresh_today:
            result = @"fresh_today";
            break;
        case fresh_yesterday:
            result = @"fresh_yesterday";
            break;
        case fresh_week:
            result = @"fresh_week";
            break;
        case user:
            result = @"user";
            break;
        case user_friends:
            result = @"user_friends";
            break;
        default:
            break;
    }
    
    return result;
}

@end
