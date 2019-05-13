#import "RLCAppDelegate.h"

@implementation RLCAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    NSBundle *prefBundle = [NSBundle bundleWithPath:@"/Library/PreferenceBundles/RelocatePrefs.bundle"];
    [prefBundle load];
    if ([prefBundle isLoaded]) {
        _rootViewController = [[UINavigationController alloc] initWithRootViewController:[[NSClassFromString(@"RLCPrefsListController") alloc] init]];
    } else {
        UIViewController *blank = [[UIViewController alloc] init];
        [[_rootViewController view] setBackgroundColor:[UIColor whiteColor]];
        _rootViewController = [[UINavigationController alloc] initWithRootViewController:blank];
    }
    _window.rootViewController = _rootViewController;
    [_window makeKeyAndVisible];
}

- (void)dealloc {
    [_window release];
    [_rootViewController release];
    [super dealloc];
}

@end
