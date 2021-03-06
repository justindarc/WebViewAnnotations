//
//  WebViewAnnotationsAppDelegate.m
//  WebViewAnnotations
//
//  Created by Justin D'Arcangelo on 7/4/11.
//  Copyright 2011 None. All rights reserved.
//

#import "WebViewAnnotationsAppDelegate.h"

@implementation WebViewAnnotationsAppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;
@synthesize webViewAnnotationsViewController = _webViewAnnotationsViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	_window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
		_webViewAnnotationsViewController =
			[[WebViewAnnotationsViewController alloc] initWithNibName:@"WebViewAnnotationsViewController_iPhone"
															   bundle:nil];
	} else {
		_webViewAnnotationsViewController =
			[[WebViewAnnotationsViewController alloc] initWithNibName:@"WebViewAnnotationsViewController_iPad"
															   bundle:nil];
	}
	
	_webViewAnnotationsViewController.title = @"Web View";
	
	_navigationController = [[UINavigationController alloc] initWithRootViewController:_webViewAnnotationsViewController];
	_navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
	
	_window.rootViewController = _navigationController;
	
	[_window makeKeyAndVisible];
	
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
	/*
	 Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	 Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	 */
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	/*
	 Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	 If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	 */
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	/*
	 Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	 */
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	/*
	 Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	 */
}

- (void)applicationWillTerminate:(UIApplication *)application {
	/*
	 Called when the application is about to terminate.
	 Save data if appropriate.
	 See also applicationDidEnterBackground:.
	 */
}

@end
