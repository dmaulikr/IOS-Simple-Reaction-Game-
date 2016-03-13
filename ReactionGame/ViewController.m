//
//  ViewController.m
//  ReactionGame
//
//  Created by Ashikul Islam Tamal on 3/13/16.
//  Copyright © 2016 Ashikul Islam Tamal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    scoreInt = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startstopButton:(id)sender {
    if(scoreInt == 0){
        countInt = 3;
        self.getReadyLabel.text = [NSString stringWithFormat:@"%i", countInt];
        self.timerLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startCounter) userInfo:nil repeats:YES];
        [sender setTitle:@"Stop" forState:UIControlStateNormal  ];
    }else{
        [timerScore invalidate];
    }
    if(countInt == 0){
        scoreInt = 0;
        [sender setTitle:@"Re-Start" forState:UIControlStateNormal  ];
        
    }
    
}
-(void)startCounter{
    countInt -= 1;
    self.getReadyLabel.text = [NSString stringWithFormat:@"%i", countInt];
    if(countInt == 0){
        [timer invalidate];
        
        scoreInt = 0;
        
        self.timerLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
        timerScore = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(scoreCounter) userInfo:nil repeats:YES];
    }
}
-(void)scoreCounter{
    scoreInt += 1;
    self.timerLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
}
@end
