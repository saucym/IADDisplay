//
//  IADDisplayImageView.m
//  IADDisplay
//
//  Created by QinMingChuan on 14/11/7.
//  Copyright (c) 2014年 413132340@qq.com. All rights reserved.
//

#import "IADDisplayImageView.h"

#define kIADAnimationKey @"IADAnimationKey"

@interface IADDisplayImageView()<CAAnimationDelegate>

@property (nonatomic) NSInteger currentIndex;

@property (nonatomic) BOOL isNext;

@end

@implementation IADDisplayImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.contentMode = UIViewContentModeScaleAspectFit;
        _waitTimeInterval = 1.0;
        _duration = 1.0;
        self.backgroundColor = [UIColor lightGrayColor];
    }
    
    return self;
}

- (void)setShowImages:(NSArray *)showImages
{
    _showImages = showImages;
    _isNext = YES;
    if(showImages.count > 0)
    {
        [self transitionAnimation:YES];
    }
}

-(void)transitionAnimation:(BOOL)isNext
{
    [self.layer removeAnimationForKey:kIADAnimationKey];
    //1.创建转场动画对象
    CATransition *transition=[[CATransition alloc]init];
    
    //2.设置动画类型,注意对于苹果官方没公开的动画类型只能使用字符串，并没有对应的常量定义
    //官方的: kCATransitionFade, kCATransitionMoveIn, kCATransitionPush , kCATransitionReveal
    //私有的: @"rippleEffect" , @"oglFlip" , @"cube";
//    transition.type = @"cube";
//    transition.subtype = kCATransitionFromRight;
    
    NSArray *typeArray = @[kCATransitionFade, kCATransitionMoveIn, kCATransitionPush , kCATransitionReveal, @"rippleEffect" , @"oglFlip" , @"cube"];
    static NSInteger index = 0;
    transition.type = typeArray[index];
    index ++;
    if(index >= typeArray.count)
    {
        index = 0;
    }
    
    //设置子类型
    if (isNext)
    {
        transition.subtype = kCATransitionFromRight;
    }
    else
    {
        transition.subtype = kCATransitionFromLeft;
    }
    
    //设置动画时常
    transition.duration = self.duration;
    
    //3.设置转场后的新视图添加转场动画
    self.image=[self getImage:isNext];
    transition.delegate = self;
    [self.layer addAnimation:transition forKey:kIADAnimationKey];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if(flag)
    {
        [self performSelector:@selector(showNextImage) withObject:nil afterDelay:self.waitTimeInterval];
    }
}

- (void)showNextImage
{
    [self transitionAnimation:self.isNext];
}

-(UIImage *)getImage:(BOOL)isNext
{
    NSInteger imCount= self.showImages.count;
    if (isNext)
    {
        _currentIndex = (_currentIndex + 1) % imCount;
    }
    else
    {
        _currentIndex = (_currentIndex - 1 + imCount) % imCount;
    }
    
    return self.showImages[_currentIndex];
}

@end
