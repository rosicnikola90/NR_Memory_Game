//
//  NRCollectionViewCell.h
//  NR_Memory_Game
//
//  Created by MacBook on 12/20/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NRCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface NRCardCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cardImageLabel;

-(void) setCellWithCard: (NRCard*)card;

-(void) flippCard:(NRCard*)card;

-(void) flippBackCard;

-(void) setCardMatched;

@end

NS_ASSUME_NONNULL_END
