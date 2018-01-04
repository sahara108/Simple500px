//
//  DetailPhotoCollectionViewCell.m
//  LazadaTestApp
//
//  Created by Nguyen Tuan on 12/17/17.
//  Copyright © 2017 Nguyen Tuan. All rights reserved.
//

#import "DetailPhotoCollectionViewCell.h"
#import "LTCategoryPhotosViewModel.h"

@interface DetailPhotoCollectionViewCell()

@property (nonatomic, strong) LTCategoryPhotosViewModel *vm;

@end

@implementation DetailPhotoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.layer.borderWidth = 2;
    self.layer.borderColor = [UIColor brownColor].CGColor;
}

-(void)render:(LTCategoryPhotosViewModel *)photoViewModel
{
    self.vm = photoViewModel;
    
    self.nameLabel.attributedText = photoViewModel.displayPhotoName;
    self.timeLabel.attributedText = photoViewModel.timeStamp;
    self.descriptionLabel.attributedText = photoViewModel.photoDescription;
    
    self.imageView.image = nil;
    [self.vm requestImageWithCompletion:^(LTCategoryPhotosViewModel *vm, UIImage *img, NSError *e) {
        if (vm == self.vm) {
            self.imageView.image = img;
        }
    }];
}

@end
