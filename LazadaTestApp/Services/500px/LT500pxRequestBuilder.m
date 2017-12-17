//
//  LT500pxRequestBuilder.m
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/16/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import "LT500pxRequestBuilder.h"
#import "LT500pxRequestProtocol.h"

@implementation LT500pxRequestBuilder

-(instancetype)initWithHost:(NSString *)host
{
    if (self = [self init]) {
        self.host = host;
    }
    
    return self;
}

-(NSURLRequest *)buildRequest:(id<LT500pxRequestProtocol>)request
{
//    https://api.500px.com/v1/photos?feature=editors&page=2&consumer_key=6Smb5ogeF5k3nuo9IJ91dWVJDMkdQMmAIOT6wjG6
    NSString *urlString = [NSString stringWithFormat:@"%@%@&consumer_key=%@", _host, [request uri], _consumerKey];
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    
    return urlRequest;
    
}

@end
