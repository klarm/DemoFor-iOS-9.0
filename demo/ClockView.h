//
//  ClockView.h
//

#import <UIKit/UIKit.h>

@interface ClockView : UIControl {
    NSTimer *updateTimer_;
    
    CAShapeLayer *hourHand_;
    CAShapeLayer *minuteHand_;
    CAShapeLayer *secondHand_;
}

- (void)startUpdates;
- (void)stopUpdates;

@end
