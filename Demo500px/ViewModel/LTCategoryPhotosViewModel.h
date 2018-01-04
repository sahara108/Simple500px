//
//  LTCategoryPhotosViewModel.h
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/17/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class LTPhoto;
@interface LTCategoryPhotosViewModel : NSObject

-(instancetype)initWithPhoto:(LTPhoto*)photo;


-(CGFloat)expectedHeightBoundIn:(CGFloat)width;

//TODO:
-(void)requestImageWithCompletion:(void (^)(LTCategoryPhotosViewModel *,UIImage *, NSError *))completion;

-(NSAttributedString*)displayPhotoName;
-(NSAttributedString*)timeStamp;
-(NSAttributedString*)photoDescription;

@end
