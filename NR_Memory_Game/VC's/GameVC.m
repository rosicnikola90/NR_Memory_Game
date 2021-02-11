//
//  GameVC.m
//  NR_Memory_Game
//
//  Created by MacBook on 12/20/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

#import "GameVC.h"

@interface GameVC ()

@property (strong, nonatomic) NRGameManager *gameManager;
@property (nonatomic) int flippedCards;
@property (strong, nonatomic) NSIndexPath *selectedCellIndexPath;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *GameTimeLabel;
@property (strong, nonatomic) NSTimer *gameTimer;

@property(strong, nonatomic) NRSoundManager *soundManager;


@end

@implementation GameVC

int _score = 0;

float _timeForGame = 0;

- (void)viewDidLoad {
    //self.timeForGame = 30.0;
    [self.collectionView setDelegate:self];
    [self.collectionView setDataSource:self];
    [super viewDidLoad];
    self.gameManager = [NRGameManager new];
    [self.gameManager setCardsForPlay];
    
    self.soundManager = [[NRSoundManager alloc] init];
    [self.soundManager playShuffleCards];
    self.gameManager.matchedPairs = 0;
    self.flippedCards = 0;
    self.selectedCellIndexPath = nil;
    self.gameTimer = [self activateGameTimer];
    
    [[NSRunLoop mainRunLoop] addTimer:self.gameTimer forMode:NSRunLoopCommonModes];
    
    //_timeForGame = 100.00;
    //[self.gameManager setMatchedPairs:7];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //return self.gameManager.cardsForPlay.count;
    return self.gameManager.cardsForPlay.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
     NRCardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"gameCell" forIndexPath:indexPath];
    NRCard *card = self.gameManager.cardsForPlay[indexPath.row];
    [cell setCellWithCard:card];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.flippedCards < 2) {
        
        if ([[collectionView cellForItemAtIndexPath:indexPath] isKindOfClass:[NRCardCell class]]) {
            
           // Card *card = self.gameManager.cardsForPlay[indexPath.row];
            NRCard *card = self.gameManager.cardsForPlay[indexPath.row];
            NRCardCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
            
            if (!card.isFlipped) {
            
            self.flippedCards ++ ;
            [cell flippCard:card];
            [card setIsFlipped:true];
            [self.soundManager playSoundCardFlip];
                
                if (self.flippedCards == 1) {
                    self.selectedCellIndexPath = indexPath;
                }
                
            if (self.flippedCards == 2) {
                
                //Card *previusCard = self.gameManager.cardsForPlay[self.selectedCellIndexPath.row];
                   NRCard *previusCard = self.gameManager.cardsForPlay[self.selectedCellIndexPath.row];
                NRCardCell *previusSelectedCell = [collectionView cellForItemAtIndexPath:self.selectedCellIndexPath];
                
                if ([card.cardName isEqualToString:previusCard.cardName]) {
                    
                    [self.soundManager playSoundMatched];
                    
                    [card setIsMatched:true];
                    [previusCard setIsMatched:true];
                    
                    [self.gameManager setMatchedPairs:++self.gameManager.matchedPairs];
                    
                    [cell setCardMatched];
                    [previusSelectedCell setCardMatched];

                    self.selectedCellIndexPath = nil;
                    self.flippedCards = 0;
                    
                    [self checkIfGameEnded];
                    _score += 10 ;
                }
                else {
                    [self.soundManager playSoundNotMatch];
                    [cell flippBackCard];
                    [previusSelectedCell flippBackCard];
                    [card setIsFlipped:false];
                    [previusCard setIsFlipped:false];
                    
                    self.selectedCellIndexPath = nil;
                    
                }
                // resetovanje brojaca
                self.flippedCards = 0;
                
                }
            }
        }
    }
}

#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width/5, self.view.frame.size.height/2.5) ;
}

#pragma mark <custom methods>



-(NSTimer*) activateGameTimer {
    
    return [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(gameTimerAction) userInfo:nil repeats:true];
}

-(void) gameTimerAction {
    
        if (_timeForGame <= 0.0) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSString *score = [[NSString alloc] initWithFormat:@"You scored : %d", _score ];
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:score message:@"game over" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"back to start" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    [self.navigationController popViewControllerAnimated:true];
                }];
                [alert addAction:action];
                
                [self presentViewController:alert animated:true completion:nil];
                
            });
            
            [self.gameTimer invalidate];
            
        }
        else {
            [self.GameTimeLabel setText:[NSString stringWithFormat: @"%.1f",_timeForGame]];
            _timeForGame -= 0.1 ;
        }
    
        if (_timeForGame < 5.0) {
            [self.GameTimeLabel setTextColor:UIColor.redColor];
        }
   
}

-(void) checkIfGameEnded {
        if (self.gameManager.matchedPairs == self.gameManager.cardsForPlay.count/2) {
            [_gameTimer invalidate];
            _score = 80 + (int)(_timeForGame * 2);
            
            NSString *score = [[NSString alloc] initWithFormat:@"You scored : %d", _score ];
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"BRAVO" message:score preferredStyle:UIAlertControllerStyleAlert];
           
            
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                [self.navigationController popViewControllerAnimated:true];
                
            }];
            [alert addAction:action];
            
            [self presentViewController:alert animated:true completion:nil];
        }
}

- (void)dealloc
{
    NSLog(@"dealock GameVC");
}
@end
