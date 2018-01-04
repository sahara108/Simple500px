//
//  LT500pxPhotoResponse.m
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/17/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import "LT500pxPhotoResponse.h"

@implementation LT500pxPhotoResponse

+(LT500pxPhotoResponse *)parsePhotoRequest:(NSData *)photoData error:(NSError *__autoreleasing *)error
{
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:photoData options:NSJSONReadingAllowFragments error:error];
    
    if (*error == nil) {
        LT500pxPhotoResponse *response = [LT500pxPhotoResponse new];
        response.totalPage = [jsonObject[@"total_pages"] integerValue];
        response.page = [jsonObject[@"current_page"] integerValue];
        response.totalItems = [jsonObject[@"total_items"] integerValue];
        response.data = jsonObject[@"photos"];
        return response;
    }
    
    return nil;
}

@end
