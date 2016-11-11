//
//  ViewController.h
//  SearchME
//
//  Created by Student P_03 on 11/11/16.
//  Copyright © 2016 AkshayAwtade. All rights reserved.


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSArray *placesArray;
    NSMutableArray *nameArray;
    NSMutableArray* dic1;
    NSMutableArray *arrayVicinity;
    NSMutableDictionary *dictionary;
    BOOL flag;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

