//
//  PARPeople.m
//  BrownDispatcher
//
//  Created by Pablo Parejo Camacho on 7/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARPeople.h"

#define KEY_FOR_NAME @"name"
#define KEY_FOR_BROWNED @"browned"


@interface PARPeople ()

@property (strong, nonatomic) NSArray *model;

@end

@implementation PARPeople

+(PARPeople *) sharedInstance{
    static  PARPeople *inst = nil;
    @synchronized(self){
        if (!inst) {
            inst = [[self alloc] init];
            inst.model = [@[[@{KEY_FOR_NAME: @"Lucia", KEY_FOR_BROWNED: @NO} mutableCopy],
                            [@{KEY_FOR_NAME: @"Alberto", KEY_FOR_BROWNED: @NO}mutableCopy],
                            [@{KEY_FOR_NAME: @"Antonio", KEY_FOR_BROWNED: @NO}mutableCopy],
                            [@{KEY_FOR_NAME: @"Hugo", KEY_FOR_BROWNED: @NO}mutableCopy]] mutableCopy];
        }
    }
    return inst;
}

-(NSUInteger) brownedCount{

    __block NSUInteger count = 0;
    
    [self.model enumerateObjectsWithOptions:NSEnumerationConcurrent
                                 usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                                     if ([[obj objectForKey:KEY_FOR_BROWNED] boolValue]) {
                                         count++;
                                     }
                                 }];
    return count;
}

-(NSUInteger) count{
    return [self.model count];
}

-(void) setPersonAtIndex:(NSUInteger)index browned:(BOOL) browned{
    [[self.model objectAtIndex:index] setObject:@(browned) forKey:KEY_FOR_BROWNED];
}

-(NSString *) nameForPersonAtIndex:(NSUInteger)index{
    return [[self.model objectAtIndex:index] objectForKey:KEY_FOR_NAME];
}

-(BOOL) brownedForPersonAtIndex:(NSUInteger)index{
    return [[[self.model objectAtIndex:index] objectForKey:KEY_FOR_BROWNED] boolValue];
}

+(NSString *) nameKey{
    return KEY_FOR_NAME;
}
+(NSString *) brownedKey{
    return KEY_FOR_BROWNED;
}




@end

