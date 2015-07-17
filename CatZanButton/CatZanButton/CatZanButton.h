//
//  CatZanButton.h
//  CatZanButton
//
//  Created by K-cat on 15/7/13.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger, CatZanButtonType) {
    CatZanButtonTypeFirework,
    CatZanButtonTypeFocus
};

@interface CatZanButton : UIControl

/**
 *  A bool value for button current status
 */
@property (nonatomic) BOOL isZan;

/**
 *  A enum for button animation type
 */
@property (nonatomic) CatZanButtonType type;

/**
 *  A handler for click button action
 */
@property (nonatomic, copy) void (^clickHandler)(CatZanButton *zanButton);

/**
 *  Initializes a new CatZanButton with appoint properties
 *
 *  @param frame      Button frame
 *  @param zanImage   Image for button active status
 *  @param unZanIamge Image for button inactive status
 *
 *  @return New CatZanButton object
 */
-(instancetype)initWithFrame:(CGRect)frame zanImage:(UIImage *)zanImage unZanImage:(UIImage *)unZanIamge;

@end
