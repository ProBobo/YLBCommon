//
//  YLBAnimationDelegateManager.h
//  Pods-YLBCommon_Example
//
//  Created by yulibo on 2020/10/9.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/CoreAnimation.h>
NS_ASSUME_NONNULL_BEGIN

@protocol YLBAnimationWeakDelegate <NSObject>

@optional
- (void)animationDidStart:(CAAnimation *)anim;
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag;

@end

@interface YLBAnimationDelegateManager : NSObject<CAAnimationDelegate>
@property (weak, nonatomic) id<YLBAnimationWeakDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
