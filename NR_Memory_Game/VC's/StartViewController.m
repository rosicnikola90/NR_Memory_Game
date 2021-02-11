//
//  ViewController.m
//  NR_Memory_Game
//
//  Created by MacBook on 12/20/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

#import "StartViewController.h"


@interface StartViewController ()
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (nonatomic) float chosenTimeForGame;
@property (weak, nonatomic) IBOutlet UISwitch *switch30;
@property (weak, nonatomic) IBOutlet UISwitch *switch50;


@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.startButton.layer.cornerRadius = 5;
    NSURL *dataFilePath = [NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
    [dataFilePath URLByAppendingPathComponent:@"scores.plist"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"goToGame"]) {
        GameVC *gameVC = segue.destinationViewController;
        if (self.switch30.isOn) {
            self.chosenTimeForGame = 30.0;
        }
        else {
            self.chosenTimeForGame = 50.0;
        }
        gameVC.timeForGame = self.chosenTimeForGame ;
    }
}

- (IBAction)startButtonPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"goToGame" sender:self];
}

- (IBAction)switch30Action:(UISwitch *)sender {
    if (sender.tag == 30) {
        if (self.switch30.isOn){
            [self.switch50 setOn:false];
        }
        else {
            [self.switch50 setOn:true];
        }
    }
    else {
        if (self.switch50.isOn){
            [self.switch30 setOn:false];
        }
        else {
            [self.switch30 setOn:true];
        }
        
    }
}


@end
