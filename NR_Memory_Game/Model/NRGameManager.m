//
//  GameManager.m
//  NR_Memory_Game
//
//  Created by MacBook on 12/22/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

#import "NRGameManager.h"

@interface NRGameManager ()

@property (strong, nonatomic) NSArray *cardNames;

@end

@implementation NRGameManager


-(void) setCardsForPlay {
    self.cardNames = @[@"card1", @"card2", @"card3", @"card4", @"card5", @"card6", @"card7", @"card8",@"card1", @"card2", @"card3", @"card4", @"card5", @"card6", @"card7", @"card8"];
    NSMutableArray *cards = [[NSMutableArray alloc] init];
    for (int i = 0; i < 16; i ++) {
        NRCard *newCard = [[NRCard alloc] initWithName:self.cardNames[i]];
        [cards addObject:newCard];
    }
    long count = [cards count];
    for (int i = 0; i < count; ++i) {
        long nElements = count - i;
        int n = (arc4random() % nElements) + i;
        [cards exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    self.cardsForPlay = cards;
}

//-(void) checkIfGameEndedOnController: (UIViewController*) vc {
//    if (self.matchedPairs == self.cardsForPlay.count/2){
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"alert title" message:@"alert message" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
//
//        }];
//        [alert addAction:action];
//        [vc presentViewController:alert animated:true completion:nil];
//    }
//}


@end
