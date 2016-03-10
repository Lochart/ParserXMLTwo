//
//  ViewController.m
//  XMLParserTwo
//
//  Created by Nikolay on 08.03.16.
//  Copyright © 2016 Nikolay. All rights reserved.
//

#import "ViewController.h"
#import "SchulXMLParser.h"

@interface ViewController ()
- (IBAction)parserXML:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *textParserXML;
@property (nonatomic, strong) NSXMLParser* xmlparser;
@property (nonatomic, strong) SchulXMLParser* schulXMLParser;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)parserXML:(id)sender {
    
    NSURL* url = [NSURL URLWithString:@"https://www.youtube.com/watch?v=PU92i_A-K6o"];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLResponse* response;
    NSError* error;
    
    NSData* data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    
    if (error) {
        NSLog(@"Fehler: %@", error);
    }
    
    NSLog(@"data: = %@", data);
    NSString* dataString = [[NSString alloc] initWithData:data
                                                 encoding:NSASCIIStringEncoding];
   
    self.textParserXML.text = dataString;
    NSLog(@"dataAsString = %@", dataString);
    
    self.schulXMLParser = [[SchulXMLParser alloc]init];
    
    self.xmlparser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    self.xmlparser.delegate = self.schulXMLParser;
    [self.xmlparser parse];
}
@end
