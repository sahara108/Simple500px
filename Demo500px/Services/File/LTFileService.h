//
//  LTFileService.h
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/17/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTServiceProtocol.h"
#import <UIKit/UIKit.h>

@interface LTFileService : NSObject<LTServiceProtocol>

-(void)downloadImage:(NSURL*)url completion:(void (^)(UIImage*, NSError*))completion;

@end
