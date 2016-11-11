//
//  ViewController.m
//  SearchME
//
//  Created by Student P_03 on 11/11/16.
//  Copyright © 2016 AkshayAwtade. All rights reserved.
//
#define kGooglePlaceAPIKey @"AIzaSyBN_r-ix42vseV8BV4MJF9E3iBayHqdEu8"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    flag=NO;
    placesArray=@[@"ATM",@"Airport",@"Bank",@"Bus Station",@"Dentist",@"Doctor",@"Electcrician",@"Fire_Station",@"Gym",@"Hospital",@"Library",@"Lodging",@"School",@"restaurant",@"Police",@"Post_Office",@"Train_Station",@"Local_Government_Office"];
    [self fetchdata];
    NSLog(@"%@",arrayVicinity);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)fetchdata{
    NSString *urlString=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&type=restaurant&keyword=cruise&key=%@",kGooglePlaceAPIKey];
    NSURL*url=[NSURL URLWithString:urlString];
    NSURLSession *session =[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask * task=[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error)
        {
            NSLog(@"%@",error.localizedDescription);
        }
        else if(response)
        {
            NSHTTPURLResponse *httpResponse=(NSHTTPURLResponse*)response;
            if(httpResponse.statusCode==200)

            {
                if(data)
                {
                    NSError *error;
                   dictionary=[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                    if(error)
                    {
                        NSLog(@"%@",error.localizedDescription);
                    }
                    else{
                        [self performSelectorOnMainThread:@selector(updateUI:) withObject:dictionary waitUntilDone:YES];
                    }
                }
                else{
                    NSLog(@"No data found");
                }
            }
                else
                {
                    NSLog(@"HTTPResponseCode!=200");
                }
                
            }
        else{
            NSLog(@"NO response");
        }
    
    }];[task resume];
}
-(void)updateUI:(NSDictionary *)dictionaryPlaces
{
    NSLog(@"%@",dictionaryPlaces);
    dic1=[dictionaryPlaces valueForKey:@"results"];
        nameArray=[dic1 valueForKey:@"name"];
        arrayVicinity=[dic1  valueForKey:@"vicinity"];
    
    NSLog(@"%@, %@",arrayVicinity,nameArray);

}




@end
