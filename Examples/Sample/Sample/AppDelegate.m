//
//  AppDelegate.m
//  Sample
//
//  Created by Ignacio on 3/27/14.
//  Copyright (c) 2014 DZN Labs. All rights reserved.
//

#import "AppDelegate.h"
#import "DZNWebViewController.h"

#define DEBUG_LOCAL 0

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
#if DEBUG_LOCAL
    NSString *path = [[NSBundle mainBundle] pathForResource:@"NSHipster.com" ofType:@"html"];
    
    DZNWebViewController *controller = [[DZNWebViewController alloc] initWithFileURL:[NSURL fileURLWithPath:path]];
#else
    DZNWebViewController *controller = [[DZNWebViewController alloc] initWithURL:[NSURL URLWithString:@"https://baidu.com/"]];
    controller.iphoneToolsIsTop = YES;
    controller.supportedWebNavigationTools = DZNWebNavigationToolStopReload;
    controller.webNavigationPrompt = DZNWebNavigationPromptTitle;
    controller.hideBarsWithGestures = NO;
    controller.shareImage = [UIImage imageNamed:@"icon-60@3x.png"];
#endif
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    self.window.rootViewController = navController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    return YES;
}

@end
