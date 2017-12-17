//
//  LTPagePhotos+500px.m
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/17/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import "LTPagePhotos+500px.h"
#import "LT500pxPhotoResponse.h"
#import "LTPhoto.h"

@implementation LTPagePhotos (px)

-(instancetype)initWithResponse:(LT500pxPhotoResponse *)response
{
    if (self = [self init]) {
        self.totalPage = response.totalPage;
        self.currentPage = response.page;
        self.totalItems = response.totalItems;
        
        NSMutableArray *photos = [NSMutableArray new];
        for (NSDictionary *d in response.data) {
            LTPhoto *p = [[LTPhoto alloc] initWithData:d];
            [photos addObject:p];
        }
        
        self.photos = photos;
    }
    
    return  self;
}

@end
