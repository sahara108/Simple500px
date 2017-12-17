//
//  LT500pxRequestBuilder.h
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/16/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LT500pxRequestProtocol;
@interface LT500pxRequestBuilder : NSObject

@property (nonatomic, strong) NSString *host;
@property (nonatomic, strong) NSString *consumerKey;

-(instancetype)initWithHost:(NSString*)host;

-(NSURLRequest *)buildRequest:(id<LT500pxRequestProtocol>)request;

@end
