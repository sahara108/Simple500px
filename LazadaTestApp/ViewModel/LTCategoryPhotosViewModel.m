//
//  LTCategoryPhotosViewModel.m
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/17/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import "LTCategoryPhotosViewModel.h"
#import "LTPhoto.h"
#import "LTCorService+Global.h"

@interface LTCategoryPhotosViewModel()

@property (nonatomic, strong) LTPhoto *photo;

@property (nonatomic, strong) NSAttributedString *photoName;
@property (nonatomic, strong) NSAttributedString *photoDes;
@property (nonatomic, strong) NSAttributedString *photoTimestamp;

@end

@implementation LTCategoryPhotosViewModel

-(instancetype)initWithPhoto:(LTPhoto *)photo
{
    if (self = [self init]) {
        _photo = photo;
    }
    
    return self;
}

#pragma mark
-(void)requestImageWithCompletion:(void (^)(LTCategoryPhotosViewModel *,UIImage *, NSError *))completion
{
    [[LTCoreService service].fileService downloadImage:_photo.photoURL completion:^(UIImage *img, NSError *e) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (img != nil) {
                completion(self,img,  nil);
            }else {
                completion(self, nil, nil);
            }
        });
    }];
}

#pragma mark

-(CGFloat)expectedHeightBoundIn:(CGFloat)width
{
    //Please look at DetailPhotoCollectionViewCell.xib. Most constant get from there
    CGFloat height = 85; // start of the description label
    if (self.photoDescription.length == 0) {
        return height;
    }
    
    CGFloat desWidth = width - 5 - 5 - 4; //description label have 5 padding leading and 5 padding trailing. And usually label has 2 inset left and right;
    CGRect rect = [[self photoDescription] boundingRectWithSize:CGSizeMake(desWidth, CGFLOAT_MAX) options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin) context:NULL];
    height += rect.size.height + 10; //we should expect 10 for the bottom margin.
    return height;
}


#pragma mark
-(NSAttributedString *)displayPhotoName
{
    if (self.photoName == nil) {
        self.photoName = [[NSAttributedString alloc] initWithString:_photo.name attributes: @{NSFontAttributeName: [UIFont systemFontOfSize:17], NSForegroundColorAttributeName: [UIColor blackColor]}];
    }
    
    return self.photoName;
}

-(NSAttributedString *)photoDescription
{
    if (self.photoDes == nil) {
        self.photoDes = [[NSAttributedString alloc] initWithData:[_photo.ltDes dataUsingEncoding:NSUTF8StringEncoding]
                                                         options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                                   NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                                              documentAttributes:nil error:nil];
    }
    return self.photoDes;
}

-(NSAttributedString *)timeStamp
{
    if (self.photoTimestamp == nil) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
        self.photoTimestamp = [[NSAttributedString alloc] initWithString:[dateFormatter stringFromDate:_photo.createdDate] attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13], NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    }
    
    return self.photoTimestamp;
}

@end
