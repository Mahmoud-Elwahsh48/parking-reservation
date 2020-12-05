@Walkthrough
Feature: Parking Reservation Walkthrough

@MainMenu
Scenario: Create owner then create offer with Owner then delete offer and then logout owner
Given open parking reservation app
Then owner signup
Then validate owner signup
Then create offer
Then create offer
Then create offer
Then delete offer
Then owner log out
Then visitor log in
Then visitor signup
Then validate visitor signup
Then select offer
Then visitor log out
