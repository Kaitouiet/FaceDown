@interface SBIdleTimerGlobalCoordinator
@property (nonatomic, readonly) BOOL screenUp;
@end

@interface SpringBoard
- (void)_simulateLockButtonPress;
- (void)_simulateHomeButtonPress;
@end

%hook SBIdleTimerGlobalCoordinator

- (void)pocketStateMonitor:(id)arg1 pocketStateDidChangeFrom:(long long)arg2 to:(long long)arg3 {
  
  %orig;
  
  SpringBoard *springBoard = (SpringBoard *)UIApplication.sharedApplication; // filter plist indicates this tweak should only be loaded into SpringBoard
  BOOL screenUp = self.screenUp;

  if ((arg3 == 2) && screenUp) {
   [springBoard _simulateLockButtonPress];
    }
    
  if ((arg3 == 0) && screenUp) {
   [springBoard _simulateLockButtonPress];
    }
}   
%end
