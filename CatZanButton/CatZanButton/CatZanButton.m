//
//  CatZanButton.m
//  CatZanButton
//
//  Created by K-cat on 15/7/13.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import "CatZanButton.h"

@interface CatZanButton (){
    UIImageView *_zanImageView;
    CAEmitterLayer *_effectLayer;
    CAEmitterCell *_effectCell;
    UIImage *_zanImage;
    UIImage *_unZanImage;
}

@end

@implementation CatZanButton

-(instancetype)init{
    self=[super init];
    if (self) {
        [self setFrame:CGRectMake(0, 0, 30, 30)];
        _zanImage=[UIImage imageNamed:@"Zan"];
        _unZanImage=[UIImage imageNamed:@"UnZan"];
        _type=CatZanButtonTypeFirework;
        [self initBaseLayout];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        _zanImage=[UIImage imageNamed:@"Zan"];
        _unZanImage=[UIImage imageNamed:@"UnZan"];
        _type=CatZanButtonTypeFirework;
        [self initBaseLayout];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame zanImage:(UIImage *)zanImage unZanImage:(UIImage *)unZanIamge{
    self=[super initWithFrame:frame];
    if (self) {
        _zanImage=zanImage;
        _unZanImage=unZanIamge;
        _type=CatZanButtonTypeFirework;
        [self initBaseLayout];
    }
    return self;
}

/**
 *  Init base layout
 */
-(void)initBaseLayout{
    _isZan=NO;
    
    switch (_type) {
        case CatZanButtonTypeFirework:{
            _effectLayer=[CAEmitterLayer layer];
            [_effectLayer setFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
            [self.layer addSublayer:_effectLayer];
            [_effectLayer setEmitterShape:kCAEmitterLayerCircle];
            [_effectLayer setEmitterMode:kCAEmitterLayerOutline];
            [_effectLayer setEmitterPosition:CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2)];
            [_effectLayer setEmitterSize:CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
            
            _effectCell=[CAEmitterCell emitterCell];
            [_effectCell setName:@"zanShape"];
            [_effectCell setContents:(__bridge id)[UIImage imageNamed:@"EffectImage"].CGImage];
            [_effectCell setAlphaSpeed:-1.0f];
            [_effectCell setLifetime:1.0f];
            [_effectCell setBirthRate:0];
            [_effectCell setVelocity:50];
            [_effectCell setVelocityRange:50];
            
            [_effectLayer setEmitterCells:@[_effectCell]];
            
            _zanImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
            [_zanImageView setImage:_unZanImage];
            [_zanImageView setUserInteractionEnabled:YES];
            [self addSubview:_zanImageView];
            
            UITapGestureRecognizer *tapImageViewGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zanAnimationPlay)];
            [_zanImageView addGestureRecognizer:tapImageViewGesture];
        }
            break;
        case CatZanButtonTypeFocus:{
            
        }
            break;
        default:
            break;
    }
}

/**
 *  An animation for zan action
 */
-(void)zanAnimationPlay{
    [self setIsZan:!self.isZan];
    if (self.clickHandler!=nil) {
        self.clickHandler(self);
    }
    
    switch (_type) {
        case CatZanButtonTypeFirework:{
            [UIView animateWithDuration:0.2f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [_zanImageView setBounds:CGRectMake(0, 0, CGRectGetWidth(self.frame)*1.5, CGRectGetHeight(self.frame)*1.5)];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                    [_zanImageView setBounds:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
                } completion:^(BOOL finished) {
                    if (self.isZan) {
                        CABasicAnimation *effectLayerAnimation=[CABasicAnimation animationWithKeyPath:@"emitterCells.zanShape.birthRate"];
                        [effectLayerAnimation setFromValue:[NSNumber numberWithFloat:100]];
                        [effectLayerAnimation setToValue:[NSNumber numberWithFloat:0]];
                        [effectLayerAnimation setDuration:0.0f];
                        [effectLayerAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
                        [_effectLayer addAnimation:effectLayerAnimation forKey:@"ZanCount"];
                    }
                }];
            }];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - Property method
-(void)setIsZan:(BOOL)isZan{
    _isZan=isZan;
    if (isZan) {
        [_zanImageView setImage:_zanImage];
    }else{
        [_zanImageView setImage:_unZanImage];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
