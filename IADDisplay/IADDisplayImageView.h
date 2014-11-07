//
//  IADDisplayImageView.h
//  IADDisplay
//
//  Created by QinMingChuan on 14/11/7.
//  Copyright (c) 2014年 413132340@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IADDisplayImageView : UIImageView

//! @brief 需要展示的图片
@property (nonatomic, strong) NSArray *showImages;

//! @brief 等待时间 default 1.0
@property (nonatomic) NSTimeInterval waitTimeInterval;

//! @brief 动画播放时间 default 1.0
@property (nonatomic) NSTimeInterval duration;

@end
