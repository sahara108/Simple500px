//
//  LT500pxAPIService.m
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/15/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import "LT500pxAPIService.h"
#import "LT500pxRequestBuilder.h"

#import "LT500pxPhotoRequest.h"
#import "LT500pxPhotoResponse.h"

#import "LT500pxConstants.h"

#import "LTCategory.h"
#import "LTPagePhotos+500px.h"

@interface LT500pxAPIService()

@property(nonatomic, strong) LT500pxRequestBuilder *builder;
@property(nonatomic, strong) NSArray *categoryData;

@end

@implementation LT500pxAPIService

-(void)start
{
    [self buildCategoryData];
    self.builder = [[LT500pxRequestBuilder alloc] initWithHost:LT500pxHost];
    self.builder.consumerKey = LT500pxConsumerKey;
}

-(void) stop
{
    self.categoryData = @[];
    self.builder = nil;
}

#pragma mark API
-(void)loadCategories:(void (^)(NSArray *, NSError*))completion
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSMutableArray *result = [NSMutableArray new];
        for (NSDictionary *data in self.categoryData) {
            LTCategory *cat = [[LTCategory alloc] initWith:data];
            [result addObject:cat];
        }
        
        completion(result, nil);
    });
}

-(void)loadPhotosBy:(NSString*)category page:(NSInteger)p completion:(void (^)(LTPagePhotos *, NSError*))completion
{
    LT500pxPhotoRequest *request = [[LT500pxPhotoRequest alloc] initWithFeature:editors requestedSize:@[@(s70)]];
    request.category = category;
    request.page = p;
    NSURLRequest *req = [self.builder buildRequest:request];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSError *parseError;
            LT500pxPhotoResponse *photoResponse = [LT500pxPhotoResponse parsePhotoRequest:data error:&parseError];
            if (parseError == nil) {
                LTPagePhotos *pages = [[LTPagePhotos alloc] initWithResponse:photoResponse];
                completion(pages, nil);
            }else {
                completion(nil, parseError);
            }
        }else {
            completion(nil, error);
        }
    }] resume];
}

#pragma mark Internal



-(void)buildCategoryData
{
    //I can't found any api that returns category data. Instead, it is documented in their documents: https://github.com/500px/api-documentation/blob/master/basics/formats_and_terms.md#categories
    NSMutableArray *data = [NSMutableArray new];
    NSDictionary *unknown = @{@"id": @0, @"name": @"Uncategorized"};
    [data addObject:unknown];
    
    NSDictionary *abstract = @{@"id": @10, @"name": @"Abstract"};
    [data addObject:abstract];
    
    NSDictionary *aerial = @{@"id": @29, @"name": @"Aerial"};
    [data addObject:aerial];
    
    NSDictionary *animals = @{@"id": @11, @"name": @"Animals"};
    [data addObject:animals];
    
    NSDictionary *baw = @{@"id": @5, @"name": @"Black and White"};
    [data addObject:baw];
    
    NSDictionary *celes = @{@"id": @1, @"name": @"Celebrities"};
    [data addObject:celes];
    
    NSDictionary *city = @{@"id": @9, @"name": @"City and Architecture"};
    [data addObject:city];
    
    NSDictionary *commercial = @{@"id": @15, @"name": @"Commercial"};
    [data addObject:commercial];
    
    NSDictionary *concert = @{@"id": @16, @"name": @"Concert"};
    [data addObject:concert];
    
    NSDictionary *family = @{@"id": @20, @"name": @"Family"};
    [data addObject:family];
    
    NSDictionary *fashion = @{@"id": @14, @"name": @"Fashion"};
    [data addObject:fashion];
    
    NSDictionary *film = @{@"id": @2, @"name": @"Film"};
    [data addObject:film];
    
    NSDictionary *art = @{@"id": @24, @"name": @"Fine Art"};
    [data addObject:art];
    
    NSDictionary *food = @{@"id": @23, @"name": @"Food"};
    [data addObject:food];
    
    NSDictionary *journalism = @{@"id": @3, @"name": @"Journalism"};
    [data addObject:journalism];
    
    NSDictionary *landscapes = @{@"id": @8, @"name": @"Landscapes"};
    [data addObject:landscapes];
    
    NSDictionary *marcro = @{@"id": @12, @"name": @"Macro"};
    [data addObject:marcro];
    
    NSDictionary *nature = @{@"id": @18, @"name": @"Nature"};
    [data addObject:nature];
    
    NSDictionary *night = @{@"id": @30, @"name": @"Night"};
    [data addObject:night];
    
    NSDictionary *nude = @{@"id": @4, @"name": @"Nude"};
    [data addObject:nude];
    
    NSDictionary *people = @{@"id": @7, @"name": @"People"};
    [data addObject:people];
    
    NSDictionary *performing = @{@"id": @19, @"name": @"Performing Arts"};
    [data addObject:performing];
    
    NSDictionary *sport = @{@"id": @17, @"name": @"Sport"};
    [data addObject:sport];
    
    NSDictionary *stillLife = @{@"id": @6, @"name": @"Still Life"};
    [data addObject:stillLife];
    
    NSDictionary *street = @{@"id": @21, @"name": @"Street"};
    [data addObject:street];
    
    NSDictionary *transportation = @{@"id": @26, @"name": @"Transportation"};
    [data addObject:transportation];
    
    NSDictionary *travel = @{@"id": @13, @"name": @"Travel"};
    [data addObject:travel];
    
    NSDictionary *underwater = @{@"id": @22, @"name": @"Underwater"};
    [data addObject:underwater];
    
    NSDictionary *urban = @{@"id": @27, @"name": @"Urban Exploration"};
    [data addObject:urban];
    
    NSDictionary *wedding = @{@"id": @25, @"name": @"Wedding"};
    [data addObject:wedding];
    
    self.categoryData = data;
}

@end
