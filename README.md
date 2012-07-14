#CocoaPodsExample

An example project that demonstrates how to set up and use [CocoaPods](https://github.com/CocoaPods).  I created this project for a 10 minute demonstration at the July 2012 [PhillyCocoa](http://phillycocoa.org/) meetup.  This example project was made and tested with CocoaPods 0.8.0, and I can't guarantee it will continue to work for newer versions.

##Instructions

###Install CocoaPods

CocoaPods installs as a ruby gem.  Installing the latest version is as simple as opening terminal and typing the following command:

    [sudo] gem install cocoapods

The `sudo` prefix may not be necessary, depending on your system.  This may take a while as it downloads the required Ruby packages to your machine.

*NOTE: CocoaPods version 0.9.0 may require a newer version of Ruby than comes installed with Lion.  I'll update this guide when I have more information.*

###Build and Run

You should be able to open `CocoaPodsExample.xcodeproj` and build and run in the simulator or on a device immediately.  It's a basic application that doesn't really do anything besides display a picture.  We're going to modify it so people can share a link to the example project to Twitter of Facebook.

###Open the Podfile

The `Podfile` is where you declare your project's exernal dependencies.  You can search for compatible pods on [cocoapods.org](cocoapods.org) or from the command line by typing `pod search [name]`.  Open `Podfile` with your favorite text editor.  The file should look like this:

    platform :ios, :deployment_target => '5.1'
    
    pod 'ShareKit/Facebook'
    pod 'ShareKit/Twitter'

*(We'll ignore the lines at the bottom that start with `#` for now.)*

* The first line declares whether your project is targeting iOS or Mac OS and the deployment target.
* The lines beginning with `pod` declare your project's external dependencies.  You can also specify the version number, where to look for the podSpec, and the preferred location of the source, if you have a private branch you'd like to use.  In this case, we're declaring we need the Facebook and Twitter portions of ShareKit.

###Install Pods

Close the project if you still have it open in Xcode.  In terminal, go to the folder that includes `CocoaPodsExample.xcodeproj` and `Podfile`, then type the following command:

    pod install

You'll see CocoaPods go to work, downloading the dependencies you declared, and also downloading all of their dependencies.  The interesting part is at the end:

    Generating support files
    [!] From now on use `CocoaPodsExample.xcworkspace`.

###Open the Workspace

Instead of opening `CocoaPodsExample.xcodeproj`, find and open `CocoaPodsExample.xcworkspace`.  You'll immediately notice CocoaPods downloaded all of your dependencies into a new project called `Pods`.  Now let's get back to adding the sharing functionality to the project.

###Add Sharing Functionality to the Project

* Right click on `CocoaPodsExample` and select "Add files to "CocoaPodsExample"...".  Navigate to `CocoaPodsExample/CocoaPodsExample/ShareKit`, select the folder, make sure "Create groups for any added folders" is selected and hit Add.
* In `JIAppDelegate.m`, uncomment the three `#import` statements on lines 12, 13 and 14, and uncomment the first two lines in `-[application:didFinishLaunchingWithOptions:]`.
* In `JIMainViewController.m` uncomment the `#import` statement on line 10 and uncomment the four lines in `-[share:]`.

###Build and Run

Now, when you hit the action button, you'll be presented with the options to share a link via Facebook, Twitter, email, or to open the link in Safari.

##Bonus Round!

There are lots of times when you may want to add a dependency to your project, but only for a specific target, the most obvious one is for testing.  This section will cover how to add [Kiwi](https://github.com/allending/Kiwi) to the example project.

###Adding a Dependency For a Specific Target

Open the Podfile and uncomment the last three lines by deleting the leading `#` characters.  The end result should be this:

    target :CocoaPodsExampleTests, :exclusive => true do
        pod 'Kiwi'
    end

This tells CocoaPods to only associate this pod with the `CocoaPodsExampleTests` target in your project.  Now do another `pod install`.  In CocoaPodsExample, add `CocoaPodsExample/CocoaPodsExampleTests/MathSpec.m` to the project.  Make sure the Test target is checked and not the main target.  Now, if you Build and Test, and look in the build results, you should see the test MathSpec executed and passed 1 test.