//
//  MainViewController.h
//  Quake3
//
//  Created by Valery Vaskabovich on 7/6/18.
//

#import <UIKit/UIKit.h>

#import "Q3Downloader.h"
#import "Q3ScreenView.h"

@interface MainViewController : UIViewController

@property (assign, readonly, nonatomic) Q3ScreenView *screenView;
@property (assign, readonly, nonatomic) float deviceRotation;

- (void)presentErrorMessage:(NSString *)errorMessage;
- (void)presentWarningMessage:(NSString *)warningMessage;

@end
