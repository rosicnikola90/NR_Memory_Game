//
//  NRCollectionViewCell.m
//  NR_Memory_Game
//
//  Created by MacBook on 12/20/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

#import "NRCardCell.h"

@implementation NRCardCell

-(void) setCellWithCard: (NRCard*) card {
    
    if (card.isMatched) {
        [self setAlpha:0.0];
    }
    else {
        [self setAlpha:1.0];
    }
    if (card.isFlipped) {
        [self.cardImageLabel setImage:[UIImage imageNamed:card.cardName]];
    }
    else {
        [self.cardImageLabel setImage:[UIImage imageNamed:@"back"]];
    }
}

-(void) flippCard :(NRCard*)card {
    
    [UIView transitionWithView:self.cardImageLabel duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        [self.cardImageLabel setImage:[UIImage imageNamed:card.cardName]];
    } completion:nil];
}

-(void) flippBackCard {

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [UIView transitionWithView:self.cardImageLabel duration:0.4 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [self.cardImageLabel setImage:[UIImage imageNamed:@"back"]];
        } completion:nil];
        
    });
}

-(void) setCardMatched {
    [UIView transitionWithView:self duration:0.7 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self setAlpha:0.0];
    } completion:nil];
}

@end
