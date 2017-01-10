//
//  AppDelegate.swift
//  KAV
//
//  Created by Michelle Becerra on 2/22/16.
//  Copyright (c) 2016 Michelle Becerra. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var word1 = ""
    var word2 = ""
    var word3 = ""

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let allWords = "acona yeja raid gawty stoths egog jiepta ikojy zett ovutu vekarr atsi unovey awedo vayka dejixi iptot nespa etyu yesoyz huvi rono vofy jicu woff tiap vubeyt laypt woafu bundy akoav cadol hoto becefy gotye ibir koneco oacabr rudy byda shupab tejyi tiaja navexi boapi yoby rapo oksga ukip epafta medor avauva racs imgoft shed omitu moed molap hild deydid rundy tepow rifa dyzi riviv rojuc binn tifeky aday nelu fabo odirom bapat jucoo oshufi horc chagso shemeb lidduj wygs eawir buverk yaymi ameu kutsri wafsa dydsy dovy quan nulk pico nitu shut vepo tiji rufid hidd aroct koovol ejijee".componentsSeparatedByString(" ")
        
        let randomIndex = Int(arc4random_uniform(UInt32(allWords.count)))
        
        var randomIndexTwo = Int(arc4random_uniform(UInt32(allWords.count)))
        
        while(randomIndex == randomIndexTwo) {
            randomIndexTwo = Int(arc4random_uniform(UInt32(allWords.count)))
        }
        
        var randomIndexThree = Int(arc4random_uniform(UInt32(allWords.count)))
        
        while randomIndexThree == randomIndexTwo || randomIndexThree == randomIndex {
            randomIndexThree = Int(arc4random_uniform(UInt32(allWords.count)))
        }
        
        
        word1 = allWords[randomIndex]
        word2 = allWords[randomIndexTwo]
        word3 = allWords[randomIndexThree]
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

