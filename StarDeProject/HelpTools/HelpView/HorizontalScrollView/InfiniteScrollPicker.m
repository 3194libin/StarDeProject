//
//  InfiniteScrollPicker.m
//  InfiniteScrollPickerExample
//
//  Created by Philip Yu on 6/6/13.
//  Copyright (c) 2013 Philip Yu. All rights reserved.
//

#import "InfiniteScrollPicker.h"
#import "UIView+viewController.h"

@implementation InfiniteScrollPicker

//@synthesize imageAry = _imageAry;
@synthesize itemSize = _itemSize;
@synthesize alphaOfobjs;
@synthesize heightOffset;
@synthesize positionRatio;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        alphaOfobjs = 1.0;
        heightOffset = 0.0;
        positionRatio = 1.0;
        
        //_imageAry = [[NSMutableArray alloc] init];
        imageStore = [[NSMutableArray alloc] init];
        
        //尝试在初始化的时候添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheImage:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}
//可能被调用两次
- (void)initInfiniteScrollView
{
    if (_itemSize.width == 0 && _itemSize.height == 0) {
        /*
        if (_imageAry.count > 0) _itemSize = [(UIImage *)[_imageAry objectAtIndex:0] size];
        else _itemSize = CGSizeMake(self.frame.size.height/2, self.frame.size.height/2);
         */
        _itemSize = [self.dataSource viewForIndex:0].bounds.size;
    }
    
    NSAssert((_itemSize.height < self.frame.size.height), @"item's height must not bigger than scrollpicker's height");

    self.pagingEnabled = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    
        
        // Init 5 set of images, 3 for user selection, 2 for
        for (int i = 0; i < [self.dataSource viewAmount]*5; i++)
        {
            // Place images into the bottom of view
            /*
            UIImageView *temp = [[UIImageView alloc] initWithFrame:CGRectMake(i * _itemSize.width, self.frame.size.height - _itemSize.height, _itemSize.width, _itemSize.height)];
            temp.image = [_imageAry objectAtIndex:i%_imageAry.count];
            [imageStore addObject:temp];
            [self addSubview:temp];
             */
            UIView *temp = [self.dataSource viewForIndex:i%([self.dataSource viewAmount])];
            temp.frame = CGRectMake(i * _itemSize.width, self.frame.size.height - _itemSize.height, _itemSize.width, _itemSize.height);
            [imageStore addObject:temp];
            [self addSubview:temp];
        }
        
        self.contentSize = CGSizeMake([self.dataSource viewAmount] * 5 * _itemSize.width, self.frame.size.height);
        
        float viewMiddle = [self.dataSource viewAmount] * 2 * _itemSize.width;
        
        [self setContentOffset:CGPointMake(viewMiddle, 0)];
        
        self.delegate = self;
        
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(queue, ^ {
            [self reloadView:viewMiddle-10];
            dispatch_async(dispatch_get_main_queue(), ^ {
                [self snapToAnEmotion];
            });
        });
}
- (void)tapTheImage:(UITapGestureRecognizer *)tap
{
    NSLog(@"点击手势的坐标为:(%f,%f)",[tap locationInView:self].x-2700,[tap locationInView:self].y);
    //写到这里
    float tapX = [tap locationInView:self].x;
    int index = floor(tapX)/_itemSize.width;
    NSInteger tapIndex =index%([self.dataSource viewAmount]);
    NSLog(@"index为%d",index%([self.dataSource viewAmount]));
    if (self.tapDelegate && [self.tapDelegate respondsToSelector:@selector(didTapViewAtIndex:)])
    {
        [self.tapDelegate didTapViewAtIndex:tapIndex];
    }
}

//- (void)setImageAry:(NSArray *)imageAry
//{
//    _imageAry = imageAry;
//    [self initInfiniteScrollView];
//}

- (void)setItemSize:(CGSize)itemSize
{
    itemSize = itemSize;
    [self initInfiniteScrollView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.contentOffset.x > 0)
    {
        float sectionSize = [self.dataSource viewAmount] * _itemSize.width;
        
        if (self.contentOffset.x <= (sectionSize - sectionSize/2))
        {
            self.contentOffset = CGPointMake(sectionSize * 2 - sectionSize/2, 0);
        } else if (self.contentOffset.x >= (sectionSize * 3 + sectionSize/2)) {
            self.contentOffset = CGPointMake(sectionSize * 2 + sectionSize/2, 0);
        }

        [self reloadView:self.contentOffset.x];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (decelerate == 0 && !snapping) [self snapToAnEmotion];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (!snapping) [self snapToAnEmotion];
}

//在这里改变了它的大小
- (void)reloadView:(float)offset
{
    float biggestSize = 0;
    id biggestView;

    for (int i = 0; i < imageStore.count; i++) {
        
        UIImageView *view = [imageStore objectAtIndex:i];
        
        if (view.center.x > (offset - _itemSize.width ) && view.center.x < (offset + self.frame.size.width + _itemSize.width))
        {
            float tOffset = (view.center.x - offset) - self.frame.size.width/4;
            
            if (tOffset < 0 || tOffset > self.frame.size.width) tOffset = 0;
            float addHeight = (-1 * fabsf((tOffset)*2 - self.frame.size.width/2) + self.frame.size.width/2)/4;
            
            if (addHeight < 0) addHeight = 0;
            
            view.frame = CGRectMake(view.frame.origin.x,
                                    self.frame.size.height - _itemSize.height - heightOffset - (addHeight/positionRatio),
                                    _itemSize.width + addHeight,
                                    _itemSize.height + addHeight);

            if (((view.frame.origin.x + view.frame.size.width) - view.frame.origin.x) > biggestSize)
            {
                biggestSize = ((view.frame.origin.x + view.frame.size.width) - view.frame.origin.x);
                biggestView = view;
            }
            
        } else {
            view.frame = CGRectMake(view.frame.origin.x, self.frame.size.height, _itemSize.width, _itemSize.height);
            for (UIImageView *imageView in view.subviews)
            {
                imageView.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
            }
        }
    }
    
    for (int i = 0; i < imageStore.count; i++)
    {
        UIView *cBlock = [imageStore objectAtIndex:i];
        cBlock.alpha = alphaOfobjs;

        if (i > 0)
        {
            UIView *pBlock = [imageStore objectAtIndex:i-1];
            cBlock.frame = CGRectMake(pBlock.frame.origin.x + pBlock.frame.size.width, cBlock.frame.origin.y, cBlock.frame.size.width, cBlock.frame.size.height);
        }
    }

    [(UIView *)biggestView setAlpha:1.0];
}

- (void)snapToAnEmotion
{
    
    float biggestSize = 0;
    UIImageView *biggestView;
    
    snapping = YES;
    
    float offset = self.contentOffset.x;
    
    for (int i = 0; i < imageStore.count; i++) {
        UIImageView *view = [imageStore objectAtIndex:i];
    
        if (view.center.x > offset && view.center.x < (offset + self.frame.size.width))
        {
            if (((view.center.x + view.frame.size.width) - view.center.x) > biggestSize)
            {
                biggestSize = ((view.frame.origin.x + view.frame.size.width) - view.frame.origin.x);
                biggestView = view;
            }
            
        }
    }
    
    float biggestViewX = biggestView.frame.origin.x + biggestView.frame.size.width/2 - self.frame.size.width/2;
    float dX = self.contentOffset.x - biggestViewX;
    NSLog(@"当前偏移量为:%f－－－%f",self.contentOffset.x,CGRectGetMidX(biggestView.frame));
    //每次该偏移量都计算的不一样，所以需要改动
    float newX = self.contentOffset.x - dX/1.4;
    
    //增加计算实际偏移量的方法，
    int a = (biggestViewX-2985)/_itemSize.width;
    // Disable scrolling when snapping to new location
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^ {
        [self setScrollEnabled:NO];
        [self scrollRectToVisible:CGRectMake([self sumOprationWithY:biggestViewX x:_itemSize.width addtion:2985], 0, self.frame.size.width, 1) animated:YES];
        
        dispatch_async(dispatch_get_main_queue(), ^ {
            
            [self setScrollEnabled:YES];
            snapping = 0;
        });
    });
}
- (float)sumOprationWithY:(float)y x:(float)x addtion:(float)addtion
{
    int a = (y-addtion)/x;
    float b1 = fabsf(y-addtion-a*x);
    float b2 = fabsf(y-addtion-(a-1)*x);
    float b3 = fabsf(y-addtion-(a+1)*x);
    if (b1<b2 && b1<b3)
    {
        return a*x+addtion;
    }
    else if (b2<b1 && b2<b3)
    {
        return (a-1)*x+addtion;
    }
    else if (b3<b1 && b3<b2)
    {
        return (a+1)*x+addtion;
    }
    else
    return a*x+addtion;
}

@end
