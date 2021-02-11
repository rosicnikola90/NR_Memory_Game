//
//  Card.m
//  NR_Memory_Game
//
//  Created by MacBook on 12/22/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

#import "NRCard.h"

@implementation NRCard

-(instancetype) initWithName: (NSString*) name {
    self = [super init];
    if (self) {
        self.isFlipped = false;
        self.isMatched = false;
        self.cardName = name;
        
    }
    return self;
}

@end
