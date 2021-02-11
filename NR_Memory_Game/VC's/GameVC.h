//
//  GameVC.h
//  NR_Memory_Game
//
//  Created by MacBook on 12/20/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NRCardCell.h"
#import "NRGameManager.h"
#import "NRSoundManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameVC : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) float timeForGame;

@end

NS_ASSUME_NONNULL_END
