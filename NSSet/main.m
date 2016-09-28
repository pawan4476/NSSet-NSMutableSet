//
//  main.m
//  NSSet
//
//  Created by Nagam Pawan on 9/26/16.
//  Copyright © 2016 Nagam Pawan. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSSet *americanMakes = [NSSet setWithObjects:@"Chryslar", @"Ford", @"General Motors", @"Tata", nil];
        NSLog(@"%@", americanMakes);
        NSArray *japaneseMake = @[@"Honda", @"Mazda", @"Mitsubushi", @"Hondai"];
        NSSet *uniqueMakes = [NSSet setWithArray:japaneseMake];
        NSLog(@"%@", uniqueMakes);
        
        //Enumerating Set :
        NSSet *models = [NSSet setWithObjects:@"Civic", @"Accord", @"Odyses", @"Pilot", @"Fit", nil];
        NSLog(@"The set has %li elements", [models count]);
        for (id item in models) {
            NSLog(@"%@", item);
        }
            [models enumerateObjectsUsingBlock:^(id obj, BOOL *stop){
                NSLog(@"Current item: %@", obj);
                if ([obj isEqualToString:@"Fit"]) {
                NSLog(@"I waslooking for a Honda Fit, and i found it!");
                *stop = YES;
                }
            }];
            
            //Comparing Sets :
            NSSet *japaneseMake1 = [NSSet setWithObjects:@"Honda", @"Nissan", @"Mitsubishi", @"Toyota", nil];
            NSSet *johnsFavouriteMake = [NSSet setWithObjects:@"Honda", nil];
            NSSet *marysFavouriteMake = [NSSet setWithObjects:@"Toyato", @"Alfa Romeo", nil];
            if ([johnsFavouriteMake isEqualToSet:japaneseMake1]) {
                NSLog(@"John likes all the Japanese auto makers and no others");
            }
            if ([johnsFavouriteMake intersectsSet:japaneseMake1]) {
                NSLog(@"John likes atleast one japanese auoto make");
            }
            if ([johnsFavouriteMake isSubsetOfSet:japaneseMake1]) {
                NSLog(@"All of the auto makers that john likes are japanese");
            }
            if ([marysFavouriteMake isSubsetOfSet:japaneseMake1]) {
                NSLog(@"All of the auto makers that mary likes are japanese");
            }
            
            //Membership Checking :
            NSSet *selectedMakes = [NSSet setWithObjects:@"Maserati", @"Porsche", nil];
            if ([selectedMakes containsObject:@"Maserati"]) {
                NSLog(@"The user seems to like expansive cars");
            }
            NSString *result = [selectedMakes member:@"Maserati"];
            if (result != nil) {
                NSLog(@"%@ is one of the selected makes", result);
            }
            
            //Filtering Sets :
            NSSet *toyotaModels = [NSSet setWithObjects:@"Corolla", @"Sienna", @"Canry", @"Prius", @"Highlander", @"Sequoia", nil];
            NSSet *cModels = [toyotaModels objectsPassingTest:^BOOL(id obj, BOOL *stop){
                if ([obj hasPrefix:@"C"]) {
                    return YES;
                }
                else{
                    return NO;
                }
            }];
            
            NSLog(@"%@",cModels);
        
        //Combining Sets :
        NSSet *affordableMake = [NSSet setWithObjects:@"Honda", @"Nissan", @"Ford", @"toyota", nil];
        NSSet *fancyMake = [NSSet setWithObjects:@"Ferrari", @"Maserati", @"Porsche", nil];
        NSSet *allMakes = [affordableMake setByAddingObjectsFromSet:fancyMake];
        NSLog(@"%@", allMakes);
        
        //NSMutable Set:
        NSMutableSet *brokenCars = [NSMutableSet setWithObjects:@"Honda Civic", @"Nissan Verna", nil];
        NSLog(@"%@", brokenCars);
        
        //Removing andAdding Objects:
        NSMutableSet *brokenCars1 = [NSMutableSet setWithObjects:@"Honda Civic", @"Nissan Verna", nil];
        NSMutableSet *repairedCars = [NSMutableSet setWithCapacity:5];
        [brokenCars1 removeObject:@"Honda Civic"];
        NSLog(@"%@", brokenCars1);
        [repairedCars addObject:@"Honda Civic"];
        NSLog(@"%@", repairedCars);
        
        //Filtering with Predicates :
        NSMutableSet *toyotaModels1 = [NSMutableSet setWithObjects:@"Corolla", @"Sienna", @"Camry", @"Prius", @"Highlander", @"Sequoia", nil];
        NSPredicate *startWithc = [NSPredicate predicateWithBlock:^BOOL(id evaluatedobj, NSDictionary *bindings){
            if ([evaluatedobj hasPrefix:@"C"]) {
                return YES;
            }
            else{
                return NO;
            }
        }];
        [toyotaModels1 filterUsingPredicate:startWithc];
        NSLog(@"%@", toyotaModels1);
            
        //Set Theory Operations :
        NSSet *japaneseMakes = [NSSet setWithObjects:@"Corolla", @"Sienna", @"Camry", @"Prius", @"Highlander", @"Sequoia", nil];
        NSSet *johnsFavoriteMakes = [NSSet setWithObjects:@"Honda", nil];
        NSSet *marysFavoriteMakes = [NSSet setWithObjects:@"Toyota",
                                     @"Alfa Romeo", nil];
        
        NSMutableSet *result1 = [NSMutableSet setWithCapacity:5];
        [result1 setSet:johnsFavoriteMakes];
        [result1 unionSet:marysFavoriteMakes];
        NSLog(@"Either John's or Mary's favorites: %@", result1);
        [result1 setSet:johnsFavoriteMakes];
        [result1 intersectSet:japaneseMakes];
        NSLog(@"John's favorite Japanese makes: %@", result1);
        [result1 setSet:japaneseMakes];
        [result1 minusSet:johnsFavoriteMakes];
        NSLog(@"Japanese makes that are not John's favorites: %@",
              result1);

        //Enumeration Conditions :
        NSMutableSet *makes1 = [NSMutableSet setWithObjects:@"Ford", @"Honda",
                               @"Nissan", @"Toyota", nil];
        NSArray *snapshot = [makes1 allObjects];
        for (NSString *make in snapshot) {
            NSLog(@"%@", make);
            if ([make hasPrefix:@"T"]) {
                [makes1 removeObject:@"Toyota"];
            }
        }
        NSLog(@"%@", makes1);
        
        //NSCountedSet :
        NSCountedSet *inventory = [NSCountedSet setWithCapacity:5];
        [inventory addObject:@"Honda Accord"];
        [inventory addObject:@"Honda Accord"];
        [inventory addObject:@"Nissan Altima"];
        NSLog(@"There are %li Accords in stock and %li Altima",
              [inventory countForObject:@"Honda Accord"],
              [inventory countForObject:@"Nissan Altima"]);
        }
    return 0;
}
