//
//  NRSoundManager.h
//  NR_Memory_Game
//
//  Created by MacBook on 12/27/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NRSoundManager : NSObject

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;


-(void) playShuffleCards;

-(void) playSoundMatched;

-(void) playSoundNotMatch;

-(void) playSoundCardFlip;


@end

NS_ASSUME_NONNULL_END
