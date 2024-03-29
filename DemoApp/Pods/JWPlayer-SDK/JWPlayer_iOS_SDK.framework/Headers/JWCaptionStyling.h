//
//  JWCaptionConfig.h
//  JWPlayer-iOS-SDK
//
//  Created by Karim Mourra on 5/4/15.
//  Copyright (c) 2015 JWPlayer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JWEdgeStyle) {
    JWEdgeStyleNone,
    JWEdgeStyleDropshadow,
    JWEdgeStyleRaised,
    JWEdgeStyleDepressed,
    JWEdgeStyleUniform
};

NS_ASSUME_NONNULL_BEGIN
/*!
 Configuration object used to customize the captions. Must be set to the JWConfig object used to create the JWPlayerController.
 */
@interface JWCaptionStyling : NSObject

/* ========================================*/
/** @name Accessing Captions Styling Attributes */

/*!
 Overrides the default font color of the captions, including its opacity.
 */
@property (nonatomic, nullable, retain) UIColor *color;

/*!
 Changes the background color and the opacity of the overall window the captions reside in.
 */
@property (nonatomic, nullable, retain) UIColor *windowColor;

/*!
 Changes the highlight color and highlight opacity of the text.
 */
@property (nonatomic, nullable, retain) UIColor *backgroundColor;

/*!
 Overrides the default font style and font size.
 */
@property (nonatomic, nullable, retain) UIFont *font;

/*!
 The edge style is an option to put emphasis around text. The available options are: none, dropshadow, raised, depressed, and uniform.
 */
@property (nonatomic) JWEdgeStyle edgeStyle;

@end
NS_ASSUME_NONNULL_END
