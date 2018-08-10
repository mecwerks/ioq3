/*
 * Quake3 -- iOS Port
 *
 * Seth Kingsley, January 2008.
 */

#import <UIKit/UIKit.h>

@class Q3ScreenView;
@class Q3Downloader;

@interface Quake3AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, retain) UIWindow* window;

@property (readonly, nonatomic) Q3ScreenView *screenView;
@property (readonly, nonatomic) float deviceRotation;

@end
