//
//  LTPhoto.h
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/16/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import <Foundation/Foundation.h>

//https://github.com/500px/api-documentation/blob/master/basics/formats_and_terms.md#photo-object-formats
//For this testing project,
@interface LTPhoto : NSObject

@property (nonatomic, strong) NSString *pid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *ltDes;
@property (nonatomic, strong) NSDate *createdDate;
@property (nonatomic, strong) NSArray *imageObject;

-(instancetype)initWithData:(NSDictionary*)data;


/**
 For simplicity, this api will return first photo url

 @return url object if possible
 */
-(NSURL*)photoURL;

@end
