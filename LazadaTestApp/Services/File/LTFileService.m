//
//  LTFileService.m
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/17/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import "LTFileService.h"

@interface LTFileService()

@property (nonatomic, strong) NSOperationQueue *workingQueue;

@end

@implementation LTFileService

-(void)downloadImage:(NSURL *)url completion:(void (^)(UIImage *, NSError *))completion
{
    NSOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error == nil) {
                UIImage *img = [[UIImage alloc] initWithData:data];
                completion(img, nil);
            }else {
                completion(nil, error);
            }
        }] resume];
    }];
    
    [self.workingQueue addOperation:op];
}

-(void)stop
{
    [self.workingQueue cancelAllOperations];
}

-(void)start
{
    self.workingQueue = [[NSOperationQueue alloc] init];
    self.workingQueue.qualityOfService = NSQualityOfServiceBackground;
}

@end
