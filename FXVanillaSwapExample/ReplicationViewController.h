//
//  ReplicationViewController.h
//  QuantLibExample
//
//  Created by colman on 15.07.13.
//  Copyright (c) 2013 Striding Edge Technologies. All rights reserved.
//

#import "ViewController.h"
#import "Replication.h"

@interface ReplicationViewController : ViewController {
    Replication * replication;
    
}

-(IBAction)calculateReplication:(id)sender;

@end
