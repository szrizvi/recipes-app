### Summary: Include screen shots or a video of your app highlighting its features

This app displays a single page with a list of recipes fetched from an API. Users can refresh the list by swiping up, or, when no recipes are available, by pressing the refresh button.

Normal case:  

https://github.com/user-attachments/assets/c472e932-1cce-4ecc-a7fc-8f07200bc8d8

<img src="https://github.com/user-attachments/assets/596edcca-928a-4e09-8002-06254ff06b80" alt="Simulator Screenshot" width="200" />  

Empty recipes list:  

<img src="https://github.com/user-attachments/assets/1dd94662-dd97-484c-af54-ead273e248c1" alt="Simulator Screenshot" width="200" />  

Malformed data:  

<img src="https://github.com/user-attachments/assets/e3ef37da-8a4b-492a-b008-54a8e89236b7" alt="Simulator Screenshot" width="200" />



### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
Prioritized image caching and correctly getting/decoding data from the API. I kept the UI simple to keep the focus on how data is being stored/presented, as I felt this would involve the most complexity.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

about 6 hours: 1 hr on set up and familiarizing myself with the project requirements, 1hr on all UI components
(main content view + empty views), 1/2 hr on getting data from API/ViewModel code, 2-3 hrs on image caching, 1-2 hrs on unit tests.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
I did not include any optional info - I wanted to add a link to the recipe url by tapping on the image, but left this out in the interest of time.
I was debating whether to utilize the NSCache to cache images, but decided to go with a simpler approach by just creating a wrapper for AsyncImage with a custom cache.

### Weakest Part of the Project: What do you think is the weakest part of your project?
I could have had more coverage in my unit tests, I did not include tests for all cases where the API could fail. I also could have implemented the caching to be persistent, at the moment it is not.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
Not sure if this was an API error or in my implementation, but when trying to add the youtube url or the original recipe URL, I got an error stating the field does not exist. I didn't debug it as it was an optional feature.


