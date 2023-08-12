<img src="https://firebasestorage.googleapis.com/v0/b/easy-money-76612.appspot.com/o/EasyMoney-logo.png?alt=media&token=99769e3d-eadf-4b97-b39c-d36e940d5177" alt="logo" width="180"/>

# EasyMoney

A new Flutter project.

## EasyMoney Mobile App using Flutter development with GetX.

### Structure in modules

```yaml
- /app
# This is where all the application's directories will be contained
    - /core
        - /constants
            - colors.dart
            - constants.dart
            - strings.dart
        - /themes
        #Here we can create themes for our widgets, texts and colors
            - text_theme.dart
            # inside ex: final textTitle = TextStyle(fontSize: 30)
            - color_theme.dart
            # inside ex: final colorCard = Color(0xffEDEDEE)
            - app_theme.dart
            # inside ex: final textTheme = TextTheme(headline1: TextStyle(color: colorCard))
            - themes.dart
        - /translations
                - /en_us
                    - en_us_translation.dart
                    - strings_en_us.dart
                - /km_khmer
                    - km_khmer_translation.dart
                    - strings_km_khmer.dart
                - app_translations.dart
                - translations.dart
        - /utils
        #Here you can insert utilities for your application, such as masks, form keys or widgets
            - keys.dart
            # inside ex: static final GlobalKey formKey = GlobalKey<FormState>();
            - masks.dart
            # inside ex: static final maskCPF = MaskTextInputFormatter(mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
            - helpers.dart
            - extension_x.dart
            # Use classes to make your variables easier to use, eg Keys.myKey, Masks.maskCPF
            - utils.dart
        - /widgets
        # Widgets that can be reused by multiple **modules**.
        - core.dart

    - /data
    # Directory responsible for containing everything related to our data
        - /services
            # This is where we store our Services
            # Here our repositories are just classes that will mediate the communication between our controller and our data.
            # Our controllers won't need to know where the data comes from, and you can use more than one repository on a controller if you need to.
            # The repositories must be separated by entities, and can almost always be based on their database tables.
            # And inside it will contain all its functions that will request data from a local api or database.
            # That is, if we have a user table that we will persist as, edit, add, update and delete, all these functions are requested
            # from an api, we will have a repository with this object of the api where we will call all the respective
            # functions to the user. So the controller does not need to know where it comes from, the repository being a
            # mandatory attribute for the controllers in this model, you should always initialize the controller with at - /repository
            - /example_service.dart
                - service.dart

        - /providers
        # Our data provider, can be an api, local database or firebase for example.
            - api_provider.dart
            - db_provider.dart
            - storage_provider.dart
        # Here, our asynchronous data request, http, local database functions must remain ...
        - /models
        # Our classes, or data models responsible for abstracting our objects.
            - models.dart
        - /repositories.dart
            - repositories.dart
            #Repositories then become just a class to point to the controllers of our module, which and which provider we are going to consume, the same goes for services, services that have integration with some provider, must have its own repository
        - data.dart

    - /modules
    # Each module consists of a page, its respective GetXController and its dependencies or Bindings.
    # We treat each screen as an independent module, as it has its only controller, and can also contain its dependencies.
    # If you use reusable widgets in this, and only in this module, you can choose to add a folder for them.
        - /my_module
            - page.dart
            - controller.dart
            - binding.dart
            - /local_widgets
            - my_module.dart
    # The Binding class is a class that decouples dependency injection, while "binding" routes to the state manager and the dependency manager.
    # This lets you know which screen is being displayed when a specific controller is used and knows where and how to dispose of it.
    # In addition, the Binding class allows you to have SmartManager configuration control.
    # You can configure how dependencies are to be organized and remove a route from the stack, or when the widget used for disposition, or none of them.
    #The decision to transfer the repositories "globally" to internal modes within each module is that we can use a function in different modules, but the problem was due to having to import more than one repository in the controller, so we can repeat the same calls functions, internal repositories, thus maintaining faster maintenance, making everything that gives life to the module reachable through the module itself.

    - /routes
    # In this repository we will deposit our routes and pages.
    # We chose to separate into two files, and two classes, one being routes.dart, containing its constant routes and the other for routing.
        - routes.dart
        # class Routes {
        # This file will contain your constants ex:
        # class Routes { const HOME = '/ home'; }
        - pages.dart
        # This file will contain your array routing ex :
        # class AppPages { static final pages = [
        #  GetPage(name: Routes.HOME, page:()=> HomePage())
        # ]};
        - routes.dart

- main.dart
# main file
```

### Explaining

#### Data

Here we won't have much to discuss, it is just a repository where you will abstract / package EVERYTHING related to your data, your models, your services and data providers. If you choose to use the module version, Data will have the same role, leaving your data available for all your modules, leaving only what is vital for your module in it !!  
This was designed so that you can keep your directory structure as small as possible when working with flutter, and at the same time, be intuitive and didactic to speed up your learning curve.

#### Provider

obs: In some other structures, the term 'provider' can be approached in various ways, but here, it exists only and exclusively, to make http requests or persistence in a database. If you use both, create the respective directories and / or files within it.  
If there are many requests, in a single file, you can choose to separate by entities, or keep it in the same file, this is a personal choice and it is up to each programmer.

#### model

In our model class we will have our attributes and two methods, toJson and fromJson responsible for converting our object to json or a json to our object.  
Generally when we work with API's, we use these methods to create objects from our api's response, or create a json to send to our api.

#### Repository

The repository is now responsible only for grouping the functionalities of the providers consumed by the controller of that module, in order to map the use of the providers and to group their calls.

### Module

The modules will contain our respective Binding, Page, Controller.  
This makes the project shorter and easier to maintain.

#### Controller

Controllers are the vital part of your application, in which you will create your .obs variables which will store values ​​that can be changed during the application.  
Your controller is also responsible for consuming your data>, through its repositories, which in turn only perform data calls from your providers
Rule: Every controller must have one, and only one, repository, which is an attribute required to initialize your controller in your GetX widget.  
If you need data from two different repositories on the same page, you must use two GetX widgets. We recommend that there is at least one controller for each page.  
There is only one exception so that you can use the same controller for several pages, and it is quite simple:

IMPORTANT  
You can use a controller on several pages, only and exclusively, if the data on all pages, consume a single repository.

The purpose of this is to get you to use GetX and take full advantage of its power, so whenever you need to manipulate two entities, you will need two different controllers and a view.  
Why? Imagine that you have a controller with two repositories, and that controller is being used with a GetX widget on a page, using data retrieved by the controller from the two repositories.  
Whenever an entity is modified, the controller will update its widgets responsible for the two variables, one of which did not need to be changed. So separating a repository by controller, it can be a good practice when working with the GetX widget, having a responsible controller for each widget, which somehow shows this information from them, rendering only the widget that had its .obs variable changed. .

#### Bindings

Ideal for your dependency management, bindings can initialize your controllers and repositories, apis and whatever you need, without having to call them directly from View with GetView<YourController>!

#### Page

Your module interface using YourPage extends GetView<YourController>.

```yaml
GetX Pattern: [GetXPattern](https://github.com/kauemurakami/getx_pattern)
```
# Installation

First you need to clone project by

```bash
git clone https://github.com/CSG6Project1/easymoney_development.git
```

After project cloned successfully, please run

```bash
cd easymoney_development
flutter pub get
```
Then open project in Android Studio or your favorite IDE. Then open your emulator or simulator and run project.

For API we deployed on Digitalocean with free trial plan. If you have some error with api, please clone and run [EasyMoney Laravel](https://gitlab.com/ossas201/easy_money_laravel) 

After you run laravel project successful, please modify in `lib/app/core/constants/api_constants.dart`

For ios simulator or ios device
```bash
// local api for ios simulator or ios device
String baseUri = 'http://localhost:8000/';

// local api for Android emulator or Android device
// String baseUri = 'http://10.0.0.2:8000/';

// deployed api
// String baseUri = 'https://easymoney-oqwya.ondigitalocean.app/';
```

For Android emulator or Android device
```bash
// local api for ios simulator or ios device
// String baseUri = 'http://localhost:8000/';

// local api for Android emulator or Android device
String baseUri = 'http://10.0.0.2:8000/';

// deployed api
// String baseUri = 'https://easymoney-oqwya.ondigitalocean.app/';
```

Now you can test or run app without any error.