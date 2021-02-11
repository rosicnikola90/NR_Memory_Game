//
//  Card.h
//  NR_Memory_Game
//
//  Created by MacBook on 12/22/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NRCard : NSObject


@property (strong, nonatomic) NSString *cardName;
@property (nonatomic) bool isFlipped;
@property (nonatomic) bool isMatched;

-(instancetype) initWithName: (NSString*) name;


@end

NS_ASSUME_NONNULL_END
