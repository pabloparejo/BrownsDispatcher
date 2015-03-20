//
//  PARPeople.h
//  BrownDispatcher
//
//  Created by Pablo Parejo Camacho on 7/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PARPeople : NSObject


+(PARPeople *) sharedInstance;

-(NSString *) nameForPersonAtIndex:(NSUInteger)index;
-(BOOL) brownedForPersonAtIndex:(NSUInteger)index;
-(NSUInteger) brownedCount;
-(NSUInteger) count;
-(void) setPersonAtIndex:(NSUInteger)index browned:(BOOL) browned;



+(NSString *) nameKey;
+(NSString *) brownedKey;

@end
