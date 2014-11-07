//
//  ViewController.m
//  IADDisplay
//
//  Created by QinMingChuan on 14/11/7.
//  Copyright (c) 2014年 413132340@qq.com. All rights reserved.
//

#import "ViewController.h"
#import "IADDisplayImageView.h"

@interface ViewController ()

@property (nonatomic, readonly) IADDisplayImageView *dpIV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _dpIV = [[IADDisplayImageView alloc] initWithFrame:CGRectInset(self.view.bounds, 0, 0)];
    _dpIV.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_dpIV];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:8];
    for(NSInteger i = 0; i < 8; i++)
    {
        NSString *imName = [NSString stringWithFormat:@"Image-%ld", (long)i];
        UIImage *image = [UIImage imageNamed:imName];
        if(image)
        {
            [array addObject:image];
        }
    }
    
    [self.dpIV setShowImages:array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
