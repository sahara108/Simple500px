//
//  LT500pxPhotoRequest.h
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/17/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LT500pxRequestProtocol.h"

//https://github.com/500px/api-documentation/blob/master/basics/formats_and_terms.md#photo-object-formats

typedef enum {
    popular = 0,
    highest_rated,
    upcoming,
    editors,
    fresh_today,
    fresh_yesterday,
    fresh_week,
    
    //Those option will requires user_id and username parametter.
    user,
    user_friends,
}PhotoRequestFeature;

typedef enum {
    s70 = 1,  //squared 70
    s140,
    s280,
    s100 = 100,
    s200 = 200,
    s440 = 440,
    s600 = 600
}PhotoRequestImagesize;

@interface LT500pxPhotoRequest : NSObject <LT500pxRequestProtocol>

/**
 Required. Automatically created in initialization
 */
@property (nonatomic, readonly) NSString *endPoint;

/**
 Required. Unsupported feature will raise exception.
 */
@property (nonatomic, assign, readonly) PhotoRequestFeature feature;


/**
 Optional but prefer. Valid values are defined in `PhotoRequestImagesize`. All non-valid values are ignored
 */
@property (nonatomic, strong, readonly) NSArray<NSNumber*> *sizeArray;


/**
 Optional, if set, will load all photo of this category
 */
@property (nonatomic, strong) NSString *category;

//Pagination. Default is 1 if not set.
@property (nonatomic, assign) NSInteger page;


/**
 Create a new photo request object. Any custom properties can be set after created object return

 @param f Required. See `PhotoRequestFeature`.
 @param s 500px support to request photo with mutable size. Valid values are defined in `PhotoRequestImagesize`. All non-valid values are ignored
 @return request object if all set.
 */
-(instancetype)initWithFeature:(PhotoRequestFeature)f requestedSize:(NSArray<NSNumber*> *)s;

@end
