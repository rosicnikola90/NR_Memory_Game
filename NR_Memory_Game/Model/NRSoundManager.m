//
//  NRSoundManager.m
//  NR_Memory_Game
//
//  Created by MacBook on 12/27/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

#import "NRSoundManager.h"

@implementation NRSoundManager

-(void) playShuffleCards {
    NSString *name = @"shuffle";
    [self playSoundForFileName:name];
}

-(void) playSoundMatched {
    NSString *name = @"dingcorrect";
    [self playSoundForFileName:name];
}

-(void) playSoundNotMatch {
    NSString *name = @"dingwrong";
    [self playSoundForFileName:name];
}

-(void) playSoundCardFlip {
    NSString *name = @"cardflip";
    [self playSoundForFileName:name];
}

-(void) playSoundForFileName: (NSString*) name {
    
    NSString *FilePath = [[NSBundle mainBundle] pathForResource:name ofType:@"wav"];
    NSURL *urlForSoudFile = [NSURL URLWithString:FilePath];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:urlForSoudFile error:nil];
    
    [self.audioPlayer play];
}

@end
