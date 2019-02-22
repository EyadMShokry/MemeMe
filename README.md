# MemeMe
MemeMe is a meme-generating app that enables a user to attach a caption to a picture from their phone. After adding text to an image chosen from the Photo Album or Camera, the user can share it with friends. MemeMe also temporarily stores sent memes which users can browse in a table or a grid.


## Why This Project?
MemeMe covers many of the major UI components found in essentially every app. It combines them with the camera and social media activity view to create a fun and personal user experience.

## What did I learn?
- Set up a navigation structure that creates an intuitive flow through the app
- Build tables with datasources and delegates
- Create custom table view cells
- Implement user interfaces with tab views and collection views

## Why is this project meaningful to my career?
- Becoming comfortable using all of the key components of UIKit is an essential step in becoming an iOS developer.
- Understanding UIKit allows a developer to make educated assumptions about the architecture of apps that they use.
- Mastering UKit fundamentals frees a developer up to learn model-oriented skills like networking and persistence.

# Application Scenes
The app has three pages of content:
- **Meme Editor View**: Enables a user to add text to an image and share it. 
- **Sent Memes View**: Enables a user to browse sent memes in a table or a grid.
- **Meme Detail View**: Displays an image of a sent meme
These three scenes are described in detail below.

## Meme Editor View
The **Meme Editor View** consists of an image view overlaid by two text fields, one near the top and one near the bottom of the image. This view has a bottom toolbar with two buttons: one for the camera and one for the photo album. The top navigation bar has a share button on the left displaying Apple’s stock share icon and a “Cancel” button on the right.

<img src="https://lh4.googleusercontent.com/CW4wdLDCw9cZGn36OtIdxTnfp9_PrpERYQAcWmrImMwxpAd3EJQK2J6EhuS9yB5O2uH2-1_FIqOLo8B6kGJT4aTYO2sxq7hMom47rV5jJWCceERsYxUIRDWFH-_trZXO5ZWXj2A" width="360" height="200" />
<img src="https://lh3.googleusercontent.com/V9FCmn_dlVFu7q9FuZICGtGblaqONkRbAr8wxTxcPFhxnaeiZA60Z5LlbGXvBXuXFhI4qX_ykW8_AW487j_epD3ctIkgr4Dwg2RxxhkDSmgH88o8h2PidcAjwMSYeBaK-uuBB10" width="200" height="360" />

## Sent Memes View
The sent memes view displays recently sent memes. It has a bottom toolbar with tabs that allow the user to toggle between viewing sent memes in a table and viewing them in a grid. The top navigation bar has a title that reads “Sent Memes” and an add button in the right corner displaying Apple’s stock “Add” icon.
If the user taps the “table” tab on the left of the bottom toolbar, sent memes are displayed in a table. If the user taps on the “collection” tab on the right of the bottom toolbar, sent memes are displayed in a grid. Selecting a meme from the table or collection presents the **Meme Detail View**. Pressing the “add” button brings up the **Meme Editor View**.  

<img src="https://lh3.googleusercontent.com/HGduRO0ZfhfQcfH3RRbII6ILXcGacdkWJFKQWJOXnAod_QH8vDEPT5kCP9NgoMO_z5P6Yd6d6MqaTEgta1YsIJSGzHX1CXY4cX-4qEpl7y9y_MRsr82B6K7uvLY7BBnwzIMcWm0" width="200" height="360" />
<img src="https://lh3.googleusercontent.com/ah-_BVkQ9T_X5u8XXi2INAjAP4_ZZJWwioBHLw4FItM_kSV9EOpnqj3J9uYMThGmWrKq6MqFEvBar1G1EgbneyMDccCesx2aAozwW4y5fM0JXHCX6UfatF8njH0tvbeVebOsIls" width="200" height="360" />

## Meme Detail View
The **Meme Detail View** displays the selected meme in an image view in the center of the page with the meme’s original aspect ratio. The detail view has a back arrow in the top left corner. To the right of the arrow reads the title of the previous view, “Sent Memes.”

<img src="https://lh5.googleusercontent.com/EjueRpeV0oPHX-KAoJE7G-FShTCbqWKUo6jgeqKfdFgTF2MYEEMiUCFHxtVlhG7OdfqUo7mzNAZNTskUY78SxEYkbmnEj3vBxJjPCcQTBd-PveGjA726TY-l-iqaFMYjHPEGpro" width="200" height="360" />

# User Flow
- When the user first launches the app the **Sent Memes View** will appear. It will be the root view of the navigation stack. When the user taps the + button in the top right corner the app should push the **Meme Editor View** on top of the **Sent Memes View**.
- In the **Meme Editor View**, when the user clicks on the “Album” button, an Image Picker is presented, making it possible to choose an image from the Photo Album. If there is a camera available on the device, pressing the camera button launches the camera, and a newly snapped photo can be chosen for the meme. If a camera is not available on the device, the camera button is disabled.
- After an image is chosen, the image picker is dismissed, allowing text to be entered into the top and bottom text fields of the editor. When a user clicks inside one of the text fields, the default text disappears and the keyboard slides up. When the user finishes entering text and presses return, the keyboard is dismissed and the new meme is displayed.
- When the user presses the share button, Apple’s stock Activity View appears, displaying several options for sharing the meme. After an option is chosen, the Activity View is dismissed and the **Sent Memes View appears**. The **Sent Memes View** also appears upon pressing the “Cancel” button.
- Selecting a meme from the table or collection presents the **Meme Detail View**. Clicking on the  back arrow of the **Meme Detail View** presents the previous **Sent Memes View**, either the table or collection.  
