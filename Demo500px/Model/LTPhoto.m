//
//  LTPhoto.m
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/16/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import "LTPhoto.h"
#import "LTDateHelper.h"

@interface LTPhotoImageObj: NSObject

@property (nonatomic, assign) NSInteger size;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSString *format;

-(instancetype)initWithData:(NSDictionary*)data;

@end

@implementation LTPhotoImageObj

-(instancetype)initWithData:(NSDictionary *)data
{
    if (self = [self init]) {
        self.url = [NSURL URLWithString:data[@"https_url"]];
        self.size = [data[@"size"] integerValue];
        self.format = data[@"format"];
    }
    
    return self;
}

@end

@implementation LTPhoto

-(instancetype)initWithData:(NSDictionary *)data
{
    if (self = [self init]) {
        
        self.pid = data[@"id"];
        if (data[@"name"] != [NSNull null]) {
            self.name = data[@"name"];
        }else {
            self.name = @"";
        }
        if (data[@"description"] != [NSNull null]) {
            self.ltDes = data[@"description"];
        }else {
            self.ltDes = @"";
        }
        
        self.createdDate = [LTDateHelper dateFrom500pxDateString:data[@"created_at"]];
        
        NSArray *imagesData = data[@"images"];
        NSMutableArray *objects = [NSMutableArray new];
        for (NSDictionary *d in imagesData) {
            LTPhotoImageObj *obj = [[LTPhotoImageObj alloc] initWithData:d];
            [objects addObject:obj];
        }
        self.imageObject = objects;
    }
    
    return self;
}

-(NSURL *)photoURL
{
    LTPhotoImageObj *obj = self.imageObject.firstObject;
    return obj.url;
}

@end
