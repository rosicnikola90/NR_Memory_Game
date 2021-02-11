//
//  GameManager.h
//  NR_Memory_Game
//
//  Created by MacBook on 12/22/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NRCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface NRGameManager : NSObject

@property  (strong, nonatomic) NSMutableArray *cardsForPlay;

@property (nonatomic) int matchedPairs;

-(void) setCardsForPlay;
//-(void) checkIfGameEndedOnController: (UIViewController*) vc;

@end

NS_ASSUME_NONNULL_END
