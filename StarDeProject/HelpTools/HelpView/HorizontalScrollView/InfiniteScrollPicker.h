//
//  InfiniteScrollPicker.h
//  InfiniteScrollPickerExample
//
//  Created by Philip Yu on 6/6/13.
//  Copyright (c) 2013 Philip Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ScrollPickerDataSource <NSObject>

@required
- (UIView *)viewForIndex:(NSInteger)index;

- (NSInteger)viewAmount;

@end

@protocol ScrollPickerDelegate <NSObject>

@optional
- (void)didTapViewAtIndex:(NSInteger)index;

@end
@interface InfiniteScrollPicker : UIScrollView<UIScrollViewDelegate>
{
    NSMutableArray *imageStore;
    bool snapping;
    float lastSnappingX;
}
@property (nonatomic, weak)id<ScrollPickerDataSource> dataSource;
@property (nonatomic, weak)id<ScrollPickerDelegate> tapDelegate;

//@property (nonatomic, strong) NSArray *imageAry;
@property (nonatomic) CGSize itemSize;
@property (nonatomic) float alphaOfobjs;

@property (nonatomic) float heightOffset;
@property (nonatomic) float positionRatio;

- (void)initInfiniteScrollView;

@end
